// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../../common/input_TextField.dart';
import '../../../../utils/colors.dart';

class TeacherAccountNameFields extends StatelessWidget {
  final String header;
  final String hinttext;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  const TeacherAccountNameFields(
      {super.key,
      required this.header,
      required this.hinttext,
      required this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(94),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              header,
              style: TextStyle(
                  color: textColor,
                  fontSize: fontSize(14),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: heightSize(73),
              child: InputTextField(
                obscureText: false,
                textInputAction: true,
                hintText: hinttext,
                controller: controller,
                validator: validator,
              ),
            )
          ]),
    );
  }
}
