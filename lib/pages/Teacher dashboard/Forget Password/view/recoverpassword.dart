import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/alertMessage.dart';
import 'package:school_management/pages/Teacher%20dashboard/Forget%20Password/widget/alertmessages.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../common/button.dart';
import '../../../../common/input_TextField.dart';
import '../../../../utils/sizes.dart';
import '../../SIgn-In Page/widget/checkthepassword.dart';
import '../widget/profile_details.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({super.key});

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  double _strength = 0;

  late String _password;

  bool hasSpecialCharacters = false;

  bool numberOfcharacters = false;

  bool includeNumber = false;

  RegExp numReg = RegExp(r".*[0-9].*");

  // RegExp letterReg = RegExp(r".*[A-Za-z].*");
  RegExp specialCharacter = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

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
    return Scaffold(
      backgroundColor: whitecolor,
      body: Stack(children: [
        Form(
          key: formkey,
          child: Column(
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
                      'Set New Password',
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: heightSize(94),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("New Password",
                                style: TextStyle(
                                    fontSize: fontSize(14),
                                    fontWeight: FontWeight.w600)),
                            SizedBox(
                                height: heightSize(65),
                                child: InputTextField(
                                  obscureText: true,
                                  hintText: "*****************",
                                  controller: password,
                                  onChanged: (value) => checkValue(value),
                                  password: true,
                                  textInputAction: true,
                                ))
                          ]),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CheckThePassword(
                        strength: _strength,
                        hascharacter: hasSpecialCharacters,
                        numberofCharacters: numberOfcharacters,
                        includeNumbers: includeNumber,
                      ),
                    ),
                    SizedBox(height: heightSize(34)),
                    SizedBox(
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
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: widthSize(30), vertical: heightSize(84)),
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: SizedBox(
                      height: heightSize(106),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppButtons(
                                textColor: whitecolor,
                                fontSize: fontSize(16),
                                backgroundColor: maincolor,
                                text: "Confirm",
                                borderColor: maincolor,
                                height: heightSize(63),
                                onTap: () {
                                  final clear = formkey.currentState;
                                  if (clear!.validate()) {
                                    showAlertMessage(
                                        context,
                                        false,
                                        heightSize(417),
                                        widthSize(305),
                                        "assets/Teacher_Dash/goodtick_green.png",
                                        heightSize(166),
                                        const AlertMessages());
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
                                      ..onTap =
                                          () => debugPrint('Sign up Page'),
                                  ),
                                )
                              ],
                            ),
                          ]),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        ProfileDetails()
      ]),
    );
  }
}
