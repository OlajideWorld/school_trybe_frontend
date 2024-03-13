// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

import '../../../../common/alertMessage.dart';
import '../../../../common/button.dart';
import '../../../../common/getxmessage.dart';
import '../../../../services/api_calls.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../DashBoard/controller/teacher_controller.dart';
import '../../SIgn-In Page/controller/registrationController.dart';
import '../../SIgn-In Page/widget/SelectionWidget.dart';

class TeacherClassAssignedProfile extends StatelessWidget {
  TeacherClassAssignedProfile({super.key});

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
              SizedBox(width: widthSize(75.5)),
              Text(
                'Class Assigned',
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
          child: Padding(
            padding: EdgeInsets.only(
                top: heightSize(34), left: widthSize(30), right: widthSize(30)),
            child: Column(children: [
              const SelectYourClass(),
              SizedBox(height: heightSize(33)),
              const SelectYourclassSelection(),
              SizedBox(height: heightSize(33)),
              AppButtons(
                  textColor: whitecolor,
                  fontSize: fontSize(14),
                  backgroundColor: maincolor,
                  text: "Save changes",
                  borderColor: maincolor,
                  height: heightSize(60),
                  onTap: () async {
                    teacherController.isloading.value = true;

                    final model = {
                      "className": regController.classSelection.value,
                      "classSection": regController.classSection.value
                    };
                    var done = await ApiCalls().updateTeacher(
                        model, regController.teachermodel.value.createdBy);

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
                                "Your account name has been changed successfully",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: fontSize(16),
                                    fontWeight: FontWeight.w600),
                              ),
                            ]),
                          ));
                    } else {
                      getErrorSnackBar("Not able to update Teacher Model");
                    }
                  })
            ]),
          ),
        );
      }),
    );
  }
}
