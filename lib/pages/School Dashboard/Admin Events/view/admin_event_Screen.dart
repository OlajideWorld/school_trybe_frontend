// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/pages/School%20Dashboard/Admin%20Events/view/admin_createEvents.dart';
import 'package:school_management/pages/School%20Dashboard/Admin%20Events/view/admin_viewEvents.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Events/view/createEvents.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Events/view/viewEvents.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/SIgn-In Page/widget/sign_up_Box.dart';

class AdminEventsScreen extends StatelessWidget {
  const AdminEventsScreen({super.key});

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
                  child: backbutton()),
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
              Get.to(() => AdminCreateEventsScreen());
            },
            subtextSize: 43,
          ),
          SizedBox(height: heightSize(20)),
          SignupBox(
              image: "assets/Teacher_Dash/events_logo.png",
              header: "View all events",
              subtext: "Select view all created events",
              onTap: () {
                Get.to(() => AdminViewEventsScreen());
              },
              subtextSize: 43),
        ]),
      ),
    );
  }
}
