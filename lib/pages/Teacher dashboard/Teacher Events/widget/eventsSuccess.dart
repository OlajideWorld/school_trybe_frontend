// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class EventsSucesss extends StatelessWidget {
  final String text;
  final String text2;
  const EventsSucesss({super.key, required this.text, required this.text2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSize(312),
      child: Column(children: [
        SizedBox(height: heightSize(20)),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: fontSize(26.4),
              fontWeight: FontWeight.w600,
              color: maincolor),
        ),
        SizedBox(height: heightSize(20)),
        Text(
          text2,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize(16), fontWeight: FontWeight.w400),
        )
      ]),
    );
  }
}
