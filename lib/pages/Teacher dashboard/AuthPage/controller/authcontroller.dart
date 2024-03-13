import 'package:get/get.dart';

import '../../../../routes/routes.dart';

class AuthController extends GetxController {
  RxBool isloggin = false.obs;
  RxBool changeColor = false.obs;
  var currentIndex = 1;
  static AuthController instance = Get.find();

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    if (isloggin.value == false) {
      await Future.delayed(const Duration(seconds: 5), () {});
      isloggin.value = true;
      Get.offNamed(TeacherRoutes.onBoardScreen);
    } else {
      await Future.delayed(const Duration(seconds: 5), () {});
      Get.offNamed(TeacherRoutes.authScreen);
    }
  }
}
