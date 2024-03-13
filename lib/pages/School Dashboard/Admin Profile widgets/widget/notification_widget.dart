import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class AdminNotificationProfileWidget extends StatelessWidget {
  final String header;
  final ValueNotifier<bool> controller;
  const AdminNotificationProfileWidget(
      {super.key, required this.header, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(49),
      width: widthSize(336),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          height: heightSize(49),
          width: widthSize(205),
          child: Row(children: [
            SizedBox(
              height: heightSize(49),
              width: widthSize(49),
              child:
                  Image.asset('assets/Teacher_Dash/profile_notification.png'),
            ),
            SizedBox(width: widthSize(10)),
            Expanded(
              child: Text(
                header,
                style: TextStyle(
                    color: textColor,
                    fontSize: fontSize(16),
                    fontWeight: FontWeight.w600),
              ),
            )
          ]),
        ),
        AdvancedSwitch(
          controller: controller,
          activeColor: maincolor,
          width: widthSize(46),
          height: heightSize(21.41),
          borderRadius: BorderRadius.all(Radius.circular(widthSize(13.66))),
        )
      ]),
    );
  }
}
