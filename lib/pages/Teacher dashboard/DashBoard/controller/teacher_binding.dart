import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/DashBoard/controller/teacher_controller.dart';

class TeacherBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<TeacherController>(TeacherController());
  }
}
