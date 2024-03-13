// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/alertMessage.dart';
import 'package:school_management/pages/Teacher%20dashboard/Assignment%20Page/view/createdAssignment.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../common/button.dart';
import '../../../../utils/sizes.dart';
import '../widget/createdmessage.dart';

class CreateAssignment extends StatelessWidget {
  const CreateAssignment({super.key});

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
                  width: 37.5,
                  child: Image.asset("assets/Teacher_Dash/backarrow.png"),
                ),
              ),
              SizedBox(width: widthSize(55.5)),
              Text(
                'Create assignment',
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
        padding: EdgeInsets.symmetric(
            horizontal: widthSize(30), vertical: heightSize(40)),
        child: Column(children: [
          SizedBox(
            height: heightSize(222),
            width: widthSize(368),
            child: Image.asset("assets/Teacher_Dash/dash_create_ass3.png"),
          ),
          SizedBox(height: heightSize(31)),
          AppButtons(
            text: "Post",
            textColor: whitecolor,
            backgroundColor: maincolor,
            borderColor: maincolor,
            fontSize: fontSize(14),
            height: heightSize(63),
            onTap: () {
              showAlertMessage(
                  context,
                  false,
                  heightSize(289),
                  widthSize(308),
                  "assets/Teacher_Dash/goodtick.png",
                  heightSize(113),
                  const CreatedMessage());
            },
          ),
          SizedBox(height: heightSize(35)),
          GestureDetector(
            onTap: () {
              Get.to(() => const CreatedAssignment());
            },
            child: Text(
              "View created assignments by you",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: fontSize(14),
                  fontWeight: FontWeight.w600),
            ),
          )
        ]),
      ),
    );
  }
}
