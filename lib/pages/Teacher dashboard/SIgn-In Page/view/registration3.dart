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
import '../../Forget Password/widget/profile_details.dart';

class RegistrationScreen3 extends StatefulWidget {
  final String type;
  RegistrationScreen3({super.key, required this.type});

  @override
  State<RegistrationScreen3> createState() => _RegistrationScreen3State();
}

class _RegistrationScreen3State extends State<RegistrationScreen3> {
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
                  child: backbutton()),
              SizedBox(width: widthSize(66.5)),
              Text(
                '${widget.type} Registration',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: fontSize(20),
                    fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ),
      ),
      body: Obx(() {
        return LoadingOverlayPro(
          isLoading: controller.isLoading.value,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formkey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  SizedBox(height: heightSize(30)),
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
                    padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
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
                                  validator: (String? val) {
                                    if (val!.length < 6 || val.isEmpty) {
                                      return "Please input your password, more than 6 characters";
                                    }
                                    return null;
                                  },
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
                    padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
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
                    padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
                    child: Text(
                      "By tapping sign up means you’re okay with our Terms of Service and Privacy Policy",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: fontSize(14), fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(height: heightSize(32)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
                    child: SizedBox(
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
                                      "password": confirmpassword.text.trim(),
                                    };
                                    var done = await ApiCalls()
                                        .updateTeacherPassword(
                                            model,
                                            controller.teachermodel.value.id,
                                            controller
                                                .teachermodel.value.createdBy);
                                    if (done) {
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
                                    } else {
                                      controller.isLoading.value = false;
                                    }
                                  }
                                }),
                            SizedBox(height: heightSize(20)),
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
        );
      }),
    );
  }
}
