import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/Notification/controller/notification.dart';

class NotificationBind extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<NotificationCon>(NotificationCon());
  }
}
