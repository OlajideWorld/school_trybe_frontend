import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/DashBoard/controller/teacher_controller.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Manage%20Student/views/teacher_student_selection2.dart';

import '../../../../common/button.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../School Dashboard/Create Student/controller/student_controller.dart';
import '../../Assignment Page/widget/selectclassWidget.dart';

class TeacherStudentSelectClass extends StatelessWidget {
  final String type;
  TeacherStudentSelectClass({super.key, required this.type});

  final StudentController controller = StudentController.instance;

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
              SizedBox(width: widthSize(70.6)),
              Text(
                'Select Class',
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
              padding: EdgeInsets.symmetric(
                  horizontal: widthSize(30), vertical: heightSize(32)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1st Category
                    Text(
                      "SENIOR SECONDARY SCHOOL",
                      style: TextStyle(
                          fontSize: fontSize(14), fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: heightSize(10)),
                    GestureDetector(
                      onTap: () {
                        controller.classAssigned.value = "Sss Three";
                        Get.to(() => TeacherStudentSelectSection(
                              studentclass: "Sss Three",
                              type: type,
                            ));
                      },
                      child: selectClassOptions(context, "Sss Three"),
                    ),
                    SizedBox(height: heightSize(10)),
                    GestureDetector(
                      onTap: () {
                        controller.classAssigned.value = "Sss Two";
                        Get.to(() => TeacherStudentSelectSection(
                              studentclass: "Sss Two",
                              type: type,
                            ));
                      },
                      child: selectClassOptions(context, "Sss Two"),
                    ),
                    SizedBox(height: heightSize(10)),
                    GestureDetector(
                      onTap: () {
                        controller.classAssigned.value = "Sss One";
                        Get.to(() => TeacherStudentSelectSection(
                              studentclass: "Sss One",
                              type: type,
                            ));
                      },
                      child: selectClassOptions(context, "Sss One"),
                    ),
                    SizedBox(height: heightSize(40)),

                    // 2nd Category
                    Text(
                      "JUNIOR SECONDARY SCHOOL",
                      style: TextStyle(
                          fontSize: fontSize(14), fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: heightSize(10)),
                    GestureDetector(
                      onTap: () {
                        controller.classAssigned.value = "Jss Three";
                        Get.to(() => TeacherStudentSelectSection(
                              studentclass: "Jss Three",
                              type: type,
                            ));
                      },
                      child: selectClassOptions(context, "Jss Three"),
                    ),
                    SizedBox(height: heightSize(10)),
                    GestureDetector(
                      onTap: () {
                        controller.classAssigned.value = "Jss Two";
                        Get.to(() => TeacherStudentSelectSection(
                              studentclass: "Jss Two",
                              type: type,
                            ));
                      },
                      child: selectClassOptions(context, "Jss Two"),
                    ),
                    SizedBox(height: heightSize(10)),
                    GestureDetector(
                      onTap: () {
                        controller.classAssigned.value = "Jss One";
                        Get.to(() => TeacherStudentSelectSection(
                              studentclass: "Jss One",
                              type: type,
                            ));
                      },
                      child: selectClassOptions(context, "Jss One"),
                    ),
                    SizedBox(height: heightSize(40)),
                  ]),
            ),
          );
        },
      ),
    );
  }
}
