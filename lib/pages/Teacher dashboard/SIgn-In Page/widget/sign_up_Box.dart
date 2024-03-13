// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class SignupBox extends StatelessWidget {
  final String image;
  final String header;
  final String subtext;
  final double subtextSize;
  final VoidCallback onTap;
  const SignupBox(
      {super.key,
      required this.image,
      required this.header,
      required this.subtext,
      required this.onTap,
      required this.subtextSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: heightSize(89),
        padding: EdgeInsets.only(
            top: heightSize(16),
            left: widthSize(21),
            right: widthSize(14),
            bottom: heightSize(16)),
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: backgroundColor2),
            borderRadius: BorderRadius.circular(widthSize(10)),
            boxShadow: [
              BoxShadow(
                blurRadius: widthSize(10),
                color: const Color.fromRGBO(61, 64, 128, 0.2),
              )
            ]),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            height: heightSize(57),
            child: Row(children: [
              SizedBox(
                height: heightSize(57),
                width: widthSize(57),
                child: Image.asset(image),
              ),
              SizedBox(width: widthSize(10)),
              SizedBox(
                height: heightSize(subtextSize),
                width: widthSize(202),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      header,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: maincolor,
                          fontSize: fontSize(16),
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      subtext,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: textColor,
                          fontSize: fontSize(12),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )
            ]),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: maincolor,
            size: heightSize(11),
          )
        ]),
      ),
    );
  }
}
