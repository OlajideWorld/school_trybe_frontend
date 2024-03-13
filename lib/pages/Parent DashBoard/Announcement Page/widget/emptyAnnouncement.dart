import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';

class EmptyAnnouncementScreen extends StatelessWidget {
  const EmptyAnnouncementScreen({super.key});

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
        padding: EdgeInsets.only(top: heightSize(58)),
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: heightSize(208),
              width: widthSize(263),
              child: Image.asset("assets/Parents_Dash/noAnnounce.png"),
            ),
            SizedBox(height: heightSize(30)),
            Text(
              "No announcement",
              style: TextStyle(
                  fontSize: fontSize(20), fontWeight: FontWeight.w600),
            ),
            SizedBox(height: heightSize(20)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widthSize(172)),
              child: AppButtons(
                  textColor: whitecolor,
                  fontSize: 14,
                  backgroundColor: textColor3,
                  text: "Refresh",
                  borderColor: textColor3,
                  height: 39,
                  onTap: () {}),
            )
          ],
        )),
      ),
    );
  }
}
