// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class AdminProfileSuccess extends StatelessWidget {
  const AdminProfileSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSize(312),
      child: Column(children: [
        SizedBox(height: heightSize(20)),
        Text(
          "Account Deactivated",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: maincolor,
              fontSize: fontSize(26.44),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: heightSize(20)),
        Text(
          "You have successfully deactivated your account",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize(16), fontWeight: FontWeight.w400),
        )
      ]),
    );
  }
}
