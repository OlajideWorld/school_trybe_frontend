import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Manage%20Student/views/view_sorted_student.dart';

import '../../../../common/button.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../School Dashboard/Create Student/controller/student_controller.dart';
import '../../Assignment Page/widget/selectclassWidget.dart';
import '../../DashBoard/controller/teacher_controller.dart';
import '../../Teacher Manage Attendance/views/student_list_for_attendance.dart';

class TeacherStudentSelectSection extends StatelessWidget {
  final String studentclass;
  final String type;
  TeacherStudentSelectSection(
      {super.key, required this.studentclass, required this.type});

  final StudentController controller = StudentController.instance;
  final TeacherController teacherController = TeacherController.instance;

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
                'Class assigned',
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
            padding: EdgeInsets.symmetric(
                horizontal: widthSize(30), vertical: heightSize(32)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                studentclass,
                style: TextStyle(
                    fontSize: fontSize(16), fontWeight: FontWeight.w600),
              ),
              SizedBox(height: heightSize(10)),
              GestureDetector(
                onTap: () async {
                  controller.classSection.value = "A";
                  teacherController.isloading.value = true;
                  await teacherController.fetchStudentsProfile();
                  teacherController.isloading.value = false;

                  if (type == "Manage Student") {
                    Get.to(() => TeacherSortedStudent());
                  } else if (type == "Attendance") {
                    Get.to(() => StudentListForAttendanceScreen());
                  } else if (type == "Results") {}
                },
                child: selectClassOptions(context, "A"),
              ),
              SizedBox(height: heightSize(10)),
              GestureDetector(
                onTap: () async {
                  controller.classSection.value = "B";
                  teacherController.isloading.value = true;
                  await teacherController.fetchStudentsProfile();
                  teacherController.isloading.value = false;

                  if (type == "Manage Student") {
                    Get.to(() => TeacherSortedStudent());
                  } else if (type == "Attendance") {
                    Get.to(() => StudentListForAttendanceScreen());
                  } else if (type == "Results") {
                    if (teacherController.isManage.value == false) {
                      // Get.to(() => AdminViewStudentresults());
                    } else {
                      // Get.to(() => AdminViewUploadedResults());
                    }
                  }
                },
                child: selectClassOptions(context, "B"),
              ),
              SizedBox(height: heightSize(10)),
              GestureDetector(
                onTap: () async {
                  controller.classSection.value = "C";

                  teacherController.isloading.value = true;
                  await teacherController.fetchStudentsProfile();
                  teacherController.isloading.value = false;

                  if (type == "Manage Student") {
                    Get.to(() => TeacherSortedStudent());
                  } else if (type == "Attendance") {
                    Get.to(() => StudentListForAttendanceScreen());
                  } else if (type == "Results") {}
                },
                child: selectClassOptions(context, "C"),
              ),
              SizedBox(height: heightSize(10)),
              GestureDetector(
                onTap: () async {
                  controller.classSection.value = "D";
                  teacherController.isloading.value = true;
                  await teacherController.fetchStudentsProfile();
                  teacherController.isloading.value = false;

                  if (type == "Manage Student") {
                    Get.to(() => TeacherSortedStudent());
                  } else if (type == "Attendance") {
                    Get.to(() => StudentListForAttendanceScreen());
                  } else if (type == "Results") {}
                },
                child: selectClassOptions(context, "D"),
              ),
            ]),
          ),
        );
      }),
    );
  }
}
