
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/AuthPage/controller/authcontroller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<AuthController>(AuthController());
  }
}
