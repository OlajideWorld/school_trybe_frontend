import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';
import '../../Manage Student/view/manageStudentmainScreen.dart';
import 'inputstudentfields.dart';

class CreateStudentScreen extends StatelessWidget {
  const CreateStudentScreen({super.key});

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
              SizedBox(width: widthSize(77.5)),
              Text(
                'Manage students',
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
        padding: EdgeInsets.only(
            top: heightSize(36), right: widthSize(30), left: widthSize(30)),
        child: Column(children: [
          GestureDetector(
            onTap: () => Get.to(() => InputStudentFIeldsInfo(
                  type: "Create student",
                )),
            child: Container(
              height: heightSize(90),
              width: widthSize(368),
              padding: EdgeInsets.only(
                  top: heightSize(17),
                  left: widthSize(31),
                  right: widthSize(30.8),
                  bottom: heightSize(15)),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: widthSize(10),
                      color: const Color.fromRGBO(61, 64, 128, 0.2),
                    )
                  ],
                  color: whitecolor,
                  border: Border.all(color: backgroundColor2),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Row(children: [
                SizedBox(
                  height: heightSize(57),
                  width: widthSize(57),
                  child:
                      SvgPicture.asset("assets/School_Dash/createTeacher.svg"),
                ),
                SizedBox(width: widthSize(7)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create a new student",
                      style: TextStyle(
                          color: maincolor,
                          fontSize: fontSize(16),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: heightSize(5)),
                    Text(
                      "Select to create a new student",
                      style: TextStyle(
                          color: maincolor,
                          fontSize: fontSize(14),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: heightSize(15),
                  color: maincolor,
                )
              ]),
            ),
          ),
          SizedBox(height: heightSize(20)),

          // 2nd Box
          GestureDetector(
            onTap: () => Get.to(() => ManageStudentSelectScreen()),
            child: Container(
              height: heightSize(90),
              width: widthSize(368),
              padding: EdgeInsets.only(
                  top: heightSize(17),
                  left: widthSize(31),
                  right: widthSize(30.8),
                  bottom: heightSize(15)),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: widthSize(10),
                      color: const Color.fromRGBO(61, 64, 128, 0.2),
                    )
                  ],
                  color: whitecolor,
                  border: Border.all(color: backgroundColor2),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Row(children: [
                SizedBox(
                  height: heightSize(57),
                  width: widthSize(57),
                  child:
                      SvgPicture.asset("assets/School_Dash/createTeacher.svg"),
                ),
                SizedBox(width: widthSize(7)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Manage students",
                      style: TextStyle(
                          color: maincolor,
                          fontSize: fontSize(16),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: heightSize(5)),
                    Text(
                      "Select to manage student profile",
                      style: TextStyle(
                          color: maincolor,
                          fontSize: fontSize(14),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: heightSize(15),
                  color: maincolor,
                )
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
