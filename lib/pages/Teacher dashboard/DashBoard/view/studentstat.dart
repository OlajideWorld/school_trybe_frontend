import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';

class StudentStats extends StatelessWidget {
  const StudentStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          Container(
            height: heightSize(246),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: maincolor),
            child: Stack(children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    top: heightSize(73),
                    left: widthSize(30),
                  ),
                  child: SizedBox(
                    height: heightSize(37.5),
                    width: 37.5,
                    child: Image.asset("assets/Teacher_Dash/backarrow.png"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: heightSize(70),
                  left: widthSize(140),
                ),
                child: SizedBox(
                  height: heightSize(149),
                  width: widthSize(148),
                  child: Image.asset("assets/Teacher_Dash/studentinfo.png"),
                ),
              )
            ]),
          ),
          SizedBox(height: heightSize(38)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
            child: SizedBox(
              height: heightSize(401),
              width: widthSize(368),
              child: Image.asset("assets/Teacher_Dash/Student_calender.png"),
            ),
          ),
          SizedBox(height: heightSize(40)),
          Padding(
            padding: EdgeInsets.only(left: widthSize(0)),
            child: SizedBox(
              height: heightSize(224),
              width: widthSize(310),
              child: Image.asset("assets/Teacher_Dash/student_stat.png"),
            ),
          )
        ]),
      ),
    );
  }
}
