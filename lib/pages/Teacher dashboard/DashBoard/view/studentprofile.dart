import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/DashBoard/view/studentbooks.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: heightSize(251),
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
                      left: widthSize(140)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: heightSize(37),
                        backgroundImage: const AssetImage(
                            "assets/Parents_Dash/michealNelson2.png"),
                      ),
                      SizedBox(height: heightSize(10)),
                      Text(
                        "Micheal Nelson",
                        style: TextStyle(
                            fontSize: fontSize(20),
                            color: whitecolor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: heightSize(10)),
                      Text(
                        "ID: 2356FG",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            color: whitecolor,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )
              ]),
            ),
            SizedBox(height: heightSize(48)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
              child: Text(
                "PERSONAL INFORMATION",
                style: TextStyle(
                    color: const Color(0xFF707070),
                    fontSize: fontSize(14),
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: heightSize(15)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
              child: Container(
                height: heightSize(300),
                width: widthSize(368),
                padding: EdgeInsets.only(
                    top: heightSize(30),
                    left: widthSize(29),
                    right: widthSize(48)),
                decoration: BoxDecoration(
                    border: Border.all(color: backgroundColor2),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Column(children: [
                  Row(
                    children: [
                      Text(
                        "First Name",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            color: maincolor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: widthSize(116)),
                      Text(
                        "Last Name",
                        style: TextStyle(
                            color: maincolor,
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(height: heightSize(10)),
                  Row(
                    children: [
                      Text(
                        "Micheal",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            color: Color(0xFF555555),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: widthSize(130)),
                      Text(
                        "Nelson",
                        style: TextStyle(
                            color: Color(0xFF555555),
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),

                  //
                  SizedBox(height: heightSize(20)),
                  Row(
                    children: [
                      Text(
                        "Guardian Full-Name",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            color: maincolor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: widthSize(70)),
                      Text(
                        "Date of Birth",
                        style: TextStyle(
                            color: maincolor,
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(height: heightSize(10)),
                  Row(
                    children: [
                      Text(
                        "Mr Gideon Bobby",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            color: Color(0xFF555555),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: widthSize(85)),
                      Text(
                        "25/07/1998",
                        style: TextStyle(
                            color: Color(0xFF555555),
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),

                  //
                  SizedBox(height: heightSize(20)),
                  Row(
                    children: [
                      Text(
                        "Gender",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            color: maincolor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: widthSize(135)),
                      Text(
                        "Blood Group",
                        style: TextStyle(
                            color: maincolor,
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(height: heightSize(10)),
                  Row(
                    children: [
                      Text(
                        "Male",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            color: Color(0xFF555555),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: widthSize(150)),
                      Expanded(
                        child: Text(
                          "A+",
                          style: TextStyle(
                              color: Color(0xFF555555),
                              fontSize: fontSize(14),
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),

                  //
                  SizedBox(height: heightSize(20)),
                  Row(
                    children: [
                      Text(
                        "Phone Numnber",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            color: maincolor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: widthSize(90)),
                      Text(
                        "Home Address",
                        style: TextStyle(
                            color: maincolor,
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(height: heightSize(10)),
                  Row(
                    children: [
                      Text(
                        "08061332918",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            color: Color(0xFF555555),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: widthSize(105)),
                      Expanded(
                        child: Text(
                          "Idi-Aba Kemta Housing Estate",
                          style: TextStyle(
                              color: Color(0xFF555555),
                              fontSize: fontSize(14),
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: heightSize(20)),
                ]),
              ),
            ),
            SizedBox(height: heightSize(30)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
              child: Text(
                "SCHOOL INFORMATION",
                style: TextStyle(
                    color: const Color(0xFF707070),
                    fontSize: fontSize(14),
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: heightSize(15)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
              child: Container(
                height: heightSize(311),
                width: widthSize(368),
                padding: EdgeInsets.only(
                    top: heightSize(30),
                    left: widthSize(29),
                    right: widthSize(48)),
                decoration: BoxDecoration(
                    border: Border.all(color: backgroundColor2),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "School Name",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            color: maincolor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: heightSize(10)),
                      Text(
                        "Abeokuta Grammar School",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            color: Color(0xFF555555),
                            fontWeight: FontWeight.w600),
                      ),

                      //
                      SizedBox(height: heightSize(20)),
                      Text(
                        "Class / Section",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            color: maincolor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: heightSize(10)),
                      Text(
                        "JSS One / D",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            color: Color(0xFF555555),
                            fontWeight: FontWeight.w600),
                      ),

                      //
                      SizedBox(height: heightSize(20)),
                      Text(
                        "Day / Boarding Scholar",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            color: maincolor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: heightSize(10)),
                      Text(
                        "Day scholar",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            color: Color(0xFF555555),
                            fontWeight: FontWeight.w600),
                      ),

                      //
                      SizedBox(height: heightSize(20)),

                      Text(
                        "Class Teacher",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            color: maincolor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: heightSize(10)),
                      Text(
                        "Mrs. Helen Thomas",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            color: Color(0xFF555555),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: heightSize(20)),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
