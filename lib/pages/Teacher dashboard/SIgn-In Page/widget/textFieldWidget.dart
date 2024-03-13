// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../../common/input_TextField.dart';
import '../../../../utils/sizes.dart';

class TextFieldWidgetRegister extends StatelessWidget {
  final String label;
  final String hinttext;
  final bool obscure;
  final bool password;
  final TextInputType? keyboardtype;
  final String? Function(String?)? validator;

  final TextEditingController controller;
  const TextFieldWidgetRegister(
      {super.key,
      required this.label,
      required this.hinttext,
      required this.controller,
      this.validator,
      required this.obscure,
      required this.password,
      this.keyboardtype});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(94),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: TextStyle(
                    fontSize: fontSize(14), fontWeight: FontWeight.w600)),
            SizedBox(height: heightSize(10)),
            Expanded(
              child: InputTextField(
                validator: validator,
                obscureText: obscure,
                keyboardType: keyboardtype,
                hintText: hinttext,
                controller: controller,
                password: password,
                textInputAction: true,
              ),
            )
          ]),
    );
  }
}
