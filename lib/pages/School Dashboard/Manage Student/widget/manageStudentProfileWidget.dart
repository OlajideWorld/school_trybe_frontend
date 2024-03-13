import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/models/student_model.dart';
import 'package:school_management/pages/School%20Dashboard/manage_results/view/admin_select_term.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../view/manageStudentProfileView.dart';

manageStudentProfileWidgetView(StudentModel studentModel, VoidCallback ontap) {
  return Container(
    width: widthSize(170),
    height: heightSize(181),
    decoration: BoxDecoration(
        color: whitecolor,
        border: Border.all(color: backgroundColor2),
        borderRadius: const BorderRadius.all(Radius.circular(10))),
    child: Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(right: widthSize(20), left: widthSize(125)),
          child: PopupMenuButton(
              color: whitecolor,
              icon: const Icon(
                Icons.more_vert,
                color: Color(0xFFD8D8D8),
              ),
              onSelected: (value) {
                if (value == 2) {}
                if (value == 1) {}
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                        value: 1,
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                              fontSize: fontSize(16),
                              fontWeight: FontWeight.w600),
                        )),
                    PopupMenuItem(
                        value: 2,
                        child: Text(
                          "Delete Profile",
                          style: TextStyle(
                              fontSize: fontSize(16),
                              fontWeight: FontWeight.w600),
                        )),
                  ]),
        ),
        GestureDetector(
          onTap: ontap,
          child: Padding(
            padding: EdgeInsets.only(top: heightSize(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: widthSize(10)),
                    child: Container(
                      width: widthSize(60.14),
                      height: heightSize(60.14),
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: NetworkImage(studentModel.image),
                          fit: BoxFit.fill,
                        ),
                        shape: const OvalBorder(),
                      ),
                    )),
                SizedBox(height: heightSize(10)),
                Padding(
                  padding: EdgeInsets.only(left: widthSize(10)),
                  child: SizedBox(
                    width: widthSize(138),
                    child: Text(
                      "${studentModel.firstname} ${studentModel.lastname}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: fontSize(14), fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

manageStudentResultsView(StudentModel studentModel, VoidCallback ontap) {
  return Container(
    width: widthSize(170),
    height: heightSize(181),
    decoration: BoxDecoration(
        color: whitecolor,
        border: Border.all(color: backgroundColor2),
        borderRadius: const BorderRadius.all(Radius.circular(10))),
    child: Stack(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Padding(
            padding: EdgeInsets.only(top: heightSize(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: widthSize(10)),
                    child: Container(
                      height: heightSize(79),
                      width: widthSize(79),
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(
                          side:
                              BorderSide(width: 1.90, color: Color(0xFFF2994A)),
                        ),
                      ),
                      child: Container(
                        width: widthSize(70.14),
                        height: heightSize(70.14),
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(studentModel.image),
                            fit: BoxFit.fill,
                          ),
                          shape: const OvalBorder(),
                        ),
                      ),
                    )),
                SizedBox(height: heightSize(10)),
                Padding(
                  padding: EdgeInsets.only(left: widthSize(10)),
                  child: SizedBox(
                    width: widthSize(138),
                    child: Text(
                      "${studentModel.firstname} ${studentModel.lastname}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: fontSize(14), fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
