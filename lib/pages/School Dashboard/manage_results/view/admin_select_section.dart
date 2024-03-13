import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/pages/School%20Dashboard/home%20screen/controller/adminController.dart';
import 'package:school_management/pages/School%20Dashboard/manage_results/view/view_Uploaded_results.dart';
import 'package:school_management/pages/School%20Dashboard/manage_results/view/view_student_results.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/Assignment Page/widget/selectclassWidget.dart';
import '../../Create Student/controller/student_controller.dart';

class AdminSelectSectionScreen extends StatelessWidget {
  final String studentclass;
  final bool isManage;
  AdminSelectSectionScreen(
      {super.key, required this.studentclass, required this.isManage});

  final StudentController controller = StudentController.instance;
  final AdminController adminController = AdminController.instance;

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
                  adminController.isloading.value = true;
                  await adminController.fetchStudentsProfile();
                  adminController.isloading.value = false;

                  if (isManage == false) {
                    Get.to(() => AdminViewStudentresults());
                  } else {
                    Get.to(() => AdminViewUploadedResults());
                  }
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

                  if (isManage == false) {
                    Get.to(() => AdminViewStudentresults());
                  } else {
                    Get.to(() => AdminViewUploadedResults());
                  }
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
                  if (isManage == false) {
                    Get.to(() => AdminViewStudentresults());
                  } else {
                    Get.to(() => AdminViewUploadedResults());
                  }
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

                  if (isManage == false) {
                    Get.to(() => AdminViewStudentresults());
                  } else {
                    Get.to(() => AdminViewUploadedResults());
                  }
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
