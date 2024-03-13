import 'package:get/get.dart';
import 'package:school_management/pages/School%20Dashboard/home%20screen/controller/adminController.dart';

class AdminBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<AdminController>(AdminController());
  }
}
