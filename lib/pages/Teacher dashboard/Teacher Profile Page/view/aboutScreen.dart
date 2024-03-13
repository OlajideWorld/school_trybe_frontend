// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class TeacherAboutScreen extends StatelessWidget {
  const TeacherAboutScreen({super.key});

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
              SizedBox(width: widthSize(116.5)),
              Text(
                'About',
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
            top: heightSize(38), left: widthSize(30), right: widthSize(30)),
        child: Column(children: [
          Container(
            height: heightSize(570),
            width: widthSize(368),
            padding: EdgeInsets.symmetric(
                horizontal: widthSize(30), vertical: heightSize(32)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widthSize(10)),
                color: whitecolor,
                boxShadow: [
                  BoxShadow(
                      blurRadius: widthSize(20),
                      color: const Color.fromRGBO(61, 64, 128, 0.2),
                      offset: const Offset(0, 4))
                ]),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: heightSize(84),
                    width: widthSize(84),
                    child: Image.asset("assets/Teacher_Dash/aboutpage.png"),
                  ),
                  SizedBox(height: heightSize(10)),
                  Expanded(
                    child: SizedBox(
                      height: heightSize(230),
                      child: Text(
                        "Welcome to our Teacher-School-Parents app! Our mission is to facilitate communication and collaboration between teachers, schools, and parents to support student success. With our app, you can easily stay up-to-date on your child's academic progress, communicate with their teachers, and receive important school announcements.",
                        style: TextStyle(
                            color: textColor,
                            fontSize: fontSize(16),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(height: heightSize(10)),
                  Expanded(
                    child: SizedBox(
                      height: heightSize(161),
                      child: Text(
                        "We are committed to providing a user-friendly platform that promotes transparency and fosters a sense of community between all stakeholders involved in a child's education. Thank you for choosing our app to support your child's learning journey!",
                        style: TextStyle(
                            color: textColor,
                            fontSize: fontSize(16),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ]),
          )
        ]),
      ),
    );
  }
}
