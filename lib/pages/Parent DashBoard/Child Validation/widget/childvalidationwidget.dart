// ignore_for_file: must_be_immutable, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_management/common/custom-text.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';

import '../../../../models/student_model.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class ChidValidationScreenWidget extends StatelessWidget {
  final StudentModel model;
  final bool isSelected;
  final VoidCallback onTap;
  ChidValidationScreenWidget(
      {super.key,
      required this.model,
      required this.isSelected,
      required this.onTap});

  RegistrationController regController = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('d MMM y').format(model.dateOfBirth);
    return Container(
      height: heightSize(480),
      width: widthSize(368),
      padding: EdgeInsets.only(
          top: heightSize(30), left: widthSize(29), right: widthSize(48)),
      decoration: BoxDecoration(
        color: Color(0x11219653),
        border: Border.all(color: Color(0x11219653)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
            height: heightSize(93),
            width: widthSize(93),
            child: CircleAvatar(
              radius: widthSize(45),
              backgroundColor: whitecolor,
              child: CircleAvatar(
                radius: widthSize(40),
                backgroundImage: NetworkImage(model.image),
              ),
            )),
        SizedBox(height: heightSize(16)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              model.firstname,
              style: TextStyle(
                  fontSize: fontSize(14),
                  color: Color(0xFF555555),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(width: widthSize(130)),
            Text(
              model.lastname,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              model.guardianName,
              style: TextStyle(
                  fontSize: fontSize(14),
                  color: Color(0xFF555555),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(width: widthSize(85)),
            Text(
              formattedDate,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              model.gender,
              style: TextStyle(
                  fontSize: fontSize(14),
                  color: Color(0xFF555555),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              model.bloodGroup,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              model.phoneNumber,
              style: TextStyle(
                  fontSize: fontSize(14),
                  color: Color(0xFF555555),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(width: widthSize(105)),
            Expanded(
              child: Text(
                model.address,
                style: TextStyle(
                    color: Color(0xFF555555),
                    fontSize: fontSize(14),
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
        SizedBox(height: heightSize(20)),
        GestureDetector(
          onTap: onTap,
          child: isSelected
              ? Container(
                  alignment: Alignment.center,
                  width: widthSize(308),
                  height: heightSize(60),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0x19219653),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: SizedBox(
                      height: heightSize(30),
                      width: widthSize(70),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.verified_sharp,
                              color: const Color(0xFF219653),
                              size: heightSize(24)),
                          Padding(
                            padding: EdgeInsets.only(top: heightSize(5)),
                            child: const CText(
                              text: "Verified",
                              color: Color(0xFF219653),
                              size: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      )),
                )
              : Container(
                  height: heightSize(60),
                  width: widthSize(308),
                  decoration: const BoxDecoration(
                      color: Color(0xFF219653),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                      child: Text("Accept, this my child",
                          style: TextStyle(
                              color: whitecolor,
                              fontSize: fontSize(14),
                              fontWeight: FontWeight.w600))),
                ),
        )
      ]),
    );
  }
}
