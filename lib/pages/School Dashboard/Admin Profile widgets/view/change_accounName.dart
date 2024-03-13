// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/pages/School%20Dashboard/Admin%20Profile%20widgets/widget/accountName_field.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Profile%20Page/widget/accountName_field.dart';
import 'package:school_management/services/api_calls.dart';

import '../../../../common/alertMessage.dart';
import '../../../../common/button.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class AdminChangeAccountNameProfile extends StatelessWidget {
  AdminChangeAccountNameProfile({super.key});

  RegistrationController regController = RegistrationController.instance;

  TextEditingController name = TextEditingController();
  TextEditingController middlename = TextEditingController();
  TextEditingController lastname = TextEditingController();
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
              SizedBox(width: widthSize(75.5)),
              Text(
                'Account Name',
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
          isLoading: regController.isLoading.value,
          child: Form(
            key: formkey,
            child: Padding(
              padding: EdgeInsets.only(
                  top: heightSize(43),
                  left: widthSize(30),
                  right: widthSize(30)),
              child: Column(children: [
                AdminAccountNameFields(
                  header: "First Name",
                  hinttext: regController.userCredentials.value.firstname,
                  controller: name,
                  validator: (String? val) {
                    if (val!.isEmpty) {
                      return "Please enter your name";
                    }
                  },
                ),
                SizedBox(height: heightSize(20)),
                AdminAccountNameFields(
                    header: "Middle Name",
                    hinttext: "",
                    controller: middlename,
                    validator: (String? val) {
                      if (val!.isEmpty) {
                        return "Please enter your middle name";
                      }
                    }),
                SizedBox(height: heightSize(20)),
                AdminAccountNameFields(
                    header: "Last Name",
                    hinttext: regController.userCredentials.value.lastname,
                    controller: lastname,
                    validator: (String? val) {
                      if (val!.isEmpty) {
                        return "Please enter your lastname";
                      }
                    }),
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
                          "firstname": name.text.trim(),
                          "lastname": lastname.text.trim()
                        };
                        var done = await ApiCalls().updateAdminProfile(
                            model,
                            regController.userCredentials.value.id,
                            regController.userCredentials.value.email);
                        if (done) {
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
        );
      }),
    );
  }
}
