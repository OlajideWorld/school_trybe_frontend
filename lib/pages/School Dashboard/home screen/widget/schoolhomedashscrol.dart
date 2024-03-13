import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_management/pages/School%20Dashboard/Create%20Student/widget/studentprofileschool.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../controller/adminController.dart';

class SchoolHomeDashScroll extends StatelessWidget {
  final String numberOfStudent;
  final Color color;
  SchoolHomeDashScroll(
      {super.key, required this.color, required this.numberOfStudent});

  final AdminController controller = AdminController.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize(189),
      width: widthSize(343),
      padding: EdgeInsets.only(
          top: heightSize(52),
          right: widthSize(17),
          left: widthSize(20),
          bottom: heightSize(52)),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: color),
        borderRadius: BorderRadius.all(
          Radius.circular(widthSize(20)),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: heightSize(55),
              width: widthSize(55),
              decoration: const BoxDecoration(
                  color: whitecolor, shape: BoxShape.circle),
              child: Center(
                  child: SvgPicture.asset(
                      "assets/School_Dash/schoolhomeicon2.svg")),
            ),
            Text(
              "No of students",
              style: TextStyle(
                  color: whitecolor,
                  fontSize: fontSize(18),
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
        Text(
          numberOfStudent,
          style: TextStyle(
              fontSize: fontSize(40),
              fontWeight: FontWeight.w700,
              color: whitecolor),
        )
      ]),
    );
  }
}
