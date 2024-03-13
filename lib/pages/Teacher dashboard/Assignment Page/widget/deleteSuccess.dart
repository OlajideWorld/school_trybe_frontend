// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:school_management/utils/sizes.dart';

class DeleteSuccess extends StatelessWidget {
  const DeleteSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSize(368),
      child: Column(children: [
        SizedBox(height: heightSize(7)),
        SizedBox(
          height: heightSize(80),
          width: widthSize(253),
          child: Text(
            "Assignment Deleted",
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: fontSize(30), fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(height: heightSize(20)),
        Text(
          "Your have successfully deleted this assignment",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize(16), fontWeight: FontWeight.w400),
        ),
      ]),
    );
  }
}
