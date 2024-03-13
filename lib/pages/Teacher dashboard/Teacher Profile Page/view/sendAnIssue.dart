// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/common/getxmessage.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Profile%20Page/widget/accountName_field.dart';
import 'package:school_management/services/api_calls.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../common/alertMessage.dart';
import '../../../../common/button.dart';
import '../../../../utils/sizes.dart';
import '../../DashBoard/controller/teacher_controller.dart';
import '../../SIgn-In Page/controller/registrationController.dart';

class TeacherSendAnIssueScreen extends StatelessWidget {
  TeacherSendAnIssueScreen({super.key});

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TeacherController teacherController = TeacherController.instance;

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
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
              SizedBox(width: widthSize(72.5)),
              Text(
                'Help & Support',
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
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(
                    top: heightSize(53),
                    left: widthSize(30),
                    right: widthSize(30)),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: heightSize(25),
                        width: widthSize(25),
                        child: Image.asset("assets/Teacher_Dash/issuepage.png"),
                      ),
                      SizedBox(width: widthSize(5)),
                      Text(
                        'Question',
                        style: TextStyle(
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(height: heightSize(20)),
                  TeacherAccountNameFields(
                    header: "Title",
                    hinttext: "Input title",
                    controller: title,
                    validator: (String? val) {
                      if (val!.isEmpty) {
                        return "Please enter your title";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: heightSize(20)),
                  SizedBox(
                    height: heightSize(206),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Description",
                              style: TextStyle(
                                  fontSize: fontSize(14),
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: heightSize(10)),
                          TextFormField(
                            controller: description,
                            validator: (String? val) {
                              if (val!.isEmpty) {
                                return "Please enter more detais about your Issues";
                              }
                              return null;
                            },
                            maxLines: 7,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: heightSize(10),
                                    left: widthSize(10),
                                    right: widthSize(10)),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                hintStyle: TextStyle(
                                    fontSize: fontSize(14),
                                    fontWeight: FontWeight.w400),
                                hintText: "Tell us your issue"),
                          )
                        ]),
                  ),
                  SizedBox(height: heightSize(28)),
                  AppButtons(
                      textColor: whitecolor,
                      fontSize: fontSize(14),
                      backgroundColor: maincolor,
                      text: "Save messages",
                      borderColor: maincolor,
                      height: heightSize(60),
                      onTap: () async {
                        final clear = formkey.currentState;

                        if (clear!.validate()) {
                          teacherController.isloading.value = true;

                          final model = {
                            "name": regController.teachermodel.value.firstname,
                            "email": regController.teachermodel.value.email,
                            "tile": title.text.trim(),
                            "description": description.text.trim()
                          };

                          var done = await ApiCalls().createComplaints(model);
                          if (done) {
                            teacherController.isloading.value = false;
                            showAlertMessageTeacher(
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
                                      "Your complaints has been sent successfully",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: fontSize(16),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ]),
                                ));
                          }
                        } else {
                          getErrorSnackBar(
                              "Please fill all the necessary fields");
                        }
                      })
                ]),
              ),
            ),
          ),
        );
      }),
    );
  }
}
