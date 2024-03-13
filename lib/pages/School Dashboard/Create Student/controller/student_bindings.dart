import 'package:get/get.dart';
import 'package:school_management/pages/School%20Dashboard/Create%20Student/controller/student_controller.dart';

class StudentBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<StudentController>(StudentController());
  }
}
