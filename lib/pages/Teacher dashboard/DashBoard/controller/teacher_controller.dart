import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';

import '../../../../models/event_model.dart';
import '../../../../models/student_model.dart';
import '../../../../models/student_results.dart';
import '../../../../services/api_calls.dart';
import '../../../School Dashboard/Create Student/controller/student_controller.dart';

final RegistrationController regcontroller = RegistrationController.instance;
final StudentController studentController = StudentController.instance;

class TeacherController extends GetxController {
  RxBool isloadingEvents = false.obs;
  RxBool isloadingStudents = false.obs;
  RxBool isloading = false.obs;
  RxBool isManage = false.obs;

  RxList<EventsModel> eventsModel = <EventsModel>[].obs;
  RxString genderUsed = "".obs;
  RxList<StudentModel> studentModel = <StudentModel>[].obs;
  RxList<StudentModel> studentList = <StudentModel>[].obs;
  RxList<StudentResults> studentResult = <StudentResults>[].obs;

  static TeacherController instance = Get.find();

  File? eventImage;

  RxString eventsType = "All Events".obs;

  final List<Color> eventColors = [
    Color(0xFFE6E7F3),
    Color(0xFFE1F8EB),
    Color(0xFFF9EABC)
    // Add more colors as needed
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchEvents();
    fetchAllStudents();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> fetchEvents() async {
    isloadingEvents.value = true;
    eventsModel.value = await ApiCalls()
        .fetchTeacherEvents(regcontroller.teachermodel.value.createdBy);
    isloadingEvents.value = false;
  }

  Future<void> fetchTeacherEvents() async {
    isloadingEvents.value = true;
    eventsModel.value = await ApiCalls()
        .fetchTeacherEvents(regcontroller.teachermodel.value.id);
    isloadingEvents.value = false;
  }

  Future<void> fetchAllStudents() async {
    isloadingStudents.value = true;
    studentModel.value = await ApiCalls().getTeacherStudentProfile(
        regcontroller.teachermodel.value.className,
        regcontroller.teachermodel.value.classSection,
        "",
        regcontroller.teachermodel.value.createdBy);
    if (studentModel.isEmpty || studentModel.isNotEmpty) {
      isloadingStudents.value = false;
    }
  }

  fetchStudentsProfile() async {
    studentList.value = await ApiCalls().getTeacherStudentProfile(
        studentController.classAssigned.value,
        studentController.classSection.value,
        genderUsed.value,
        controller.userCredentials.value.id);
  }

  final cloudinary = Cloudinary.signedConfig(
    apiKey: "835465682576292",
    apiSecret: "8PE5JLnAugyOstV3EPuE7xrmcbQ",
    cloudName: "dm4eqhtyx",
  );
}
