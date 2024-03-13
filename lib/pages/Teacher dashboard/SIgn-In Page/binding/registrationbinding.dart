import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/School%20Dashboard/home%20screen/controller/adminController.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';

class Registrationbinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<RegistrationController>(RegistrationController());
  }
}
