import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/getxmessage.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';
import 'package:school_management/services/api_calls.dart';

import '../../../../models/student_model.dart';

enum Selectgender { male, female }

final RegistrationController controller = RegistrationController.instance;

class StudentController extends GetxController {
  static StudentController instance = Get.find();

  File? resultFile;

  Rx<StudentModel> studentmodel = StudentModel(
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
          id: "")
      .obs;

  RxBool isloading = false.obs;
  RxBool isLoadingStudent = false.obs;

  List<String> selectedClasses = [];

// Create Dues parameter
  final TextEditingController amount = TextEditingController();
  final TextEditingController description = TextEditingController();

  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController guardianName = TextEditingController();
  final TextEditingController homeAddress = TextEditingController();

  var termAssigned = "First term";
  Rx<Selectgender> gender = Selectgender.male.obs;
  RxString genderSelected = "Male".obs;
  DateTime dateTime = DateTime(2023, 05, 12, 5, 30);
  RxString studentImage = "".obs;

  var bloodgroup = "A+";
  var studentClass = "Sss One";
  RxString classSection = "A".obs;
  RxString classAssigned = "Sss Three".obs;
  var studentType = "Day Student";

  final cloudinary = Cloudinary.signedConfig(
    apiKey: "835465682576292",
    apiSecret: "8PE5JLnAugyOstV3EPuE7xrmcbQ",
    cloudName: "dm4eqhtyx",
  );

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    firstname.dispose();
    lastname.dispose();
    guardianName.dispose();
    homeAddress.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}
