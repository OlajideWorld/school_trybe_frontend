// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../../utils/colors.dart';

class AnnouncementSuccess2 extends StatelessWidget {
  const AnnouncementSuccess2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSize(288),
      child: Column(children: [
        SizedBox(height: heightSize(10)),
        Text(
          "Success",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.green,
              fontSize: fontSize(20),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: heightSize(20)),
        Text(
          "Your announcement has been successfully deleted.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize(16), fontWeight: FontWeight.w400),
        ),
        SizedBox(height: heightSize(30)),
        AppButtons(
            textColor: whitecolor,
            fontSize: fontSize(14),
            backgroundColor: Colors.green,
            text: "Ok",
            borderColor: Colors.green,
            height: heightSize(63),
            onTap: () {})
      ]),
    );
  }
}
