// ignore_for_file: invalid_use_of_protected_member

import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../models/announce_model.dart';
import '../../../../models/event_model.dart';
import '../../../../models/student_model.dart';
import '../../../../models/student_results.dart';
import '../../../../models/teacher_model.dart';
import '../../../../services/api_calls.dart';
import '../../../Teacher dashboard/SIgn-In Page/controller/registrationController.dart';

final RegistrationController regcontroller = RegistrationController.instance;

class ParentsController extends GetxController {
  static ParentsController instance = Get.find();

  RxBool isloading = false.obs;
  RxBool isloadingEvents = false.obs;

  RxList<EventsModel> eventsModel = <EventsModel>[].obs;
  RxList<StudentModel> studentListFromIds = <StudentModel>[].obs;
  RxList<AnnounceModel> announceModel = <AnnounceModel>[].obs;
  RxList<TeacherModel> teachersList = <TeacherModel>[].obs;
  RxList<StudentResults> studentResult = <StudentResults>[].obs;

  final List<Color> eventColors = [
    Color(0xFFE6E7F3),
    Color(0xFFE1F8EB),
    Color(0xFFF9EABC)
    // Add more colors as needed
  ];

  final model = {"ids": regcontroller.parentModel.value.childrenId};

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchEvents();
    fetchStudentswithIdList2(model);
    // fetchAnnouncement();
    // fetchAllTeachers();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  Future<void> fetchEvents() async {
    isloadingEvents.value = true;
    eventsModel.value = await ApiCalls()
        .fetchTeacherEvents(regcontroller.parentModel.value.createdBy);
    isloadingEvents.value = false;
  }

  fetchStudentswithIdList(Map<String, dynamic> data) async {
    studentListFromIds.value = await ApiCalls().getStudentWithIdList(data);
  }

  fetchStudentswithIdList2(Map<String, dynamic> data) async {
    isloading.value = true;
    studentListFromIds.value = await ApiCalls().getStudentWithIdList(data);
    isloading.value = false;
  }

  Future<void> fetchAnnouncement() async {
    isloading.value = true;
    String id = regcontroller.parentModel.value.createdBy;
    announceModel.value = await ApiCalls().getAnnouncement(id);
    isloading.value = false;
  }

  fetchAllTeachers() async {
    teachersList.value = await ApiCalls()
        .getAllTeachers(regcontroller.parentModel.value.createdBy);
  }

  final cloudinary = Cloudinary.signedConfig(
    apiKey: "835465682576292",
    apiSecret: "8PE5JLnAugyOstV3EPuE7xrmcbQ",
    cloudName: "dm4eqhtyx",
  );
}
