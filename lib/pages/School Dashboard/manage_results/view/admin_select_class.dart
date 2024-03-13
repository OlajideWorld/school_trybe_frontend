import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/pages/School%20Dashboard/manage_results/view/admin_select_section.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/Assignment Page/widget/selectclassWidget.dart';
import '../../Create Student/controller/student_controller.dart';

class AdminSelectClassScreen extends StatelessWidget {
  final bool isManage;
  AdminSelectClassScreen({super.key, required this.isManage});

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
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: widthSize(30), vertical: heightSize(32)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // 1st Category
          Text(
            "SENIOR SECONDARY SCHOOL",
            style:
                TextStyle(fontSize: fontSize(14), fontWeight: FontWeight.w600),
          ),
          SizedBox(height: heightSize(10)),
          GestureDetector(
            onTap: () {
              controller.classAssigned.value = "Sss Three";
              Get.to(() => AdminSelectSectionScreen(
                  studentclass: "Sss Three", isManage: isManage));
            },
            child: selectClassOptions(context, "Sss Three"),
          ),
          SizedBox(height: heightSize(10)),
          GestureDetector(
            onTap: () {
              controller.classAssigned.value = "Sss Two";
              Get.to(() => AdminSelectSectionScreen(
                  studentclass: "Sss Two", isManage: isManage));
            },
            child: selectClassOptions(context, "Sss Two"),
          ),
          SizedBox(height: heightSize(10)),
          GestureDetector(
            onTap: () {
              controller.classAssigned.value = "Sss One";
              Get.to(() => AdminSelectSectionScreen(
                  studentclass: "Sss One", isManage: isManage));
            },
            child: selectClassOptions(context, "Sss One"),
          ),
          SizedBox(height: heightSize(40)),

          // 2nd Category
          Text(
            "JUNIOR SECONDARY SCHOOL",
            style:
                TextStyle(fontSize: fontSize(14), fontWeight: FontWeight.w600),
          ),
          SizedBox(height: heightSize(10)),
          GestureDetector(
            onTap: () {
              controller.classAssigned.value = "Jss Three";
              Get.to(() => AdminSelectSectionScreen(
                  studentclass: "Jss Three", isManage: isManage));
            },
            child: selectClassOptions(context, "Jss Three"),
          ),
          SizedBox(height: heightSize(10)),
          GestureDetector(
            onTap: () {
              controller.classAssigned.value = "Jss Two";
              Get.to(() => AdminSelectSectionScreen(
                  studentclass: "Jss Two", isManage: isManage));
            },
            child: selectClassOptions(context, "Jss Two"),
          ),
          SizedBox(height: heightSize(10)),
          GestureDetector(
            onTap: () {
              controller.classAssigned.value = "Jss One";
              Get.to(() => AdminSelectSectionScreen(
                  studentclass: "Jss One", isManage: isManage));
            },
            child: selectClassOptions(context, "Jss One"),
          ),
          SizedBox(height: heightSize(40)),
        ]),
      ),
    );
  }
}
