// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/pages/School%20Dashboard/Manage%20Attendance/views/view_searched_student.dart';

import '../../../../common/button.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/Assignment Page/widget/selectclassWidget.dart';
import '../../Create Student/controller/student_controller.dart';
import '../../Manage Student/view/managestudentStudents.dart';
import '../../home screen/controller/adminController.dart';

class AdminSelectStudentSectionAttend extends StatelessWidget {
  final String studentclass;
  AdminSelectStudentSectionAttend({super.key, required this.studentclass});

  final StudentController controller = StudentController.instance;
  AdminController adminController = AdminController.instance;

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
          isLoading: adminController.isloading.value,
          child: LayoutBuilder(
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
                        Text(
                          studentclass,
                          style: TextStyle(
                              fontSize: fontSize(16),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: heightSize(10)),
                        GestureDetector(
                          onTap: () async {
                            controller.classSection.value = "A";
                            adminController.isloading.value = true;
                            await adminController.fetchStudentsProfile();
                            adminController.isloading.value = false;

                            Get.to(() => AdminViewSearchedStudentAttendance());
                          },
                          child: selectClassOptions(context, "A"),
                        ),
                        SizedBox(height: heightSize(10)),
                        GestureDetector(
                          onTap: () async {
                            controller.classSection.value = "B";
                            adminController.isloading.value = true;
                            await adminController.fetchStudentsProfile();
                            adminController.isloading.value = false;

                            Get.to(() => AdminViewSearchedStudentAttendance());
                          },
                          child: selectClassOptions(context, "B"),
                        ),
                        SizedBox(height: heightSize(10)),
                        GestureDetector(
                          onTap: () async {
                            controller.classSection.value = "C";

                            adminController.isloading.value = true;
                            await adminController.fetchStudentsProfile();
                            adminController.isloading.value = false;

                            Get.to(() => AdminViewSearchedStudentAttendance());
                          },
                          child: selectClassOptions(context, "C"),
                        ),
                        SizedBox(height: heightSize(10)),
                        GestureDetector(
                          onTap: () async {
                            controller.classSection.value = "D";
                            adminController.isloading.value = true;
                            await adminController.fetchStudentsProfile();
                            adminController.isloading.value = false;

                            Get.to(() => AdminViewSearchedStudentAttendance());
                          },
                          child: selectClassOptions(context, "D"),
                        ),
                      ]),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
