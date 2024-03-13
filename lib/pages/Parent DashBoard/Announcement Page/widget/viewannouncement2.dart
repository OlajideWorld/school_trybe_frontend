import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';

class ParentsViewAnnouncement2 extends StatelessWidget {
  const ParentsViewAnnouncement2({super.key});

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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: heightSize(600),
            width: widthSize(368),
            child: Image.asset("assets/Teacher_Dash/announce_message.png"),
          ),
          SizedBox(height: heightSize(19)),
          SizedBox(
            height: heightSize(20),
          ),
          SizedBox(
            height: heightSize(64),
            width: widthSize(176),
            child: Image.asset("assets/Teacher_Dash/announce3.png"),
          ),
        ]),
      ),
    );
  }
}
