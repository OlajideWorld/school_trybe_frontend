import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:school_management/common/app_check_function.dart';
import 'package:school_management/models/announce_model.dart';
import 'package:school_management/models/event_model.dart';
import 'package:school_management/models/school_dues.dart';
import 'package:school_management/models/school_model.dart';

import 'package:school_management/models/student_model.dart';
import 'package:school_management/models/student_results.dart';
import 'package:school_management/pages/School%20Dashboard/home%20screen/controller/adminController.dart';

import 'package:school_management/pages/Teacher%20dashboard/AuthPage/view/authentication.dart';

import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';

import '../common/getxmessage.dart';
import '../models/parent_model.dart';
import '../models/teacher_model.dart';
import '../models/usermodel.dart';
import '../routes/routes.dart';

final RegistrationController regController = RegistrationController.instance;
final AdminController adminController = AdminController.instance;

class ApiServices {
  static var client = http.Client();
  String baseurl =
      "https://sleepy-waters-76948-4990868a4e87.herokuapp.com/api/v1/";
  final timeoutDuration = const Duration(seconds: 15);

  // Creation of Admin Profile
  Future signIn(Map<String, dynamic> data, String url) async {
    String reqUrl = "$baseurl$url";
    debugPrint(reqUrl);
    debugPrint(data.toString());

    try {
      http.Response response = await http
          .post(Uri.parse(reqUrl),
              headers: <String, String>{'Content-Type': 'application/json'},
              body: jsonEncode(data))
          .timeout(timeoutDuration);

      if (response.statusCode == 200) {
        debugPrint(response.body);
        var data = jsonDecode(response.body);
        var mapdata = data["user"];
        var token = data["token"];

        UserCredentials jsondata = UserCredentials(
            id: mapdata["_id"],
            firstname: mapdata["firstname"],
            password: mapdata["password"],
            lastname: mapdata["lastname"],
            email: mapdata["email"],
            position: mapdata["position"],
            phoneNumber: mapdata["phoneNumber"],
            country: mapdata["country"],
            address: mapdata["address"],
            notification: mapdata["notification"],
            image: mapdata["image"],
            token: token);

        debugPrint(jsondata.toString());
        getSuccessSnackBar("User SignIn Successfully");
        return jsondata;
      } else {
        var jsondata = jsonDecode(response.body);
        regController.isLoading.value = false;
        Get.back();
        getErrorSnackBar(jsondata["message"]);
      }
    } catch (e) {
      regController.isLoading.value = false;
      Get.back();
      getErrorSnackBar("Error, Server timeout, ${e.toString()}");
      debugPrint(e.toString());
    }
  }

// Login Admin
//
  Future login(Map<String, dynamic> data, String url) async {
    String reqUrl = "$baseurl$url";
    debugPrint(reqUrl);

    debugPrint(data.toString());

    try {
      http.Response response = await http
          .post(Uri.parse(reqUrl),
              headers: <String, String>{'Content-Type': 'application/json'},
              body: jsonEncode(data))
          .timeout(timeoutDuration);

      debugPrint(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var mapdata = data["User"];

        if (mapdata["type"] == 1) {
          regController.type.value = 1;
          var token = data["token"];

          UserCredentials jsondata = UserCredentials(
              id: mapdata["_id"],
              firstname: mapdata["firstname"],
              password: mapdata["password"],
              lastname: mapdata["lastname"],
              email: mapdata["email"],
              position: mapdata["position"],
              phoneNumber: mapdata["phoneNumber"],
              country: mapdata["country"],
              address: mapdata["address"],
              notification: mapdata["notification"],
              image: mapdata["image"],
              token: token);

          getSuccessSnackBar(
              "User Login Successfully, \nGetting your school details");
          return jsondata;
        } else if (mapdata["type"] == 2) {
          regController.type.value = 2;
          var token = data["token"];

          TeacherModel teacherModel = TeacherModel(
            createdBy: mapdata["createdBy"],
            firstname: mapdata["firstname"],
            schoolName: mapdata["schoolName"],
            schoolBanner: mapdata["schoolBanner"],
            image: mapdata["image"],
            password: mapdata["password"],
            email: mapdata["email"],
            lastName: mapdata["lastName"],
            phoneNumber: mapdata["phoneNumber"],
            nin: mapdata["nin"],
            maritalStatus: mapdata["maritalStatus"],
            gender: mapdata["gender"],
            stateOfOrigin: mapdata["stateOfOrigin"],
            className: mapdata["className"],
            classSection: mapdata["classSection"],
            subjectRole: mapdata["subjectRole"],
            nationality: mapdata["nationality"],
            address: mapdata["address"],
            type: mapdata["type"],
            id: mapdata["_id"],
            token: token,
          );
          getSuccessSnackBar("User Data gotten Successfully");
          return teacherModel;
        } else if (mapdata["type"] == 3) {
          regController.type.value = 3;
          var token = data["token"];

          ParentsModel jsonModel = ParentsModel(
              createdBy: mapdata["createdBy"],
              firstname: mapdata["firstname"],
              schoolName: mapdata["schoolName"],
              schoolBanner: mapdata["schoolBanner"],
              image: mapdata["image"],
              password: mapdata["password"],
              email: mapdata["email"],
              lastName: mapdata["lastName"],
              phoneNumber: mapdata["phoneNumber"],
              nin: mapdata["nin"],
              maritalStatus: mapdata["maritalStatus"],
              gender: mapdata["gender"],
              stateOfOrigin: mapdata["stateOfOrigin"],
              childrenId:
                  List<String>.from(mapdata["childrenID"].map((x) => x)),
              nationality: mapdata["nationality"],
              occupation: mapdata["occupation"],
              address: mapdata["address"],
              type: mapdata["type"],
              id: mapdata["_id"],
              token: token);

          getSuccessSnackBar(
              "User Login Successfully, \nGetting your school details");
          return jsonModel;
        }
      } else {
        var jsondata = jsonDecode(response.body);
        regController.isLoading.value = false;
        Get.back();
        getErrorSnackBar(jsondata["message"]);
      }
    } catch (e) {
      debugPrint(e.toString());
      regController.isLoading.value = false;
      Get.back();
      getErrorSnackBar("Error, Server timeout, ${e.toString()}");
    }
  }

  Future getAdminDetails(String id, String url) async {
    String reqUrl = "$baseurl$url/$id";

    debugPrint(reqUrl);

    final token = regController.userCredentials.value.token;
    debugPrint(token);

    try {
      http.Response response = await http.get(Uri.parse(reqUrl),
          headers: <String, String>{
            'Content-Type': 'application/json',
            "Authorization": "Bearer $token"
          }).timeout(timeoutDuration);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var mapdata = data["User"];

        var token = data["token"];

        UserCredentials jsondata = UserCredentials(
            id: mapdata["_id"],
            firstname: mapdata["firstname"],
            password: mapdata["password"],
            lastname: mapdata["lastname"],
            email: mapdata["email"],
            position: mapdata["position"],
            phoneNumber: mapdata["phoneNumber"],
            country: mapdata["country"],
            address: mapdata["address"],
            notification: mapdata["notification"],
            image: mapdata["image"],
            token: token);

        getSuccessSnackBar(
            "User Login Successfully, \nGetting your school details");
        return jsondata;
      } else {
        var jsondata = jsonDecode(response.body);

        getErrorSnackBar(jsondata["message"]);
      }
    } catch (e) {
      debugPrint(e.toString());
      getErrorSnackBar("Error, Server timeout, ${e.toString()}");
    }
  }

// Creation of School Profile
//
  Future<SchoolModel> createSchoool(
      Map<String, dynamic> data, String url) async {
    String reqUrl = "$baseurl$url";

    final token = regController.userCredentials.value.token;
    debugPrint(token);

    SchoolModel schoolModel = SchoolModel(
        createdBy: "",
        image: "",
        schoolName: "",
        email: "",
        phoneNumber: "",
        address: "",
        country: "",
        totalStudentRange: "",
        schoolType: [],
        id: "");

    try {
      http.Response response = await http
          .post(Uri.parse(reqUrl),
              headers: <String, String>{
                'Content-Type': 'application/json',
                "Authorization": "Bearer $token"
              },
              body: jsonEncode(data))
          .timeout(timeoutDuration);

      debugPrint(response.body);
      if (response.statusCode == 200) {
        schoolModel = schoolModelFromJson(response.body);

        getSuccessSnackBar("Success \t School Created Successfuly");

        log("$schoolModel");
      } else {
        var jsondata = jsonDecode(response.body);
        regController.isLoading.value = false;
        getErrorSnackBar(jsondata["message"]);
      }
    } catch (e) {
      regController.isLoading.value = false;
      Get.back();
      getErrorSnackBar("Server timeout, ${e.toString()}");
    }
    return schoolModel;
  }

// Get School details
  Future getSchoolDetails(String url, String id) async {
    debugPrint(id);

    String reqUrl = "$baseurl$url/$id";

    try {
      http.Response response = await http.get(
        Uri.parse(reqUrl),
        headers: <String, String>{'Content-Type': 'application/json'},
      ).timeout(timeoutDuration);

      debugPrint(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var schoolData = data[0];

        var schoolTypeData = schoolData["schoolType"];
        List<String> schoolType = [];

        if (schoolTypeData is List) {
          for (var item in schoolTypeData) {
            if (item is String) {
              schoolType.add(item);
            }
          }
        }

        SchoolModel schoolModel = SchoolModel(
            createdBy: schoolData["createdBy"],
            image: schoolData["image"],
            schoolName: schoolData["schoolName"],
            email: schoolData["email"],
            phoneNumber: schoolData["phoneNumber"],
            address: schoolData["address"],
            country: schoolData["country"],
            totalStudentRange: schoolData["totalStudentRange"],
            schoolType: schoolType,
            id: schoolData["_id"]);

        getSuccessSnackBar("School Details found success");
        return schoolModel;
      } else {
        var jsondata = jsonDecode(response.body);
        regController.isLoading.value = false;
        debugPrint(jsondata["message"]);
        getErrorSnackBar("Wrong QrCode Scanned");
        Get.offAllNamed(TeacherRoutes.authScreen);
      }
    } catch (e) {
      regController.isLoading.value = false;
      Get.offAllNamed(TeacherRoutes.authScreen);
      debugPrint(e.toString());
      getErrorSnackBar("Wrong QrCode Scanned");
    }
  }

  //Change of Password
  Future<RxBool> changePassword(Map<String, dynamic> data, String url) async {
    String reqUrl = "$baseurl$url";
    debugPrint(reqUrl);
    RxBool update = false.obs;
    try {
      http.Response response = await http
          .patch(Uri.parse(reqUrl),
              headers: <String, String>{'Content-Type': 'application/json'},
              body: jsonEncode(data))
          .timeout(timeoutDuration);

      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        getSuccessSnackBar(jsondata['msg']);
        update.value = true;
      } else {
        var jsondata = jsonDecode(response.body);
        regController.isLoading.value = false;
        getErrorSnackBar(jsondata["message"]);
      }
    } catch (e) {
      regController.isLoading.value = false;
      getErrorSnackBar("Error, Server timeout, ${e.toString()}");
    }
    return update;
  }

  // Update Admin Profile
  Future updateAdminProfile(
      Map<String, dynamic> data, String id, String email, String url) async {
    String reqUrl = "$baseurl$url/$id/$email";

    final token = regController.userCredentials.value.token;

    try {
      http.Response response = await http
          .patch(Uri.parse(reqUrl),
              headers: <String, String>{
                'Content-Type': 'application/json',
                "Authorization": "Bearer $token"
              },
              body: jsonEncode(data))
          .timeout(timeoutDuration);

      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        getSuccessSnackBar(jsondata['msg']);
        return true;
      } else {
        var jsondata = jsonDecode(response.body);
        regController.isLoading.value = false;
        getErrorSnackBar(jsondata["message"]);
        return false;
      }
    } catch (e) {
      regController.isLoading.value = false;
      getErrorSnackBar("Error, Server timeout, ${e.toString()}");
      return false;
    }
  }

  //Get All Events
  Future<List<EventsModel>> getEvents(String url) async {
    List<EventsModel> jsondata = [];

    var id = regController.userCredentials.value.id;

    String reqUrl = "$baseurl$url/$id";
    debugPrint(reqUrl);
    try {
      http.Response response = await http.get(
        Uri.parse(reqUrl),
        headers: <String, String>{'Content-Type': 'application/json'},
      ).timeout(timeoutDuration);

      if (response.statusCode == 200) {
        debugPrint(response.body);
        final newData = jsonDecode(response.body);

        for (var data in newData) {
          EventsModel mymodel = EventsModel(
              id: data['_id'],
              createdBy: data['createdBy'],
              image: data['image'],
              title: data['title'],
              venue: data['venue'],
              startTime: DateTime.parse(data["startTime"]),
              stopTime: DateTime.parse(data["stopTime"]),
              date: DateTime.parse(data["date"]),
              description: data['description']);

          jsondata.add(mymodel);
        }
        debugPrint("Success \t Events received");
      } else {
        var jsondata = jsonDecode(response.body);
        adminController.isloadingEvents.value = false;
        getErrorSnackBar(jsondata["message"]);
      }
    } catch (e) {
      adminController.isloadingEvents.value = false;
      debugPrint(e.toString());
      getErrorSnackBar("Error, Server timeout, ${e.toString()}");
    }
    return jsondata;
  }

  // Create Events
  Future createEvents(
      Map<String, dynamic> data, String url, String nature) async {
    final token = regController.userCredentials.value.token;
    debugPrint(token);

    String reqUrl = "$baseurl$url";
    debugPrint(reqUrl);

    try {
      http.Response response = await http
          .post(Uri.parse(reqUrl),
              headers: <String, String>{
                'Content-Type': 'application/json',
                "Authorization": "Bearer $token"
              },
              body: jsonEncode(data))
          .timeout(Duration(seconds: 30));

      debugPrint(response.body);

      if (response.statusCode == 200) {
        getSuccessSnackBar("$nature Created Successfully");
      } else {
        var jsondata = jsonDecode(response.body);
        adminController.isloadingEvents.value = false;
        adminController.isloading.value = false;
        Get.back();
        getErrorSnackBar(jsondata["message"]);
      }
    } catch (e) {
      adminController.isloadingEvents.value = false;
      adminController.isloading.value = false;
      Get.back();
      getErrorSnackBar("Error, Server timeout, ${e.toString()}");
    }
  }

  // Delete Events Or Announcement

  Future deleteEventsAndAnnouncement(
      String id, String url, String message) async {
    String reqUrl = "$baseurl$url/$id";
    final token = regController.userCredentials.value.token;

    try {
      http.Response response = await http.delete(
        Uri.parse(reqUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token"
        },
      ).timeout(timeoutDuration);

      if (response.statusCode == 200) {
        getSuccessSnackBar(message);
        return true;
      } else {
        var jsondata = jsonDecode(response.body);

        getErrorSnackBar(jsondata["message"]);
        return false;
      }
    } catch (e) {
      adminController.isloading.value = false;
      debugPrint(e.toString());
      getErrorSnackBar("Error, Server timeout, ${e.toString()}");
      return false;
    }
  }

  // Get All Announcement
  Future<List<AnnounceModel>> getAnnouncemnet(String url, String id) async {
    List<AnnounceModel> jsondata = [];

    String reqUrl = "$baseurl$url/$id";
    debugPrint(reqUrl);
    try {
      http.Response response = await http.get(
        Uri.parse(reqUrl),
        headers: <String, String>{'Content-Type': 'application/json'},
      ).timeout(timeoutDuration);

      if (response.statusCode == 200) {
        debugPrint(response.body);
        final newData = jsonDecode(response.body);

        for (var data in newData) {
          AnnounceModel mymodel = AnnounceModel(
              id: data['_id'],
              createdBy: data['createdBy'],
              image: data['image'],
              title: data['title'],
              details: data["details"]);

          jsondata.add(mymodel);
        }
        debugPrint("Success \t Announcement received");
      } else {
        var jsondata = jsonDecode(response.body);
        adminController.isloading.value = false;
        getErrorSnackBar(jsondata["message"]);
      }
    } catch (e) {
      adminController.isloading.value = false;
      debugPrint(e.toString());
      getErrorSnackBar("Error, Server timeout, ${e.toString()}");
    }
    return jsondata;
  }

  //Create Student Profile
  Future<StudentModel> createStudentProfile(
      Map<String, dynamic> data, String url) async {
    String reqUrl = "$baseurl$url";

    final token = regController.userCredentials.value.token;
    debugPrint(token);

    StudentModel studentModel = StudentModel(
        createdBy: "",
        image: "",
        firstname: "",
        lastname: "",
        guardianName: "",
        gender: "",
        phoneNumber: "",
        dateOfBirth: DateTime.now(),
        bloodGroup: "",
        address: "",
        classAssigned: "",
        classSection: "",
        studentType: "",
        id: "");

    try {
      http.Response response = await http
          .post(Uri.parse(reqUrl),
              headers: <String, String>{
                'Content-Type': 'application/json',
                "Authorization": "Bearer $token"
              },
              body: jsonEncode(data))
          .timeout(timeoutDuration);

      debugPrint(response.body);

      if (response.statusCode == 200) {
        studentModel = studentModelFromJson(response.body);
        getSuccessSnackBar("Success \t School Created Successfuly");

        debugPrint("$studentModel");
      } else {
        var jsondata = jsonDecode(response.body);
        adminController.isloading.value = false;
        getErrorSnackBar(jsondata["message"]);
      }
    } catch (e) {
      adminController.isloading.value = false;
      debugPrint(e.toString());
      getErrorSnackBar("Server timeout, ${e.toString()}");
    }
    return studentModel;
  }

// Get Student Profile
  Future<List<StudentModel>?> getStudentProfile(
      String createdBy,
      String classAssigned,
      String classSection,
      String gender,
      String url) async {
    String reqUrl =
        "$baseurl$url?createdBy=$createdBy&classAssigned=$classAssigned&classSection=$classSection&gender=$gender";
    debugPrint(reqUrl);

    List<StudentModel> jsondata = [];

    // final token = regController.userCredentials.value.token;
    // debugPrint(token);
    try {
      http.Response response = await http.get(
        Uri.parse(reqUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      ).timeout(timeoutDuration);

      debugPrint(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        for (var newData in data) {
          StudentModel model = StudentModel(
              createdBy: newData["createdBy"],
              image: newData["image"],
              firstname: newData["firstname"],
              lastname: newData["lastname"],
              guardianName: newData["guardianName"],
              gender: newData["gender"],
              phoneNumber: newData["phoneNumber"],
              dateOfBirth: DateTime.parse(newData["dateOfBirth"]),
              bloodGroup: newData["bloodGroup"],
              address: newData["address"],
              classAssigned: newData["classAssigned"],
              classSection: newData["classSection"],
              studentType: newData["studentType"],
              id: newData["_id"]);

          debugPrint(model.toString());

          jsondata.add(model);
        }

        getSuccessSnackBar("Success \nStudents received");
      } else {
        var jsonData = jsonDecode(response.body);
        regController.isLoading.value = false;
        Get.back();
        getErrorSnackBar(jsonData["message"]);
      }
    } catch (e) {
      debugPrint(e.toString());
      regController.isLoading.value = false;
      getErrorSnackBar(e.toString());
    }
    debugPrint(jsondata.toString());
    return jsondata;
  }

  // Get Student with List of Ids
  Future<List<StudentModel>?> getStudentwithIdList(
      Map<String, dynamic> data, String url) async {
    String reqUrl = "$baseurl$url";

    debugPrint(reqUrl);

    List<StudentModel> jsondata = [];

    try {
      http.Response response = await http
          .post(Uri.parse(reqUrl),
              headers: <String, String>{
                'Content-Type': 'application/json',
              },
              body: jsonEncode(data))
          .timeout(timeoutDuration);

      debugPrint(response.body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        for (var newData in data) {
          StudentModel model = StudentModel(
              createdBy: newData["createdBy"],
              image: newData["image"],
              firstname: newData["firstname"],
              lastname: newData["lastname"],
              guardianName: newData["guardianName"],
              gender: newData["gender"],
              phoneNumber: newData["phoneNumber"],
              dateOfBirth: DateTime.parse(newData["dateOfBirth"]),
              bloodGroup: newData["bloodGroup"],
              address: newData["address"],
              classAssigned: newData["classAssigned"],
              classSection: newData["classSection"],
              studentType: newData["studentType"],
              id: newData["_id"]);

          debugPrint(model.toString());

          jsondata.add(model);
        }

        getSuccessSnackBar("Success \nStudents received");
      } else {
        var jsonData = jsonDecode(response.body);
        regController.isLoading.value = false;
        Get.back();
        getErrorSnackBar(jsonData["message"]);
      }
    } catch (e) {
      debugPrint(e.toString());
      regController.isLoading.value = false;
      getErrorSnackBar(e.toString());
    }
    debugPrint(jsondata.toString());
    return jsondata;
  }

// Get All School Dues
  Future<List<SchoolDues>> getSchoolDues(String url) async {
    final token = regController.userCredentials.value.token;

    var id = regController.userCredentials.value.id;

    String reqUrl = "$baseurl$url/$id";
    debugPrint(reqUrl);
    List<SchoolDues> duesList = [];
    try {
      http.Response response = await http.get(
        Uri.parse(reqUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "Authorization": "Bearer$token"
        },
      ).timeout(timeoutDuration);

      debugPrint(response.body);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        var data = jsonData["task"];
        for (var apiData in data) {
          SchoolDues dues = SchoolDues(
            id: apiData["_id"],
            createdBy: apiData["createdBy"],
            amount: apiData["amount"],
            feeDescription: apiData["feeDescription"],
            deadline: DateTime.parse(apiData["deadline"]),
            classAssigned:
                List<String>.from(apiData["classAssigned"].map((x) => x)),
          );

          duesList.add(dues);
        }

        getSuccessSnackBar("Success, School Dues gotten!!");
      } else {
        var jsondata = jsonDecode(response.body);
        Get.back();
        getErrorSnackBar(jsondata["message"]);
      }
    } catch (e) {
      Get.back();
      getErrorSnackBar(e.toString());
    }
    log(duesList.toString());
    return duesList;
  }

// Get Students Result
  Future getStudentResults(String id, String url) async {
    String reqUrl = "$baseurl$url/$id";
    debugPrint(reqUrl);

    List<StudentResults> results = [];

    try {
      http.Response response = await http.get(
        Uri.parse(reqUrl),
        headers: <String, String>{
          "Content-Type": "application/json",
        },
      ).timeout(timeoutDuration);

      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        for (var data in jsondata) {
          StudentResults resultsData = StudentResults(
            adminAssigned: data["adminAssigned"],
            createdFor: data["createdFor"],
            name: data["name"],
            document: data["document"],
            id: data["_id"],
          );

          results.add(resultsData);
        }
        getSuccessSnackBar("Results Gotten Successfully");

        return results;
      } else {
        var jsondata = jsonDecode(response.body);

        getErrorSnackBar(jsondata["message"]);
        debugPrint(jsondata["message"]);
        adminController.isloading.value = false;
      }
    } catch (e) {
      adminController.isloading.value = false;
      debugPrint(e.toString());
      getErrorSnackBar(e.toString());
    }
  }

  Future getAllTeachers(String url, String adminId) async {
    String reqUrl = "$baseurl$url/$adminId";
    debugPrint(reqUrl);

    String token = regController.userCredentials.value.token;

    List<TeacherModel> results = [];

    try {
      http.Response response = await http.get(
        Uri.parse(reqUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          "Authorization": "Bearer$token"
        },
      ).timeout(timeoutDuration);

      debugPrint(response.body);

      if (response.statusCode == 200) {
        var jsondata = jsonDecode(response.body);
        var mapdata = jsondata["task"];
        for (var data in mapdata) {
          TeacherModel teacherModel = TeacherModel(
            createdBy: data["createdBy"],
            firstname: data["firstname"],
            schoolName: data["schoolName"],
            schoolBanner: data["schoolBanner"],
            image: data["image"],
            password: data["password"],
            email: data["email"],
            lastName: data["lastName"],
            phoneNumber: data["phoneNumber"],
            nin: data["nin"],
            maritalStatus: data["maritalStatus"],
            gender: data["gender"],
            stateOfOrigin: data["stateOfOrigin"],
            className: data["className"],
            classSection: data["classSection"],
            subjectRole: data["subjectRole"],
            nationality: data["nationality"],
            address: data["address"],
            type: data["type"],
            id: data["_id"],
            token: "",
          );

          results.add(teacherModel);
        }
        getSuccessSnackBar("Teachers List Gotten Successfully");

        return results;
      } else {
        var jsondata = jsonDecode(response.body);
        getSuccessSnackBar(jsondata["message"]);
        adminController.isloading.value = false;
      }
    } catch (e) {
      adminController.isloading.value = false;
      debugPrint(e.toString());
      getErrorSnackBar(e.toString());
    }
  }

  // Future<Map> getRequestwithToken(Map data, String url) async {
  //   Map jsondata = {};
  //   String reqUrl = "$baseurl$url";
  //   log(reqUrl);

  //   String token = "";
  //   try {
  //     http.Response response = await http.get(
  //       Uri.parse(reqUrl),
  //       headers: <String, String>{
  //         "Content-Type": "application/json",
  //         "Authorization": "Bearer$token"
  //       },
  //     );
  //     final data = jsonDecode(response.body);
  //     jsondata = data;

  //     return jsondata;
  //   } catch (e) {
  //     Get.back();
  //     getErrorSnackBar(jsonDecode(e.toString()));
  //   }
  //   log(jsondata.toString());
  //   return jsondata;
  // }
}
