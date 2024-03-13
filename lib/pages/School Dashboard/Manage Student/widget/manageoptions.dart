import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/alertMessage.dart';
import '../../../../common/button.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

showManageStudentOPtions(BuildContext context) {
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
        "Are you sure you want to delete Michael Nelson student profile",
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
                          showManageStudentOptions2(context));
                    }),
              ),
            )
          ],
        ),
      )
    ]),
  );
}

showManageStudentOptions2(BuildContext context) {
  return SizedBox(
    width: widthSize(312),
    child: Column(children: [
      SizedBox(height: heightSize(20)),
      Text(
        "Account Deactivated",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: maincolor,
            fontSize: fontSize(26.44),
            fontWeight: FontWeight.w600),
      ),
      SizedBox(height: heightSize(20)),
      Text(
        "YYou have successfully deleted Michael Nelson as a profile in your school",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: fontSize(16), fontWeight: FontWeight.w400),
      ),
      SizedBox(height: heightSize(30)),
      AppButtons(
          textColor: whitecolor,
          fontSize: fontSize(14),
          backgroundColor: Color(0xFF219653),
          text: "Ok",
          borderColor: Color(0xFF219653),
          height: heightSize(63),
          onTap: () {})
    ]),
  );
}
