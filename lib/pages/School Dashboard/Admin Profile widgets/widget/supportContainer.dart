// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class AdminHelpAndSupportWidget extends StatelessWidget {
  final String image;
  final String text;
  const AdminHelpAndSupportWidget(
      {super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize(89),
      width: widthSize(368),
      padding: EdgeInsets.only(
          top: heightSize(22),
          left: widthSize(20),
          right: widthSize(12),
          bottom: heightSize(22)),
      decoration: BoxDecoration(
          border: Border.all(color: colors1),
          borderRadius: BorderRadius.circular(widthSize(10))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          height: heightSize(45),
          width: widthSize(258),
          child: Row(children: [
            SizedBox(
              height: heightSize(45),
              width: widthSize(45),
              child: Image.asset(image),
            ),
            SizedBox(width: widthSize(10)),
            Expanded(
                child: Text(
              text,
              style: TextStyle(
                  fontSize: fontSize(16), fontWeight: FontWeight.w600),
            ))
          ]),
        ),
        Icon(
          Icons.arrow_forward_ios_rounded,
          color: textColor,
          size: heightSize(17),
        )
      ]),
    );
  }
}
