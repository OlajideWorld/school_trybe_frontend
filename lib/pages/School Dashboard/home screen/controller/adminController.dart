import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:school_management/models/announce_model.dart';
import 'package:school_management/models/event_model.dart';
import 'package:school_management/models/student_model.dart';
import 'package:school_management/models/teacher_model.dart';
import 'package:school_management/pages/School%20Dashboard/Create%20Student/controller/student_controller.dart';

import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';
import 'package:school_management/services/api_calls.dart';

import '../../../../models/school_dues.dart';
import '../../../../models/student_results.dart';

final RegistrationController controller = RegistrationController.instance;
final StudentController studentController = StudentController.instance;

class AdminController extends GetxController {
  static AdminController instance = Get.find();

// Teachers Page
  TextEditingController subject = TextEditingController();
  TextEditingController name = TextEditingController();

  RxString classSelection = 'Sss Two'.obs;
  RxString classSection = "A".obs;
  RxString id = "".obs;

  final List<Color> eventColors = [
    Color(0xFFE6E7F3),
    Color(0xFFE1F8EB),
    Color(0xFFF9EABC)
    // Add more colors as needed
  ];

  RxList<EventsModel> eventsModel = <EventsModel>[].obs;
  RxList<StudentModel> studentModel = <StudentModel>[].obs;
  RxList<SchoolDues> schoolDues = <SchoolDues>[].obs;
  RxList<StudentModel> studentList = <StudentModel>[].obs;
  RxList<StudentResults> studentResult = <StudentResults>[].obs;

  RxList<TeacherModel> teachersList = <TeacherModel>[].obs;

  RxBool isloadingEvents = true.obs;
  RxString genderUsed = "".obs;
  RxBool isloading = false.obs;
  File? eventImage;
  File? announcementImage;
  RxString numberOfStudent = "".obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchEvents();
    fetchSchoolDues();
    fetchAllTeachers();
  }

  Future<void> fetchEvents() async {
    isloadingEvents.value = true;
    eventsModel.value = await ApiCalls().getEvents();
    isloadingEvents.value = false;
  }

  fetchStudentsProfile() async {
    studentList.value = await ApiCalls().getStudentProfile(
        studentController.classAssigned.value,
        studentController.classSection.value,
        genderUsed.value,
        controller.userCredentials.value.id);
  }

  Future<void> fetchSchoolDues() async {
    isloading.value = true;
    schoolDues.value = await ApiCalls().getSchoolDues();
    isloading.value = false;
  }

  fetchAllStudents() async {
    studentModel.value = await ApiCalls()
        .getStudentProfile("", "", "", controller.userCredentials.value.id);
    numberOfStudent.value = studentModel.length.toString();
  }

  fetchAllTeachers() async {
    teachersList.value =
        await ApiCalls().getAllTeachers(controller.userCredentials.value.id);
  }

  final cloudinary = Cloudinary.signedConfig(
    apiKey: "835465682576292",
    apiSecret: "8PE5JLnAugyOstV3EPuE7xrmcbQ",
    cloudName: "dm4eqhtyx",
  );
}
