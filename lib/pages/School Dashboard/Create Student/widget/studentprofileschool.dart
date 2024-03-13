import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_management/models/student_model.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

final RegistrationController controller = RegistrationController.instance;
Widget showSchoolInfo(StudentModel studentModel) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
    child: Container(
      height: heightSize(311),
      width: widthSize(368),
      padding: EdgeInsets.only(
          top: heightSize(30), left: widthSize(29), right: widthSize(48)),
      decoration: BoxDecoration(
          border: Border.all(color: backgroundColor2),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "School Name",
          style: TextStyle(
              fontSize: fontSize(14),
              color: maincolor,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: heightSize(10)),
        Text(
          controller.schoolModel.value.schoolName,
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
          "${studentModel.classAssigned} / ${studentModel.classSection}",
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
          studentModel.studentType,
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
  );
}

Widget showPersonalInfo(StudentModel studentModel) {
  String formattedDate = DateFormat('d MMM y').format(studentModel.dateOfBirth);
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
    child: Container(
      height: heightSize(300),
      width: widthSize(368),
      padding: EdgeInsets.only(
          top: heightSize(30), left: widthSize(29), right: widthSize(48)),
      decoration: BoxDecoration(
          border: Border.all(color: backgroundColor2),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: widthSize(136),
              height: heightSize(48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "First Name",
                    style: TextStyle(
                        fontSize: fontSize(14),
                        color: maincolor,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    studentModel.firstname,
                    style: TextStyle(
                        fontSize: fontSize(14),
                        color: Color(0xFF555555),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: heightSize(48),
              width: widthSize(112),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Last Name",
                    style: TextStyle(
                        color: maincolor,
                        fontSize: fontSize(14),
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    studentModel.lastname,
                    style: TextStyle(
                        color: Color(0xFF555555),
                        fontSize: fontSize(14),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            )
          ],
        ),

        //
        SizedBox(height: heightSize(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: widthSize(136),
              height: heightSize(48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Guardian Full-Name",
                    style: TextStyle(
                        fontSize: fontSize(14),
                        color: maincolor,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    studentModel.guardianName,
                    style: TextStyle(
                        fontSize: fontSize(14),
                        color: Color(0xFF555555),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: widthSize(112),
              height: heightSize(48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date of Birth",
                    style: TextStyle(
                        color: maincolor,
                        fontSize: fontSize(14),
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(
                        color: Color(0xFF555555),
                        fontSize: fontSize(14),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            )
          ],
        ),

        //
        SizedBox(height: heightSize(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: widthSize(136),
              height: heightSize(48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Gender",
                    style: TextStyle(
                        fontSize: fontSize(14),
                        color: maincolor,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    studentModel.gender,
                    style: TextStyle(
                        fontSize: fontSize(14),
                        color: Color(0xFF555555),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: widthSize(112),
              height: heightSize(48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Blood Group",
                    style: TextStyle(
                        color: maincolor,
                        fontSize: fontSize(14),
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    studentModel.bloodGroup,
                    style: TextStyle(
                        color: Color(0xFF555555),
                        fontSize: fontSize(14),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            )
          ],
        ),

        //
        SizedBox(height: heightSize(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: widthSize(136),
              height: heightSize(48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Phone Numnber",
                    style: TextStyle(
                        fontSize: fontSize(14),
                        color: maincolor,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    studentModel.phoneNumber,
                    style: TextStyle(
                        fontSize: fontSize(14),
                        color: Color(0xFF555555),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: widthSize(112),
              height: heightSize(48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Home Address",
                    style: TextStyle(
                        color: maincolor,
                        fontSize: fontSize(14),
                        fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                    child: Text(
                      studentModel.address,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Color(0xFF555555),
                          fontSize: fontSize(14),
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ]),
    ),
  );
}
