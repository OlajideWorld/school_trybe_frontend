// ignore_for_file: file_names

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:school_management/common/alertMessage.dart";
import "package:school_management/common/button.dart";
import "package:school_management/pages/Teacher%20dashboard/Assignment%20Page/widget/deleteSuccess.dart";
import "package:school_management/utils/colors.dart";
import "package:school_management/utils/sizes.dart";

class DeleteAssignmentMessage extends StatelessWidget {
  const DeleteAssignmentMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSize(348),
      child: Column(children: [
        SizedBox(height: heightSize(20)),
        Text(
          "Are you sure you want to delete this assignment from your created list",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize(16), fontWeight: FontWeight.w400),
        ),
        SizedBox(height: heightSize(20)),
        AppButtons(
            textColor: whitecolor,
            fontSize: fontSize(16),
            backgroundColor: Colors.red,
            text: "Proceed",
            borderColor: Colors.red,
            height: heightSize(60),
            onTap: () {
              showAlertMessage(
                  context,
                  false,
                  heightSize(290),
                  widthSize(368),
                  "assets/Teacher_Dash/goodtick.png",
                  heightSize(130),
                  const DeleteSuccess());
            }),
        SizedBox(height: heightSize(20)),
        AppButtons(
            textColor: maincolor,
            fontSize: fontSize(16),
            backgroundColor: whitecolor,
            text: "Cancel",
            borderColor: maincolor,
            height: heightSize(60),
            onTap: () {
              Get.back();
            }),
      ]),
    );
  }
}
