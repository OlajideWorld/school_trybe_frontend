import 'package:flutter/material.dart';
import 'package:school_management/utils/sizes.dart';

class SortedImages extends StatelessWidget {
  const SortedImages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(181),
      child: Image.asset("assets/Teacher_Dash/imagepupil.png"),
    );
  }
}
