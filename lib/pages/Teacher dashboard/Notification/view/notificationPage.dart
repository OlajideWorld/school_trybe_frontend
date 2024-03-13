// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/Notification/controller/notification.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final controller = NotificationCon.instance;

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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SizedBox(
                      height: heightSize(37.5),
                      width: 37.5,
                      child: Image.asset("assets/Teacher_Dash/backarrow.png"),
                    ),
                  ),
                  Text(
                    'Notifications',
                    style: TextStyle(
                        color: whitecolor,
                        fontSize: fontSize(20),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: heightSize(25),
                    width: widthSize(25),
                    child:
                        Image.asset("assets/Teacher_Dash/settings_notifi.png"),
                  )
                ]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: heightSize(30)),
          child: controller.clearNotification.value == true
              ? SizedBox(
                  height: heightSize(221),
                  width: widthSize(289),
                  child:
                      Image.asset("assets/Teacher_Dash/dash_notification2.png"),
                )
              : GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: heightSize(659),
                    width: widthSize(368),
                    child: Image.asset(
                        "assets/Teacher_Dash/dash_notifications.png"),
                  ),
                ),
        ),
      ),
    );
  }

  showoptions(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: SizedBox(
                height: heightSize(59),
                width: widthSize(162),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          controller.clearNotification.value == true;
                        });
                      },
                      child: Text(
                        "Clear all notifications",
                        style: TextStyle(
                            fontSize: fontSize(18),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Mark all as read",
                        style: TextStyle(
                            fontSize: fontSize(18),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
