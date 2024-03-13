import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/common/getxmessage.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/widget/SelectionWidget.dart';

import '../../../../common/alertMessage.dart';
import '../../../../common/button.dart';
import '../../../../services/api_calls.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../DashBoard/controller/teacher_controller.dart';
import '../../SIgn-In Page/controller/registrationController.dart';
import '../../SIgn-In Page/widget/textFieldWidget.dart';

class TeacherSubjectAssignedProfile extends StatelessWidget {
  TeacherSubjectAssignedProfile({super.key});

  TeacherController teacherController = TeacherController.instance;
  RegistrationController regController = RegistrationController.instance;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController subjectAssigned = TextEditingController();

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
              SizedBox(width: widthSize(64.5)),
              Text(
                'Subject Assigned',
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
              padding: EdgeInsets.only(
                  top: heightSize(47),
                  left: widthSize(30),
                  right: widthSize(30),
                  bottom: heightSize(40)),
              child: Column(children: [
                // const SelectSubject(),
                TextFieldWidgetRegister(
                    label: "Subject Assigned",
                    hinttext: "Subject Assigned",
                    obscure: false,
                    password: false,
                    validator: (String? val) {
                      if (val!.isEmpty) {
                        return "Please enter your Subject Role";
                      }
                      return null;
                    },
                    controller: subjectAssigned),
                Expanded(
                    child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: AppButtons(
                    text: "Save changes",
                    textColor: whitecolor,
                    fontSize: fontSize(14),
                    backgroundColor: maincolor,
                    borderColor: maincolor,
                    height: heightSize(60),
                    onTap: () async {
                      final clear = formkey.currentState;

                      if (clear!.validate()) {
                        teacherController.isloading.value = true;

                        final model = {
                          "subjectRole": subjectAssigned.text.trim(),
                        };

                        var done = await ApiCalls().updateTeacher(
                            model, regController.teachermodel.value.createdBy);

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
                                    "You have successfully changed the subject assigned to you",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: fontSize(16),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ]),
                              ));
                        } else {
                          getErrorSnackBar("Unable to Update Subject Assigned");
                        }
                      } else {
                        getErrorSnackBar("Please Enter your New Subject");
                      }
                    },
                  ),
                ))
              ]),
            ),
          ),
        );
      }),
    );
  }
}
