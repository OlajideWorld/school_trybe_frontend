import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/button.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../SIgn-In Page/widget/sign_up_Box.dart';
import '../../Teacher Manage Student/views/teacher_student_selection1.dart';

class TeacherStudentAttendanceMainPage extends StatelessWidget {
  const TeacherStudentAttendanceMainPage({super.key});

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
              SizedBox(width: widthSize(53.5)),
              Text(
                'Manage attendance',
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
                  top: heightSize(36),
                  left: widthSize(30),
                  right: widthSize(30)),
              child: Column(children: [
                SignupBox(
                  image: "assets/School_Dash/attendanceimg.png",
                  header: "Mark attendance",
                  subtext: "Select to mark student profile",
                  onTap: () {
                    Get.to(() => TeacherStudentSelectClass(
                          type: "Attendance",
                        ));
                  },
                  subtextSize: 43,
                ),
                SizedBox(height: heightSize(40)),
                SignupBox(
                  image: "assets/School_Dash/attendanceimg.png",
                  header: "Manage attendance",
                  subtext: "Select to manage student profile",
                  onTap: () {
                    Get.to(() => TeacherStudentSelectClass(
                          type: "Attendance",
                        ));
                  },
                  subtextSize: 43,
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
