// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:school_management/common/button.dart';
import 'package:school_management/pages/School%20Dashboard/home%20screen/controller/adminController.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Events/widget/eventsSuccess.dart';
import 'package:school_management/services/api_calls.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../common/alertMessage.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/sizes.dart';

AdminController adminController = AdminController.instance;

class EventsWarning extends StatelessWidget {
  final String id;
  const EventsWarning({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSize(350),
      child: Column(children: [
        SizedBox(height: heightSize(15)),
        Text(
          "Delete event",
          textAlign: TextAlign.center,
          style:
              TextStyle(fontSize: fontSize(26.4), fontWeight: FontWeight.w600),
        ),
        SizedBox(height: heightSize(15)),
        Text(
          "Are you sure you want to delete this event",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize(16), fontWeight: FontWeight.w400),
        ),
        SizedBox(height: heightSize(20)),
        AppButtons(
            textColor: whitecolor,
            fontSize: fontSize(14),
            backgroundColor: Colors.red,
            text: "Yes, I am sure",
            borderColor: Colors.red,
            height: heightSize(63),
            onTap: () async {
              adminController.isloading.value = true;

              var done = await ApiCalls().deleteEvent(id);

              if (done) {
                adminController.isloading.value = false;
                showAlertMessage(
                    context,
                    false,
                    heightSize(309),
                    widthSize(312),
                    'assets/Teacher_Dash/goodtick_green.png',
                    heightSize(147),
                    const EventsSucesss(
                      text: "Event successfully deleted",
                      text2: "You have successfully deleted an event",
                    ));

                await Future.delayed(const Duration(seconds: 2), () {
                  Get.offNamed(SchoolRoutes.homeScreen);
                });
              }
            }),
        SizedBox(height: heightSize(20)),
        AppButtons(
            textColor: maincolor,
            fontSize: fontSize(14),
            backgroundColor: whitecolor,
            text: "Cancel",
            borderColor: maincolor,
            height: heightSize(63),
            onTap: () {
              Get.back();
            })
      ]),
    );
  }
}

class AnnounceWarning extends StatelessWidget {
  final String id;
  const AnnounceWarning({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSize(350),
      child: Column(children: [
        SizedBox(height: heightSize(15)),
        Text(
          "Delete Announcement",
          textAlign: TextAlign.center,
          style:
              TextStyle(fontSize: fontSize(26.4), fontWeight: FontWeight.w600),
        ),
        SizedBox(height: heightSize(15)),
        Text(
          "Are you sure you want to delete this announcement",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize(16), fontWeight: FontWeight.w400),
        ),
        SizedBox(height: heightSize(20)),
        AppButtons(
            textColor: whitecolor,
            fontSize: fontSize(14),
            backgroundColor: Colors.red,
            text: "Yes, I am sure",
            borderColor: Colors.red,
            height: heightSize(63),
            onTap: () async {
              adminController.isloading.value = true;

              var done = await ApiCalls().deleteAnnouncement(id);

              if (done) {
                adminController.isloading.value = false;
                showAlertMessage(
                    context,
                    false,
                    heightSize(309),
                    widthSize(312),
                    'assets/Teacher_Dash/goodtick_green.png',
                    heightSize(147),
                    const EventsSucesss(
                      text: "Event successfully deleted",
                      text2: "You have successfully deleted an event",
                    ));

                await Future.delayed(const Duration(seconds: 2), () {
                  Get.offNamed(SchoolRoutes.homeScreen);
                });
              }
            }),
        SizedBox(height: heightSize(20)),
        AppButtons(
            textColor: maincolor,
            fontSize: fontSize(14),
            backgroundColor: whitecolor,
            text: "Cancel",
            borderColor: maincolor,
            height: heightSize(63),
            onTap: () {
              Get.back();
            })
      ]),
    );
  }
}
