import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/Submitted%20Assignment/controller/Submitcontroller.dart';

class SubmitBiindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<SubmitController>(SubmitController());
  }
}
