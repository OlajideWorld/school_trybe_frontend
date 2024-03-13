import 'package:flutter/material.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

class AppButtons extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final double height;
  final double fontSize;
  final FontWeight? fontWeight;
  final Function()? onTap;

  const AppButtons(
      {Key? key,
      required this.textColor,
      this.fontWeight,
      required this.fontSize,
      required this.backgroundColor,
      required this.text,
      required this.borderColor,
      required this.height,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: fontSize,
                color: textColor,
                fontWeight: fontWeight ?? FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

backbutton() {
  return Container(
    height: heightSize(37.50),
    width: widthSize(37.50),
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(
        horizontal: widthSize(10), vertical: heightSize(2)),
    decoration: ShapeDecoration(
      color: Colors.white.withOpacity(0.20000000298023224),
      shape: const OvalBorder(),
    ),
    child: Padding(
      padding: EdgeInsets.only(left: widthSize(3)),
      child: Icon(
        Icons.arrow_back_ios,
        color: whitecolor,
        size: heightSize(20),
      ),
    ),
  );
}
