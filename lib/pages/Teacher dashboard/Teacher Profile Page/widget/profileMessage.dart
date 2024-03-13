// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Profile%20Page/widget/profileSuccess.dart';

import '../../../../common/alertMessage.dart';
import '../../../../common/button.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class TeacherProfileMessage extends StatelessWidget {
  const TeacherProfileMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSize(350),
      child: Column(children: [
        SizedBox(height: heightSize(15)),
        Text(
          "Are you sure?",
          style:
              TextStyle(fontSize: fontSize(26.44), fontWeight: FontWeight.w600),
        ),
        SizedBox(height: heightSize(15)),
        Text(
          "Are you sure you want to deactivate your teacher account",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize(16), fontWeight: FontWeight.w400),
        ),
        SizedBox(height: heightSize(30)),
        SizedBox(
          height: heightSize(63),
          width: widthSize(347),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: heightSize(63),
                  child: AppButtons(
                      textColor: maincolor,
                      fontSize: fontSize(14),
                      backgroundColor: whitecolor,
                      text: "Cancel",
                      borderColor: maincolor,
                      height: heightSize(63),
                      onTap: () {
                        Get.back();
                      }),
                ),
              ),
              SizedBox(width: widthSize(15)),
              Expanded(
                child: SizedBox(
                  height: heightSize(63),
                  child: AppButtons(
                      textColor: whitecolor,
                      fontSize: fontSize(14),
                      backgroundColor: Colors.red,
                      text: "Yes, I am sure",
                      borderColor: Colors.red,
                      height: heightSize(63),
                      onTap: () {
                        showAlertMessage(
                            context,
                            false,
                            heightSize(338.5),
                            widthSize(288),
                            "assets/Teacher_Dash/goodtick_green.png",
                            heightSize(138.5),
                            const TeacherProfileSuccess());
                      }),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
