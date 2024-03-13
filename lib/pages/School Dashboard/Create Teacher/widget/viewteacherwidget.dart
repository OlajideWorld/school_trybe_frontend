import 'package:flutter/material.dart';
import 'package:school_management/models/teacher_model.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

class ViewTeacherProfileWidget extends StatelessWidget {
  final TeacherModel teacherModel;
  const ViewTeacherProfileWidget({super.key, required this.teacherModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize(380),
      width: widthSize(368),
      padding: const EdgeInsets.all(20),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(0x0C3D4080),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "First Name",
              style: TextStyle(
                color: Color(0xFF555555),
                fontSize: fontSize(12),
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "Gender",
              style: TextStyle(
                color: Color(0xFF555555),
                fontSize: fontSize(12),
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: heightSize(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              teacherModel.firstname,
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: fontSize(14),
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              teacherModel.gender,
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: fontSize(14),
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),

        //
        SizedBox(height: heightSize(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Last Name",
              style: TextStyle(
                color: Color(0xFF555555),
                fontSize: fontSize(12),
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            Text("Marital Status",
                style: TextStyle(
                  color: Color(0xFF555555),
                  fontSize: fontSize(12),
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w400,
                ))
          ],
        ),
        SizedBox(height: heightSize(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              teacherModel.lastName,
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: fontSize(14),
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600),
            ),
            Text(
              teacherModel.maritalStatus,
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: fontSize(14),
                  fontFamily: 'Open Sans',
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
              "Email Address",
              style: TextStyle(
                color: Color(0xFF555555),
                fontSize: fontSize(12),
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "NIN",
              style: TextStyle(
                color: Color(0xFF555555),
                fontSize: fontSize(12),
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        SizedBox(height: heightSize(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              teacherModel.email,
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: fontSize(14),
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600),
            ),
            Text(
              teacherModel.nin.toString(),
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: fontSize(14),
                  fontFamily: 'Open Sans',
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
              "Phone Number",
              style: TextStyle(
                color: Color(0xFF555555),
                fontSize: fontSize(12),
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: widthSize(64)),
            Text(
              "State of Origin",
              style: TextStyle(
                color: Color(0xFF555555),
                fontSize: fontSize(12),
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        SizedBox(height: heightSize(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              teacherModel.phoneNumber,
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: fontSize(14),
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600),
            ),
            Text(
              teacherModel.stateOfOrigin,
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: fontSize(14),
                  fontFamily: 'Open Sans',
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
              "Residential Adress",
              style: TextStyle(
                color: Color(0xFF555555),
                fontSize: fontSize(12),
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: widthSize(64)),
            Text(
              "Nationality",
              style: TextStyle(
                color: Color(0xFF555555),
                fontSize: fontSize(12),
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        SizedBox(height: heightSize(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              teacherModel.address,
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: fontSize(14),
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600),
            ),
            Text(
              teacherModel.nationality,
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: fontSize(14),
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ]),
    );
  }
}
