import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/common/alertMessage.dart';
import 'package:school_management/common/button.dart';

import '../../../../services/api_calls.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/SIgn-In Page/controller/registrationController.dart';
import '../../../Teacher dashboard/SIgn-In Page/widget/textFieldWidget.dart';

// ignore: must_be_immutable
class AdminChangePasswordScreen extends StatelessWidget {
  AdminChangePasswordScreen({super.key});

  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  final RegistrationController regController = RegistrationController.instance;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
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
                child: SizedBox(
                  height: heightSize(37.5),
                  width: widthSize(37.5),
                  child: Image.asset("assets/Teacher_Dash/backarrow.png"),
                ),
              ),
              SizedBox(width: widthSize(60.5)),
              Text(
                'Change Password',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: fontSize(20),
                    fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ),
      ),
      body: LoadingOverlayPro(
        isLoading: regController.isLoading.value,
        child: Form(
          key: formkey,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: widthSize(30), vertical: heightSize(30)),
            child: Column(children: [
              TextFieldWidgetRegister(
                label: "Old Password",
                hinttext: "*****************",
                controller: oldPassword,
                obscure: true,
                password: true,
                validator: (String? val) {
                  if (val!.isEmpty) {
                    return "Please enter this field";
                  }
                },
              ),
              SizedBox(height: heightSize(20)),
              TextFieldWidgetRegister(
                obscure: true,
                password: true,
                label: "New Password",
                hinttext: "*****************",
                controller: newPassword,
                validator: (String? val) {
                  if (val!.isEmpty) {
                    return "Please enter this field";
                  } else if (val.length < 9) {
                    return "The Password is too short";
                  }
                  return null;
                },
              ),
              SizedBox(height: heightSize(20)),
              TextFieldWidgetRegister(
                obscure: true,
                password: true,
                label: "Confirm Password",
                hinttext: "*****************",
                controller: confirmPassword,
                validator: (String? val) {
                  if (val!.isEmpty) {
                    return "Please enter this field";
                  } else if (val != newPassword.text.trim()) {
                    return "Password does not match";
                  }
                  return null;
                },
              ),
              SizedBox(height: heightSize(23)),
              AppButtons(
                  textColor: whitecolor,
                  fontSize: fontSize(14),
                  backgroundColor: maincolor,
                  text: "Save changes",
                  borderColor: maincolor,
                  height: heightSize(60),
                  onTap: () async {
                    final clear = formkey.currentState;
                    if (clear!.validate()) {
                      regController.isLoading.value = true;

                      final model = {
                        "email": regController.userCredentials.value.email,
                        "password": confirmPassword.text.trim()
                      };
                      RxBool done = await ApiCalls().changePassword(model);
                      if (done.value == true) {
                        regController.isLoading.value = false;
                        showAlertMessage(
                            context,
                            false,
                            heightSize(266),
                            widthSize(288),
                            "assets/Teacher_Dash/goodtick_green.png",
                            heightSize(166),
                            SizedBox(
                              width: widthSize(288),
                              child: Column(children: [
                                SizedBox(height: heightSize(15)),
                                Text(
                                  "Successfully changed",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: fontSize(20),
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: heightSize(10)),
                                Text(
                                  "Your account name has been changed successfully",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: fontSize(16),
                                      fontWeight: FontWeight.w600),
                                ),
                              ]),
                            ));
                      }
                    }
                  })
            ]),
          ),
        ),
      ),
    );
  }
}
