import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/common/alertMessage.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/common/getxmessage.dart';

import '../../../../services/api_calls.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../DashBoard/controller/teacher_controller.dart';
import '../../SIgn-In Page/controller/registrationController.dart';
import '../../SIgn-In Page/widget/textFieldWidget.dart';

// ignore: must_be_immutable
class TeacherChangePasswordScreen extends StatelessWidget {
  TeacherChangePasswordScreen({super.key});

  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TeacherController teacherController = TeacherController.instance;
  RegistrationController regController = RegistrationController.instance;
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
      body: Obx(() {
        return LoadingOverlayPro(
          isLoading: teacherController.isloading.value,
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
                    if (val!.isEmpty || val.length <= 6) {
                      return "minimum length of 6 characters";
                    }
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
                    if (val != newPassword.text.trim()) {
                      return "Password doesnt match";
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
                        teacherController.isloading.value = true;

                        final model = {
                          "password": confirmPassword.text.trim(),
                        };
                        var done = await ApiCalls().updateTeacherPassword(
                            model,
                            regController.teachermodel.value.id,
                            regController.teachermodel.value.createdBy);

                        if (done) {
                          teacherController.isloading.value = false;
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
                                    "You have successfully changed your password",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: fontSize(16),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ]),
                              ));
                        } else {
                          getErrorSnackBar("Password Not Updated");
                        }
                      } else {
                        getErrorSnackBar("Please ensure all fields are Filled");
                      }
                    })
              ]),
            ),
          ),
        );
      }),
    );
  }
}
