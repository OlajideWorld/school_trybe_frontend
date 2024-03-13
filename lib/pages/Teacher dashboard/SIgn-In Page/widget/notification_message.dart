import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/view/activate_notification.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

class NotificationMessage extends StatelessWidget {
  final String type;
  const NotificationMessage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widthSize(348),
        height: heightSize(324),
        child: Column(
          children: [
            SizedBox(height: heightSize(20)),
            Text(
              "Enable notifications",
              style: TextStyle(
                  fontSize: fontSize(20), fontWeight: FontWeight.w600),
            ),
            SizedBox(height: heightSize(15)),
            Text(
              "Enable notifications so you don't miss any important notificationss",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: fontSize(16), fontWeight: FontWeight.w400),
            ),
            SizedBox(height: heightSize(100)),
            AppButtons(
                textColor: whitecolor,
                fontSize: fontSize(14),
                backgroundColor: maincolor,
                text: "Enable Notifications",
                borderColor: maincolor,
                height: heightSize(60),
                onTap: () {
                  Get.to(() => ActivateNotification(type: type));
                }),
            SizedBox(height: heightSize(15)),
            AppButtons(
                textColor: Colors.red,
                fontSize: fontSize(14),
                backgroundColor: whitecolor,
                text: "Cancel",
                borderColor: Colors.red,
                height: heightSize(60),
                onTap: () {
                  Get.to(() => ActivateNotification(type: type));
                })
          ],
        ));
  }
}
