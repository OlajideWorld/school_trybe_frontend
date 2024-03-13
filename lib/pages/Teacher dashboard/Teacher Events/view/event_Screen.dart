// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Events/view/createEvents.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Events/view/viewEvents.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../School Dashboard/Admin Events/view/admin_createEvents.dart';
import '../../../School Dashboard/Admin Events/view/admin_viewEvents.dart';
import '../../SIgn-In Page/widget/sign_up_Box.dart';

class TeacherEventsScreen extends StatelessWidget {
  const TeacherEventsScreen({super.key});

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
              SizedBox(width: widthSize(114.5)),
              Text(
                'Events',
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
            top: heightSize(38), left: widthSize(30), right: widthSize(30)),
        child: Column(children: [
          SignupBox(
            image: "assets/Teacher_Dash/events_logo.png",
            header: "Create a new event",
            subtext: "Select to create a new events",
            onTap: () {
              Get.to(() => const TeacherCreateEventsScreen());
            },
            subtextSize: 43,
          ),
          SizedBox(height: heightSize(20)),
          SignupBox(
              image: "assets/Teacher_Dash/events_logo.png",
              header: "View all events",
              subtext: "Select view all created events",
              onTap: () {
                Get.to(() => TeacherViewEventsScreen());
              },
              subtextSize: 43),
        ]),
      ),
    );
  }
}
