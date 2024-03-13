// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';

class OnboardPageView extends StatelessWidget {
  final String image;
  final String text1;
  final String text2;
  const OnboardPageView(
      {super.key,
      required this.image,
      required this.text1,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        children: [
          SizedBox(
            height: heightSize(470),
            width: widthSize(467),
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: heightSize(20)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
            child: SizedBox(
              height: heightSize(183),
              width: widthSize(368),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: maincolor,
                          fontSize: fontSize(32),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: heightSize(15)),
                    Text(
                      text2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: const Color(0xFF555555),
                          fontSize: fontSize(16),
                          fontWeight: FontWeight.w400),
                    ),
                  ]),
            ),
          )
        ],
      )
    ]);
  }
}
