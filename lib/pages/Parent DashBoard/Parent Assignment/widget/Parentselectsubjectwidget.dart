import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';

class ParentSelectSubjectWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color color2;
  final int number;
  const ParentSelectSubjectWidget(
      {super.key,
      required this.text,
      required this.color,
      required this.number,
      required this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize(83),
      width: widthSize(368),
      padding: EdgeInsets.only(
          top: heightSize(17),
          right: widthSize(12),
          left: widthSize(13),
          bottom: heightSize(17)),
      decoration: BoxDecoration(
          color: whitecolor,
          border: Border.all(color: const Color(0xFFDADADA)),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(
          Icons.book_rounded,
          color: color,
          size: heightSize(39),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: color,
                  fontSize: fontSize(16),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: heightSize(3)),
            Text(
              "Next class >> Thursday",
              style: TextStyle(
                  color: const Color(0xFF555555),
                  fontSize: fontSize(14),
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Container(
          height: heightSize(32),
          width: widthSize(78),
          decoration: BoxDecoration(
              color: color2,
              borderRadius: const BorderRadius.all(Radius.circular(3))),
          child: Center(
            child: Text(
              "$number pending",
              style: TextStyle(
                  color: color,
                  fontSize: fontSize(12),
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: color,
          size: heightSize(12),
        )
      ]),
    );
  }
}
