import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/common/alertMessage.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/widget/checkthepassword.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/widget/notification_message.dart';
import 'package:school_management/services/api_calls.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../common/button.dart';
import '../../../../common/input_TextField.dart';
import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/Forget Password/widget/profile_details.dart';

class AdminRegistrationScreen3 extends StatefulWidget {
  final String type;
  AdminRegistrationScreen3({super.key, required this.type});

  @override
  State<AdminRegistrationScreen3> createState() =>
      _AdminRegistrationScreen3State();
}

class _AdminRegistrationScreen3State extends State<AdminRegistrationScreen3> {
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  double _strength = 0;
  late String _password;
  bool hasSpecialCharacters = false;
  bool numberOfcharacters = false;
  bool includeNumber = false;
  RegExp numReg = RegExp(r".*[0-9].*");
  // RegExp letterReg = RegExp(r".*[A-Za-z].*");
  RegExp specialCharacter = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
  final RegistrationController controller = RegistrationController.instance;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void checkValue(String? value) {
    _password = value!.trim();

    if (_password.isEmpty) {
      setState(() {
        _strength = 0;
      });
    } else if (_password.length < 6) {
      setState(() {
        _strength = 1 / 4;
        numberOfcharacters = false;
      });
    } else if (_password.length < 8) {
      setState(() {
        _strength = 2 / 4;
        numberOfcharacters = false;
      });
    } else {
      if (!specialCharacter.hasMatch(_password) ||
          !numReg.hasMatch(_password)) {
        setState(() {
          // Password length >= 8
          // But doesn't contain both letter and digit characters
          _strength = 3 / 4;
          numberOfcharacters = true;
          hasSpecialCharacters = false;
          includeNumber = false;
        });
      } else {
        // Password length >= 8
        // Password contains both letter and digit characters
        setState(() {
          _strength = 1;
          includeNumber = true;
          hasSpecialCharacters = true;
          numberOfcharacters = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: whitecolor,
        body: Obx(() {
          return LoadingOverlayPro(
            isLoading: controller.isLoading.value,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Container(
                        height: heightSize(100),
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(color: maincolor),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: heightSize(20),
                              left: widthSize(30),
                              bottom: heightSize(20.5)),
                          child: Row(children: [
                            GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: backbutton()),
                            SizedBox(width: widthSize(47)),
                            Text(
                              '${widget.type.capitalize} Registration',
                              style: TextStyle(
                                  color: whitecolor,
                                  fontSize: fontSize(20),
                                  fontWeight: FontWeight.w600),
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(height: heightSize(66)),
                      Padding(
                        padding: EdgeInsets.only(left: widthSize(30)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "CREATE PASSWORD",
                            style: TextStyle(
                                color: maincolor,
                                fontSize: fontSize(14),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(height: heightSize(24)),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: widthSize(30)),
                        child: SizedBox(
                          height: heightSize(100),
                          width: widthSize(400),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Password",
                                    style: TextStyle(
                                        fontSize: fontSize(14),
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                    height: heightSize(65),
                                    child: InputTextField(
                                      obscureText: true,
                                      hintText: "*****************",
                                      onChanged: (value) => checkValue(value),
                                      controller: password,
                                      password: true,
                                      textInputAction: true,
                                    ))
                              ]),
                        ),
                      ),
                      SizedBox(height: heightSize(17)),
                      CheckThePassword(
                        strength: _strength,
                        hascharacter: hasSpecialCharacters,
                        numberofCharacters: numberOfcharacters,
                        includeNumbers: includeNumber,
                      ),
                      SizedBox(height: heightSize(31)),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: widthSize(30)),
                        child: SizedBox(
                          height: heightSize(94),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Confirm Password",
                                    style: TextStyle(
                                        fontSize: fontSize(14),
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                    height: heightSize(65),
                                    child: InputTextField(
                                      obscureText: true,
                                      hintText: "*****************",
                                      controller: confirmpassword,
                                      password: true,
                                      textInputAction: true,
                                      validator: (String? val) {
                                        if (val != password.text) {
                                          return "Password doesnt match";
                                        }
                                        return null;
                                      },
                                    ))
                              ]),
                        ),
                      ),
                      SizedBox(height: heightSize(10)),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: widthSize(30)),
                        child: Text(
                          "By tapping sign up means you’re okay with our Terms of Service and Privacy Policy",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: fontSize(14),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(height: heightSize(32)),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: widthSize(30)),
                        child: SizedBox(
                          height: heightSize(93),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppButtons(
                                    textColor: whitecolor,
                                    fontSize: fontSize(14),
                                    backgroundColor: maincolor,
                                    text: "Sign up",
                                    borderColor: maincolor,
                                    height: heightSize(60),
                                    onTap: () async {
                                      final clear = formkey.currentState;
                                      if (clear!.validate()) {
                                        controller.isLoading.value = true;
                                        final model = {
                                          "password":
                                              confirmpassword.text.trim(),
                                          "email": controller
                                              .userCredentials.value.email,
                                        };
                                        RxBool isdone = await ApiCalls()
                                            .changePassword(model);
                                        if (isdone.value) {
                                          controller.isLoading.value = false;
                                          showAlertMessageTeacher(
                                              context,
                                              true,
                                              heightSize(490),
                                              widthSize(350),
                                              "assets/Teacher_Dash/bellicon.svg",
                                              heightSize(82),
                                              NotificationMessage(
                                                  type: widget.type));
                                        }
                                      }
                                    }),
                                SizedBox(
                                  height: 23,
                                  width: widthSize(171),
                                  child: Text(
                                    "Already an account? Login",
                                    style: TextStyle(
                                        fontSize: fontSize(14),
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // ProfileDetails()
            ),
          );
        }),
      ),
    );
  }
}
