import 'package:flutter/material.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../../utils/colors.dart';

class AnnounceSuccess extends StatelessWidget {
  const AnnounceSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSize(312),
      child: Column(children: [
        SizedBox(height: heightSize(20)),
        Text(
          "Announcement successfully created",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: maincolor,
              fontSize: fontSize(26.44),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: heightSize(20)),
        Text(
          "Congratulations! Your announcement has been successfully created.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize(16), fontWeight: FontWeight.w400),
        )
      ]),
    );
  }
}
