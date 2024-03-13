import 'package:get/get.dart';
import 'package:school_management/pages/Parent%20DashBoard/Parent%20Assignment/controller/parentsassignmentcon.dart';

class ParentAssignmentBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ParentsAssignmentController>(ParentsAssignmentController());
    // TODO: implement dependencies
  }
}
