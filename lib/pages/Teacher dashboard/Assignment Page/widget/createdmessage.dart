import 'package:flutter/material.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

class CreatedMessage extends StatelessWidget {
  const CreatedMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSize(308),
      child: Column(children: [
        SizedBox(height: heightSize(25)),
        Text(
          "Assignment Posted",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: maincolor,
              fontSize: fontSize(30),
              fontWeight: FontWeight.w700),
        ),
        SizedBox(height: heightSize(20)),
        Text(
          "Your have successfully posted an assignment",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize(16), fontWeight: FontWeight.w400),
        )
      ]),
    );
  }
}
