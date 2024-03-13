import 'package:flutter/material.dart';

import '../../../../models/teacher_model.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class ViewTeacherProfileWidget2 extends StatelessWidget {
  final TeacherModel teacherModel;
  const ViewTeacherProfileWidget2({super.key, required this.teacherModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize(140),
      width: widthSize(368),
      padding: const EdgeInsets.all(20),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(0x113D4080),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Name of School",
              style: TextStyle(
                color: Color(0xFF555555),
                fontSize: fontSize(12),
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: widthSize(64)),
            Text(
              "Subject assigned",
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
              teacherModel.schoolName,
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: fontSize(14),
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600),
            ),
            Text(
              teacherModel.subjectRole,
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
              "Class Assigned",
              style: TextStyle(
                color: Color(0xFF555555),
                fontSize: fontSize(12),
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: widthSize(64)),
            Text(
              "Section",
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
              teacherModel.className,
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: fontSize(14),
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600),
            ),
            Text(
              teacherModel.classSection,
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
