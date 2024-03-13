import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:school_management/pages/Parent%20DashBoard/ParentMain/controller/parent_controller.dart';

class ParentsBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<ParentsController>(ParentsController());
  }
}
