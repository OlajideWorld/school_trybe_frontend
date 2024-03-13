// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/pages/School%20Dashboard/SignIn%20screeen/view/admin_upload_school_image.dart';
import 'package:school_management/pages/Teacher%20dashboard/Assignment%20Page/widget/selectclassWidget.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/view/registration2.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../School Dashboard/SignIn screeen/view/schoolregistrationscreen.dart';
import '../controller/registrationController.dart';
import '../view/registration3.dart';

class VerifyEmailMessage extends StatelessWidget {
  final String type;
  final String email;
  VerifyEmailMessage({super.key, required this.type, required this.email});

  final RegistrationController controller = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(height: heightSize(30)),
        SizedBox(
          height: heightSize(160),
          width: widthSize(368),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Verify Email Address",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: const Color(0xFF222222),
                      fontSize: fontSize(20),
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "The email address you provided for your account is $email",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: const Color(0xFF222222),
                      fontSize: fontSize(16),
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "Go to your email and click on the verification link sent to you",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: const Color(0xFF222222),
                      fontSize: fontSize(16),
                      fontWeight: FontWeight.w400),
                )
              ]),
        ),
        SizedBox(height: heightSize(30)),
        SizedBox(
          height: heightSize(103),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButtons(
                    textColor: whitecolor,
                    fontSize: fontSize(14),
                    backgroundColor: maincolor,
                    text: "Open email app",
                    borderColor: maincolor,
                    height: heightSize(60),
                    onTap: () {
                      if (type == "schoolAdmin") {
                        Get.to(() => AdminSchoolImageUpload(
                              image: controller.image,
                            ));
                      } else {
                        Get.to(() => RegistrationScreen3(
                              type: type,
                            ));
                      }
                    }),
                Text(
                  "Resend email",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: fontSize(14),
                      fontWeight: FontWeight.w600),
                )
              ]),
        )
      ]),
    );
  }
}
