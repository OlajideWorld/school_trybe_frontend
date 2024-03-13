import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/alertMessage.dart';
import 'package:school_management/models/student_model.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../common/button.dart';
import '../../../../utils/sizes.dart';
import '../../Create Student/widget/studentprofileschool.dart';
import '../widget/manageoptions.dart';

class ManageStudentProfileViewScreen extends StatelessWidget {
  final StudentModel model;
  const ManageStudentProfileViewScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: heightSize(230),
            width: widthSize(428),
            decoration: const BoxDecoration(
              color: maincolor,
            ),
            child: Stack(children: [
              Padding(
                padding: EdgeInsets.only(
                    top: heightSize(73),
                    right: widthSize(300),
                    left: widthSize(30)),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SizedBox(
                    height: heightSize(37.5),
                    width: widthSize(37.5),
                    child: Image.asset("assets/Teacher_Dash/backarrow.png"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: heightSize(70),
                    right: widthSize(104),
                    left: widthSize(130)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: heightSize(37),
                      backgroundImage: NetworkImage(model.image),
                    ),
                    SizedBox(height: heightSize(10)),
                    Text(
                      "${model.lastname} ${model.firstname}",
                      style: TextStyle(
                          fontSize: fontSize(20),
                          color: whitecolor,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: heightSize(10)),
                    Text(
                      "ID: ${model.id}",
                      style: TextStyle(
                          fontSize: fontSize(12),
                          color: whitecolor,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ]),
          ),
          SizedBox(height: heightSize(38)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthSize(10)),
            child: Text(
              "PERSONAL INFORMATION",
              style: TextStyle(
                  fontSize: fontSize(14), fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: heightSize(15)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthSize(10)),
            child: showPersonalInfo(model),
          ),
          SizedBox(height: heightSize(30)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
            child: Text(
              "SCHOOL INFORMATION",
              style: TextStyle(
                  fontSize: fontSize(14), fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: heightSize(15)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthSize(10)),
            child: showSchoolInfo(model),
          ),
          SizedBox(height: heightSize(30)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
            child: AppButtons(
                textColor: whitecolor,
                fontSize: fontSize(16),
                backgroundColor: const Color(0xFFEB5757),
                text: "Delete Profile",
                borderColor: const Color(0xFFEB5757),
                height: heightSize(63),
                onTap: () {
                  showAlertMessage(
                      context,
                      false,
                      heightSize(350),
                      widthSize(350),
                      "assets/Teacher_Dash/warningicon.png",
                      heightSize(145),
                      showManageStudentOPtions(context));
                }),
          ),
          SizedBox(height: heightSize(20)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
            child: AppButtons(
                textColor: maincolor,
                fontSize: fontSize(16),
                backgroundColor: whitecolor,
                text: "Edit profile details",
                borderColor: maincolor,
                height: heightSize(63),
                onTap: () {
                  // Get.to(() => EditManageStudentProfile(studentModel: model));
                }),
          ),
          SizedBox(height: heightSize(50))
        ]),
      ),
    );
  }
}
