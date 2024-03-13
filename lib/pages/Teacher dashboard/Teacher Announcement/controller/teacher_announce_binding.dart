import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Announcement/controller/teacher_announce_controller.dart';

class TeacherAnnouncementBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<TeacherAnnounceController>(TeacherAnnounceController());
  }
}
