import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/pages/Teacher%20dashboard/Login%20Page/view/login_page.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../view/recoverpassword.dart';

class EmailAlertMessages extends StatelessWidget {
  const EmailAlertMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(250),
      width: widthSize(365),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(height: heightSize(34)),
        Text(
          "We have now sent you an email with instructions on how to reset your password. Please check your inbox (and spam folder, just in case) for an email from us",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize(16), fontWeight: FontWeight.w400),
        ),
        SizedBox(height: heightSize(47)),
        SizedBox(
          height: heightSize(98),
          width: widthSize(365),
          child: Column(children: [
            AppButtons(
                textColor: whitecolor,
                fontSize: fontSize(14),
                backgroundColor: maincolor,
                text: "Open Email App",
                borderColor: maincolor,
                height: heightSize(55),
                onTap: () {
                  Get.to(() => RecoverPassword());
                }),
            SizedBox(height: heightSize(20)),
            SizedBox(
              height: heightSize(23),
              width: widthSize(91),
              child: Text(
                "Resend email",
                style: TextStyle(
                    color: textColor3,
                    fontSize: fontSize(14),
                    fontWeight: FontWeight.w600),
              ),
            )
          ]),
        )
      ]),
    );
  }
}

class AlertMessages extends StatelessWidget {
  const AlertMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(250),
      child: Column(children: [
        SizedBox(
          height: heightSize(82),
          width: widthSize(148),
          child: Text(
            'Password changed',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: maincolor,
                fontSize: fontSize(30),
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: heightSize(20)),
        Text(
          "Your password has been successfully changed",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize(16), fontWeight: FontWeight.w400),
        ),
        SizedBox(height: heightSize(20)),
        SizedBox(
          height: heightSize(59),
          width: widthSize(187),
          child: AppButtons(
              textColor: whitecolor,
              fontSize: fontSize(14),
              backgroundColor: Colors.green,
              text: "Back to login",
              borderColor: Colors.green,
              height: heightSize(59),
              onTap: () {
                Get.to(() => LoginScreen());
              }),
        )
      ]),
    );
  }
}
