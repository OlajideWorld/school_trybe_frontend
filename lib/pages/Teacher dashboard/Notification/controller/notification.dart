import 'package:get/get.dart';

class NotificationCon extends GetxController {
  RxBool clearNotification = false.obs;

  static NotificationCon instance = Get.find();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
