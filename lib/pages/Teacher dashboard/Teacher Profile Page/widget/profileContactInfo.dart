// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class TeacherProfileContactInfo extends StatelessWidget {
  final String image;
  final String header;
  final Color color;
  final String subheader;
  const TeacherProfileContactInfo(
      {super.key,
      required this.image,
      required this.header,
      required this.subheader,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(69),
      width: widthSize(336),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          height: heightSize(49),
          child: Row(children: [
            SizedBox(
              height: heightSize(49),
              width: widthSize(49),
              child: Image.asset(image),
            ),
            SizedBox(width: widthSize(10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  header,
                  style: TextStyle(
                      color: color,
                      fontSize: fontSize(16),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: heightSize(5)),
                Text(
                  subheader,
                  style: TextStyle(
                      color: textcolor6,
                      fontSize: fontSize(14),
                      fontWeight: FontWeight.w600),
                )
              ],
            )
          ]),
        ),
        Icon(
          Icons.arrow_forward_ios_rounded,
          color: textcolor4,
          size: heightSize(15),
        )
      ]),
    );
  }
}
