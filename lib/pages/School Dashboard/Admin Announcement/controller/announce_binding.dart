import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/School%20Dashboard/Admin%20Announcement/controller/announce_controller.dart';

class AdminAnnouncementBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<AdminAnnounceController>(AdminAnnounceController());
  }
}
