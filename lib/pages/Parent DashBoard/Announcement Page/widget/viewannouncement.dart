import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Parent%20DashBoard/Announcement%20Page/widget/viewannouncement2.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';

class ParentViewAnnouncement extends StatelessWidget {
  const ParentViewAnnouncement({super.key});

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
              SizedBox(width: widthSize(66.5)),
              Text(
                'Announcements',
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
            top: heightSize(32), right: widthSize(30), left: widthSize(30)),
        child: Column(children: [
          GestureDetector(
            onTap: () => Get.to(() => const ParentsViewAnnouncement2()),
            child: SizedBox(
              height: heightSize(202),
              width: widthSize(368),
              child: Image.asset("assets/Teacher_Dash/announce_all2.png"),
            ),
          ),
          //
          SizedBox(height: heightSize(20)),
          GestureDetector(
            onTap: () => Get.to(() => const ParentsViewAnnouncement2()),
            child: SizedBox(
              height: heightSize(202),
              width: widthSize(368),
              child: Image.asset("assets/Teacher_Dash/announce_all2.png"),
            ),
          ),
          //
          SizedBox(height: heightSize(20)),
          GestureDetector(
            onTap: () => Get.to(() => const ParentsViewAnnouncement2()),
            child: SizedBox(
              height: heightSize(202),
              width: widthSize(368),
              child: Image.asset("assets/Teacher_Dash/announce_all2.png"),
            ),
          ),
        ]),
      ),
    );
  }
}
