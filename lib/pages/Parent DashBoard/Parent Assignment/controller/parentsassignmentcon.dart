import 'package:flutter/material.dart';

import 'package:get/get.dart';

enum AssignmentStatus { all, submitted, pending }

class ParentsAssignmentController extends GetxController {
  AssignmentStatus assignmentStatus = AssignmentStatus.all;
  RxInt selectNumber = 3.obs;
  static ParentsAssignmentController instance = Get.find();
}
