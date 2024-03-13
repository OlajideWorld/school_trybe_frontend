import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/view/registration.dart';

import '../../../../routes/routes.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/SIgn-In Page/binding/registrationbinding.dart';

class ValidationSuccessScreen extends StatelessWidget {
  const ValidationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(300),
      width: widthSize(287),
      child: Column(children: [
        SizedBox(height: heightSize(10)),
        Text(
          "Success",
          style: TextStyle(
              color: Colors.green,
              fontSize: fontSize(20),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: heightSize(20)),
        Container(
          height: heightSize(124),
          width: widthSize(287),
          padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
          decoration: const BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Text(
              "You have successfully created your children profiles and these profiles has been added to your dashboard",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: fontSize(14),
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        SizedBox(height: heightSize(20)),
        GestureDetector(
          onTap: () => Get.to(
              () => RegistrationScreen(
                    type: "Parent",
                  ),
              binding: Registrationbinding()),
          child: Container(
            height: heightSize(63),
            width: widthSize(287),
            decoration: const BoxDecoration(
                color: maincolor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
                child: Text(
              "Proceed to parent registration",
              style: TextStyle(
                  color: whitecolor,
                  fontSize: fontSize(14),
                  fontWeight: FontWeight.w600),
            )),
          ),
        ),
      ]),
    );
  }
}
