import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';

import '../../../../models/announce_model.dart';
import '../../../../services/api_calls.dart';

RegistrationController controller = RegistrationController.instance;

class TeacherAnnounceController extends GetxController {
  static TeacherAnnounceController instance = Get.find();
  RxList<AnnounceModel> announceModel = <AnnounceModel>[].obs;

  File? teacherAnnounce;

  RxBool isloading = true.obs;

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAnnouncement();
  }

  Future<void> fetchAnnouncement() async {
    isloading.value = true;
    String id = controller.teachermodel.value.id!;
    announceModel.value = await ApiCalls().getAnnouncement(id);
    isloading.value = false;
  }
}
