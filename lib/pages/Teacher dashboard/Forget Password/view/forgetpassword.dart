import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/alertMessage.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/pages/Teacher%20dashboard/Forget%20Password/widget/alertmessages.dart';
import 'package:school_management/pages/Teacher%20dashboard/Forget%20Password/widget/profile_details.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../../common/input_TextField.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: Stack(children: [
        Column(
          children: [
            Container(
              height: heightSize(189),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: maincolor),
              child: Padding(
                padding: EdgeInsets.only(
                    top: heightSize(70),
                    left: widthSize(30),
                    bottom: heightSize(81.5)),
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
                  SizedBox(width: widthSize(58.5)),
                  Text(
                    'Recover password',
                    style: TextStyle(
                        color: whitecolor,
                        fontSize: fontSize(20),
                        fontWeight: FontWeight.w600),
                  ),
                ]),
              ),
            ),
            SizedBox(height: heightSize(72)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
              child: Form(
                key: formkey,
                child: SizedBox(
                  height: heightSize(94),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Email Address",
                            style: TextStyle(
                                fontSize: fontSize(14),
                                fontWeight: FontWeight.w600)),
                        SizedBox(
                            height: heightSize(72),
                            child: InputTextField(
                              obscureText: false,
                              hintText: "e.g example@gmail.com",
                              controller: emailController,
                              textInputAction: true,
                              validator: (String? val) {
                                if (val!.isEmpty) {
                                  return "Please provide an email address to recover your password";
                                }
                              },
                            ))
                      ]),
                ),
              ),
            ),
            SizedBox(height: heightSize(20)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
              child: SizedBox(
                height: heightSize(106),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButtons(
                          textColor: whitecolor,
                          fontSize: fontSize(16),
                          backgroundColor: maincolor,
                          text: "Recover password",
                          borderColor: maincolor,
                          height: heightSize(63),
                          onTap: () {
                            final clear = formkey.currentState;
                            if (clear!.validate()) {
                              showAlertMessage(
                                  context,
                                  false,
                                  heightSize(380),
                                  widthSize(365),
                                  "assets/Teacher_Dash/messageicon.png",
                                  heightSize(129),
                                  const EmailAlertMessages());
                            }
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                                fontSize: fontSize(14),
                                fontWeight: FontWeight.w400),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Signup",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: fontSize(14),
                                  color: maincolor),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => debugPrint('Sign up Page'),
                            ),
                          )
                        ],
                      ),
                    ]),
              ),
            )
          ],
        ),
        ProfileDetails()
      ]),
    );
  }
}
