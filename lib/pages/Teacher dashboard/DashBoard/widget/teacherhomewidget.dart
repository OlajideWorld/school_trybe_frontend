import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../../models/student_model.dart';
import '../view/sortstudents.dart';

teachershowStudentwidget(StudentModel studentModel) {
  return GestureDetector(
    onTap: () => Get.to(() => const SortStudent()),
    child: Container(
      height: heightSize(198),
      width: widthSize(174),
      decoration: BoxDecoration(
          border: Border.all(color: backgroundColor2),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Stack(children: [
        Padding(
          padding: EdgeInsets.only(
              top: heightSize(25),
              left: widthSize(10),
              right: widthSize(11),
              bottom: heightSize(22)),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: widthSize(15)),
                  child: CircleAvatar(
                    backgroundColor: whitecolor,
                    radius: heightSize(38),
                    child: CircleAvatar(
                      radius: heightSize(32),
                      backgroundImage: NetworkImage(studentModel.image),
                    ),
                  )),
              SizedBox(height: heightSize(7)),
              Text(
                "${studentModel.firstname} ${studentModel.lastname}",
                style: TextStyle(
                    fontSize: fontSize(16), fontWeight: FontWeight.w600),
              ),
              SizedBox(height: heightSize(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: heightSize(31),
                      width: widthSize(31),
                      child: SvgPicture.asset(
                          "assets/Teacher_Dash/teacherhomeicon.svg")),
                  Text(
                    studentModel.studentType,
                    style: TextStyle(
                        fontSize: fontSize(14), fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: heightSize(10),
              left: widthSize(130),
              right: widthSize(15),
              bottom: heightSize(210)),
          child: PopupMenuButton(
              color: const Color(0xFF555555),
              shadowColor: whitecolor,
              itemBuilder: (context) => [
                    PopupMenuItem(
                        child: Text(
                      "Profile",
                      style: TextStyle(
                          color: const Color(0xFFEEEEEE),
                          fontSize: fontSize(16),
                          fontWeight: FontWeight.w600),
                    )),
                    PopupMenuItem(
                        child: Text(
                      "See results",
                      style: TextStyle(
                          color: const Color(0xFFEEEEEE),
                          fontSize: fontSize(16),
                          fontWeight: FontWeight.w600),
                    )),
                  ]),
        )
      ]),
    ),
  );
}

showStudentProfileHome() {
  return Container(
    height: heightSize(181),
    width: widthSize(170),
    decoration: BoxDecoration(
        border: Border.all(color: backgroundColor2),
        borderRadius: const BorderRadius.all(Radius.circular(10))),
    child: Stack(children: [
      Padding(
        padding: EdgeInsets.only(
            top: heightSize(25),
            left: widthSize(10),
            right: widthSize(11),
            bottom: heightSize(22)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(left: widthSize(15)),
                child: CircleAvatar(
                  backgroundColor: whitecolor,
                  radius: heightSize(38),
                  child: CircleAvatar(
                    radius: heightSize(32),
                    backgroundImage: const AssetImage(
                        "assets/Parents_Dash/michealNelson.png"),
                  ),
                )),
            SizedBox(height: heightSize(7)),
            SizedBox(
              height: heightSize(42),
              width: widthSize(138),
              child: Text(
                "Michael Nelson Adesanmi",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: fontSize(16), fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
            top: heightSize(10),
            left: widthSize(130),
            right: widthSize(15),
            bottom: heightSize(210)),
        child: PopupMenuButton(
            color: const Color(0xFF555555),
            shadowColor: whitecolor,
            itemBuilder: (context) => [
                  PopupMenuItem(
                      child: Text(
                    "Profile",
                    style: TextStyle(
                        color: const Color(0xFFEEEEEE),
                        fontSize: fontSize(16),
                        fontWeight: FontWeight.w600),
                  )),
                  PopupMenuItem(
                      child: Text(
                    "See results",
                    style: TextStyle(
                        color: const Color(0xFFEEEEEE),
                        fontSize: fontSize(16),
                        fontWeight: FontWeight.w600),
                  )),
                ]),
      )
    ]),
  );
}

showStudentListTerm() {
  return Container(
    height: heightSize(169),
    width: widthSize(170),
    decoration: BoxDecoration(
        border: Border.all(color: backgroundColor2),
        borderRadius: const BorderRadius.all(Radius.circular(10))),
    child: Padding(
      padding: EdgeInsets.only(
        top: heightSize(26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: heightSize(81),
              width: widthSize(81),
              child: Image.asset("assets/Parents_Dash/michealNelson.png")),
          SizedBox(height: heightSize(15)),
          SizedBox(
            height: heightSize(42),
            width: widthSize(138),
            child: Text(
              "Agboola David",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: fontSize(16), fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    ),
  );
}
