import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';
import '../../AuthPage/controller/authcontroller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = AuthController.instance;

  @override
  void initState() {
    super.initState();
    changeColor();
  }

  changeColor() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    setState(() {
      controller.changeColor.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          controller.changeColor.value == true ? whitecolor : maincolor,
      body: Center(
          child: SizedBox(
        height: heightSize(57),
        width: widthSize(89),
        child: controller.changeColor.value == true
            ? SvgPicture.asset("assets/Teacher_Dash/intrologo2.svg")
            : SvgPicture.asset("assets/Teacher_Dash/intrologo1.svg"),
      )),
    );
  }
}
