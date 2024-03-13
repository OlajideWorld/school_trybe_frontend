import 'package:flutter/material.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class ProfileDetails extends StatelessWidget {
  ProfileDetails({super.key});

  final RegistrationController controller = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
      child: Container(
        height: heightSize(89),
        width: widthSize(368),
        padding: EdgeInsets.only(
            top: heightSize(15), left: widthSize(17), bottom: heightSize(14)),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        // decoration: BoxDecoration(
        //   color: whitecolor,
        //   borderRadius: BorderRadius.circular(widthSize(5)),
        //   // boxShadow: [
        //   //   BoxShadow(
        //   //       blurRadius: widthSize(10),
        //   //       color: Colors.transparent,
        //   //       offset: const Offset(4, 20)),
        //   //   BoxShadow(
        //   //     blurRadius: widthSize(10),
        //   //     color: const Color.fromRGBO(61, 64, 128, 0.2),
        //   //   )
        //   // ]
        // ),
        child: Row(children: [
          controller.schoolModel.value == {}
              ? SizedBox(
                  height: heightSize(60),
                  width: widthSize(60),
                  child: Image.asset("assets/Teacher_Dash/logo.png"))
              : Container(
                  width: widthSize(60),
                  height: heightSize(60),
                  decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage(controller.schoolModel.value.image),
                        fit: BoxFit.fill,
                      ),
                      shape: const OvalBorder()),
                ),
          SizedBox(width: widthSize(5)),
          Padding(
            padding: EdgeInsets.only(
              top: heightSize(8.3),
            ),
            child: SizedBox(
              height: heightSize(43),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.schoolModel.value.schoolName,
                    style: TextStyle(
                        color: maincolor,
                        fontSize: fontSize(16),
                        fontWeight: FontWeight.w700),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: heightSize(16),
                          width: widthSize(16),
                          child: Image.asset(
                              'assets/Teacher_Dash/addressIcon.png')),
                      Text(
                        controller.schoolModel.value.address,
                        style: TextStyle(
                            fontSize: fontSize(12),
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
