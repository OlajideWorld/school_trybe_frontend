import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:school_management/models/teacher_model.dart';
import 'package:school_management/pages/Teacher%20dashboard/DashBoard/controller/teacher_controller.dart';
import '../common/getxmessage.dart';
import '../models/event_model.dart';
import '../models/student_model.dart';

import '../pages/Teacher dashboard/SIgn-In Page/controller/registrationController.dart';

final RegistrationController regController = RegistrationController.instance;
final TeacherController teachController = TeacherController.instance;

class TeacherApiServices {
  static var client = http.Client();
  String baseurl =
      "https://sleepy-waters-76948-4990868a4e87.herokuapp.com/api/v1/";
  final timeoutDuration = const Duration(seconds: 15);

  Future createTeacherRoute(
      Map data, String url, String adminId, String type) async {
    String reqUrl = "$baseurl$url/$adminId";
    log(reqUrl);

    try {
      http.Response response = await http
          .post(Uri.parse(reqUrl),
              headers: <String, String>{
                "Content-Type": "application/json",
              },
              body: jsonEncode(data))
          .timeout(timeoutDuration);

      debugPrint(response.body);

      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        var userData = jsondata["User"];

        var token = jsondata["token"];

        TeacherModel teacherModel = TeacherModel(
          createdBy: userData["createdBy"],
          firstname: userData["firstname"],
          schoolName: userData["schoolName"],
          schoolBanner: userData["schoolBanner"],
          image: userData["image"],
          password: userData["password"],
          email: userData["email"],
          lastName: userData["lastName"],
          phoneNumber: userData["phoneNumber"],
          nin: userData["nin"],
          maritalStatus: userData["maritalStatus"],
          gender: userData["gender"],
          stateOfOrigin: userData["stateOfOrigin"],
          className: userData["className"],
          classSection: userData["classSection"],
          subjectRole: userData["subjectRole"],
          nationality: userData["nationality"],
          address: userData["address"],
          type: userData["type"],
          id: userData["_id"],
          token: token,
        );

        getSuccessSnackBar("Teacher Signed In Successfully");

        return teacherModel;
      } else {
        var jsondata = jsonDecode(response.body);

        getErrorSnackBar(jsondata["message"]);
        regController.isLoading.value = false;
      }
    } catch (e) {
      regController.isLoading.value = false;
      getErrorSnackBar(e.toString());
      debugPrint(e.toString());
    }
  }

// Get updated Teacher Routes
  Future getTeacherDetails(String id, String url) async {
    String reqUrl = "$baseurl$url/$id";

    final token = regController.teachermodel.value.token;
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
      } else {
        var jsondata = jsonDecode(response.body);

        getErrorSnackBar(jsondata["message"]);
      }
    } catch (e) {
      debugPrint(e.toString());
      getErrorSnackBar("Error, Server timeout, ${e.toString()}");
    }
  }

  Future updateTeacher(
      Map<String, dynamic> data, String url, String adminId) async {
    String reqUrl = "$baseurl$url/$adminId";

    debugPrint(reqUrl);

    final token = regController.teachermodel.value.token;
    debugPrint(data.toString());
    try {
      http.Response response = await http
          .patch(Uri.parse(reqUrl),
              headers: <String, String>{
                'Content-Type': 'application/json',
                "Authorization": "Bearer $token"
              },
              body: jsonEncode(data))
          .timeout(timeoutDuration);

      debugPrint(response.body);
      if (response.statusCode == 200) {
        var jsondata = jsonDecode(response.body);

        var data = jsondata["message"];
        debugPrint(data);

        getSuccessSnackBar("Teacher updated Successfully");
        return true;
      } else {
        var jsondata = jsonDecode(response.body);
        teachController.isloading.value = false;

        getErrorSnackBar(jsondata["message"]);
        return false;
      }
    } catch (e) {
      teachController.isloading.value = false;
      debugPrint(e.toString());
      getErrorSnackBar(e.toString());
      return false;
    }
  }

  // Teacher update Password
  Future updateTeacherPassword(
      Map<String, dynamic> data, String url, String id, String adminId) async {
    String reqUrl = "$baseurl$url/$id/$adminId";

    String token = regController.teachermodel.value.token;
    debugPrint(reqUrl);
    debugPrint(data.toString());
    try {
      http.Response response = await http
          .patch(Uri.parse(reqUrl),
              headers: <String, String>{
                'Content-Type': 'application/json',
                "Authorization": "Bearer $token"
              },
              body: jsonEncode(data))
          .timeout(timeoutDuration);

      debugPrint(response.body);
      if (response.statusCode == 200) {
        var jsondata = jsonDecode(response.body);
        debugPrint(jsondata["msg"]);

        getSuccessSnackBar("Teacher password updated Successfully");
        return true;
      } else {
        var jsondata = jsonDecode(response.body);
        regController.isLoading.value = false;

        getErrorSnackBar(jsondata["message"]);
        return false;
      }
    } catch (e) {
      regController.isLoading.value = false;

      getErrorSnackBar(e.toString());
      return false;
    }
  }

// Fetch Events
  Future<List<EventsModel>> fetchTeacherEvents(String url, String id) async {
    List<EventsModel> jsondata = [];

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
        teachController.isloadingEvents.value = false;
        getErrorSnackBar(jsondata["message"]);
      }
    } catch (e) {
      teachController.isloadingEvents.value = false;
      debugPrint(e.toString());
      getErrorSnackBar("Error, Server timeout, ${e.toString()}");
    }
    return jsondata;
  }

  Future<List<StudentModel>?> getTeacherStudentProfile(
      String createdBy,
      String classAssigned,
      String classSection,
      String gender,
      String url) async {
    String reqUrl =
        "$baseurl$url?createdBy=$createdBy&classAssigned=$classAssigned&classSection=$classSection&gender=$gender";
    debugPrint(reqUrl);

    List<StudentModel> jsondata = [];

    final token = regController.userCredentials.value.token;
    debugPrint(token);
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
        teachController.isloadingStudents.value = false;
        getSuccessSnackBar("Success \nStudents received");
      } else {
        var jsonData = jsonDecode(response.body);
        teachController.isloadingStudents.value = false;
        Get.back();
        getErrorSnackBar(jsonData["message"]);
      }
    } catch (e) {
      teachController.isloadingStudents.value = false;
      debugPrint(e.toString());
      getErrorSnackBar(e.toString());
    }
    debugPrint(jsondata.toString());
    return jsondata;
  }

  Future teacherCreateEvents(
      Map<String, dynamic> data, String url, String nature) async {
    final token = regController.teachermodel.value.token;
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
          .timeout(Duration(seconds: 15));

      debugPrint(response.body);

      if (response.statusCode == 200) {
        teachController.isloadingEvents.value = false;
        getSuccessSnackBar("$nature Created Successfully");
        return true;
      } else {
        var jsondata = jsonDecode(response.body);
        teachController.isloadingEvents.value = false;
        getErrorSnackBar(jsondata["message"]);
        return false;
      }
    } catch (e) {
      teachController.isloadingEvents.value = false;
      debugPrint(e.toString());
      getErrorSnackBar("Error, Server timeout, ${e.toString()}");
      return false;
    }
  }
}
