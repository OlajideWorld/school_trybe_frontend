import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:school_management/models/student_model.dart';

import '../../../../common/button.dart';
import '../../../../common/input_TextField.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/SIgn-In Page/widget/SelectionWidget.dart';
import '../../Create Student/widget/selectstudentsection.dart';

class EditManageStudentProfile extends StatelessWidget {
  final StudentModel studentModel;
  const EditManageStudentProfile({super.key, required this.studentModel});

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
              SizedBox(width: widthSize(74.5)),
              Text(
                'Edit profile',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: fontSize(20),
                    fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
              top: heightSize(25),
              right: widthSize(30),
              left: widthSize(30),
              bottom: heightSize(30)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "SCHOOL INFORMATION",
              style: TextStyle(
                  fontSize: fontSize(14),
                  fontWeight: FontWeight.w600,
                  color: maincolor),
            ),
            SizedBox(height: heightSize(36)),
            const StudentClassSelection(),
            SizedBox(height: heightSize(20)),
            const SelectYourclassSelection(),
            SizedBox(height: heightSize(20)),
            const SelectDayBoarding(),
            SizedBox(height: heightSize(20)),
            Text(
              "Class Teacher",
              style: TextStyle(
                  fontSize: fontSize(14), fontWeight: FontWeight.w600),
            ),
            SizedBox(height: heightSize(15)),
            SizedBox(
              height: heightSize(63),
              child: const InputTextField(
                obscureText: false,
                hintText: "Mrs. Helen Thomas",
              ),
            ),
            SizedBox(height: heightSize(40)),
            AppButtons(
                textColor: whitecolor,
                fontSize: fontSize(14),
                backgroundColor: maincolor,
                text: "Continue",
                borderColor: maincolor,
                height: heightSize(60),
                onTap: () {})
          ]),
        ),
      ),
    );
  }
}
