// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/DashBoard/controller/teacher_controller.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Manage%20Student/views/teacher_student_selection1.dart';

import '../../../../common/button.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../SIgn-In Page/widget/sign_up_Box.dart';

class TeacherResultsMainPage extends StatelessWidget {
  TeacherResultsMainPage({super.key});

  TeacherController teacherController = TeacherController.instance;

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
              SizedBox(width: widthSize(111.5)),
              Text(
                'Results',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: fontSize(20),
                    fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Padding(
              padding: EdgeInsets.only(
                  top: heightSize(38),
                  left: widthSize(30),
                  right: widthSize(30)),
              child: Column(children: [
                SignupBox(
                  image: "assets/Teacher_Dash/resultsimage.png",
                  header: "Upload results",
                  subtext: "Select to upload a student result",
                  onTap: () {
                    teacherController.isManage.value = false;
                    Get.to(() => TeacherStudentSelectClass(type: "Results"));
                  },
                  subtextSize: 43,
                ),
                SizedBox(height: heightSize(20)),
                SignupBox(
                  image: "assets/Teacher_Dash/resultsimage.png",
                  header: "Manage results",
                  subtext: "Select to manage all results posted by you",
                  onTap: () {
                    teacherController.isManage.value = true;
                    Get.to(() => TeacherStudentSelectClass(type: "Results"));
                  },
                  subtextSize: 63,
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
