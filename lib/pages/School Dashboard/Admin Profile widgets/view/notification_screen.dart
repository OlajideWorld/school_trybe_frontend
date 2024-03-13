import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../widget/notification_widget.dart';

class AdminNotificaitionProfilePage extends StatelessWidget {
  AdminNotificaitionProfilePage({super.key});

  final emailNotification = ValueNotifier<bool>(true);
  final pushNotification = ValueNotifier<bool>(true);
  final smsNotification = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(heightSize(78)),
        child: AppBar(
          backgroundColor: maincolor,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(
              top: heightSize(22),
              left: widthSize(20),
            ),
            child: Row(children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SizedBox(
                  height: heightSize(37.5),
                  width: widthSize(37.5),
                  child: Image.asset("assets/Teacher_Dash/backarrow.png"),
                ),
              ),
              SizedBox(width: widthSize(84.5)),
              Text(
                'Notifications',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: fontSize(20),
                    fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: heightSize(33), left: widthSize(30), right: widthSize(30)),
        child: Container(
          height: heightSize(306),
          width: widthSize(368),
          padding: EdgeInsets.only(
              top: heightSize(26),
              left: widthSize(20),
              right: widthSize(20),
              bottom: heightSize(30)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widthSize(10)),
              color: whitecolor,
              boxShadow: [
                BoxShadow(
                    color: const Color.fromRGBO(61, 64, 128, 0.2),
                    blurRadius: widthSize(60),
                    offset: const Offset(0, 4))
              ]),
          child: Column(children: [
            AdminNotificationProfileWidget(
                header: 'Email Notifications', controller: emailNotification),
            SizedBox(height: heightSize(10)),
            Divider(thickness: widthSize(2), color: const Color(0xFFE8E8E8)),
            SizedBox(height: heightSize(20)),
            AdminNotificationProfileWidget(
                header: 'Push Notifications:', controller: pushNotification),
            SizedBox(height: heightSize(10)),
            Divider(thickness: widthSize(2), color: const Color(0xFFE8E8E8)),
            SizedBox(height: heightSize(20)),
            AdminNotificationProfileWidget(
                header: 'SMS Notifications', controller: smsNotification),
          ]),
        ),
      ),
    );
  }
}
