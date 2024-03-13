import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/pages/Teacher%20dashboard/Login%20Page/view/login_page.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/binding/registrationbinding.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/view/sign_in_page.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Column(children: [
        Stack(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: heightSize(88), left: widthSize(336)),
              child: SizedBox(
                height: heightSize(222),
                width: widthSize(222),
                child: Image.asset("assets/Teacher_Dash/authen_circle1.png"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: widthSize(373),
                top: heightSize(199),
              ),
              child: SizedBox(
                height: heightSize(13),
                width: widthSize(13),
                child:
                    Image.asset("assets/Teacher_Dash/authen_gold_circle.png"),
              ),
            )
          ],
        ),
        SizedBox(height: heightSize(21)),
        Center(
          child: SizedBox(
              height: heightSize(44),
              child: Image.asset(
                "assets/Teacher_Dash/schooltrybe.png",
                fit: BoxFit.fill,
              )),
        ),
        SizedBox(height: heightSize(70)),
        SizedBox(
          height: heightSize(405),
          width: widthSize(405),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(right: widthSize(214)),
                child: SizedBox(
                    height: heightSize(405),
                    width: widthSize(405),
                    child:
                        Image.asset("assets/Teacher_Dash/authen_circle2.png")),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: widthSize(30), top: heightSize(227)),
                child: SizedBox(
                    height: heightSize(12),
                    width: widthSize(12),
                    child: Image.asset(
                        "assets/Teacher_Dash/authen_gold_circle.png")),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: heightSize(45), left: widthSize(183)),
                child: SizedBox(
                    height: heightSize(12),
                    width: widthSize(12),
                    child: Image.asset(
                        "assets/Teacher_Dash/authen_gold_circle.png")),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: widthSize(30),
                    right: widthSize(30),
                    top: heightSize(297)),
                child: SizedBox(
                  height: heightSize(60),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: AppButtons(
                              textColor: maincolor,
                              fontSize: fontSize(14),
                              backgroundColor: whitecolor,
                              text: "Sign up",
                              borderColor: whitecolor,
                              height: heightSize(60),
                              onTap: () {
                                Get.to(() => SignInPage(),
                                    binding: Registrationbinding());
                              }),
                        ),
                        SizedBox(width: widthSize(20)),
                        Expanded(
                          child: AppButtons(
                              textColor: whitecolor,
                              fontSize: fontSize(14),
                              backgroundColor: maincolor,
                              text: "Login",
                              borderColor: whitecolor,
                              height: heightSize(60),
                              onTap: () {
                                Get.to(() => LoginScreen(),
                                    binding: Registrationbinding());
                              }),
                        )
                      ]),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
