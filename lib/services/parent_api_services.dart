import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:school_management/models/parent_model.dart';
import 'package:school_management/pages/Parent%20DashBoard/ParentMain/controller/parent_controller.dart';

import '../common/getxmessage.dart';
import '../models/student_results.dart';
import '../models/teacher_model.dart';
import '../pages/Teacher dashboard/SIgn-In Page/controller/registrationController.dart';

final RegistrationController regController = RegistrationController.instance;
ParentsController parentController = ParentsController.instance;

class ParentsApiServices {
  static var client = http.Client();
  String baseurl =
      "https://sleepy-waters-76948-4990868a4e87.herokuapp.com/api/v1/";
  final timeoutDuration = const Duration(seconds: 20);

  Future parentsSignin(
      Map<String, dynamic> data, String adminId, String url) async {
    String reqUrl = "$baseurl$url/$adminId";
    debugPrint(reqUrl);
    // debugPrint(data.toString());

    try {
      http.Response response = await http
          .post(Uri.parse(reqUrl),
              headers: <String, String>{'Content-Type': 'application/json'},
              body: jsonEncode(data))
          .timeout(timeoutDuration);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        var mapdata = data["User"];
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
            childrenId: List<String>.from(mapdata["childrenID"].map((x) => x)),
            nationality: mapdata["nationality"],
            occupation: mapdata["occupation"],
            address: mapdata["address"],
            type: mapdata["type"],
            id: mapdata["_id"],
            token: token);

        getSuccessSnackBar("Parent SignIn Successfully");
        return jsonModel;
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

  Future updateParentPassword(
      Map<String, dynamic> data, String url, String id, String adminId) async {
    String reqUrl = "$baseurl$url/$id/$adminId";

    String token = regController.parentModel.value.token;
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
        getSuccessSnackBar("Parent password updated Successfully");
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

  Future parentGetAllTeachers(String url, String adminId) async {
    String reqUrl = "$baseurl$url/$adminId";
    debugPrint(reqUrl);

    String token = regController.parentModel.value.token;

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
        getErrorSnackBar(jsondata["message"]);
        parentController.isloading.value = false;
      }
    } catch (e) {
      parentController.isloading.value = false;
      debugPrint(e.toString());
      getErrorSnackBar(e.toString());
    }
  }

  // Get Results

  Future getParentStudentResults(String id, String url) async {
    String reqUrl = "$baseurl$url/$id";
    debugPrint(reqUrl);

    String token = regController.parentModel.value.token;

    List<StudentResults> results = [];

    try {
      http.Response response = await http.get(
        Uri.parse(reqUrl),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": "Bearer$token"
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
        parentController.isloading.value = false;
      }
    } catch (e) {
      parentController.isloading.value = false;
      debugPrint(e.toString());
      getErrorSnackBar(e.toString());
    }
  }
}

// Get Results
 
