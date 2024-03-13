import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/pages/School%20Dashboard/Manage%20Attendance/views/select_section_attendance.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/Assignment Page/widget/selectclassWidget.dart';
import '../../Create Student/controller/student_controller.dart';

class AdminSelectStudentClassAttendance extends StatelessWidget {
  AdminSelectStudentClassAttendance({super.key});

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
                  horizontal: widthSize(30), vertical: heightSize(30)),
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
                        Get.to(() => AdminSelectStudentSectionAttend(
                            studentclass: "Sss Three"));
                      },
                      child: selectClassOptions(context, "Sss Three"),
                    ),
                    SizedBox(height: heightSize(10)),
                    GestureDetector(
                      onTap: () {
                        controller.classAssigned.value = "Sss Two";
                        Get.to(() => AdminSelectStudentSectionAttend(
                            studentclass: "Sss Two"));
                      },
                      child: selectClassOptions(context, "Sss Two"),
                    ),
                    SizedBox(height: heightSize(10)),
                    GestureDetector(
                      onTap: () {
                        controller.classAssigned.value = "Sss One";
                        Get.to(() => AdminSelectStudentSectionAttend(
                            studentclass: "Sss One"));
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
                        Get.to(() => AdminSelectStudentSectionAttend(
                            studentclass: "Jss Three"));
                      },
                      child: selectClassOptions(context, "Jss Three"),
                    ),
                    SizedBox(height: heightSize(10)),
                    GestureDetector(
                      onTap: () {
                        controller.classAssigned.value = "Jss Two";
                        Get.to(() => AdminSelectStudentSectionAttend(
                            studentclass: "Jss Two"));
                      },
                      child: selectClassOptions(context, "Jss Two"),
                    ),
                    SizedBox(height: heightSize(10)),
                    GestureDetector(
                      onTap: () {
                        controller.classAssigned.value = "Jss One";
                        Get.to(() => AdminSelectStudentSectionAttend(
                            studentclass: "Jss One"));
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
