import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';

import '../../../../common/button.dart';
import '../../../../common/input_TextField.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/Teacher Profile Page/widget/profileContactInfo.dart';
import '../../Admin Profile widgets/widget/profileContactInfo.dart';

class SchoolAdminProfileWdiget extends StatelessWidget {
  SchoolAdminProfileWdiget({super.key});

  final RegistrationController controller = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    var user = controller.userCredentials.value;
    return SizedBox(
      height: heightSize(249),
      width: widthSize(368),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "SCHOOL INFORMATION",
          style: TextStyle(
              color: textcolor5,
              fontSize: fontSize(14),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: heightSize(15)),
        Container(
          height: heightSize(216),
          width: widthSize(368),
          padding: EdgeInsets.only(
              top: heightSize(28), left: widthSize(20), right: widthSize(11)),
          decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.circular(widthSize(10)),
              boxShadow: [
                BoxShadow(
                    blurRadius: widthSize(60),
                    color: const Color.fromRGBO(61, 64, 128, 0.2),
                    offset: const Offset(0, 4))
              ]),
          child: Column(children: [
            GestureDetector(
              onTap: () {
                Get.to(() => const SchoolAdminProfilePositionHeld());
              },
              child: AdminProfileContactInfo(
                  image: "assets/Teacher_Dash/profile_maths.png",
                  header: user.position,
                  color: textColor,
                  subheader: "Position held"),
            ),
            Divider(
              thickness: widthSize(2),
              color: const Color(0xFFE8E8E8),
            ),
            GestureDetector(
              onTap: () {},
              child: const AdminProfileContactInfo(
                  image: "assets/Teacher_Dash/profile_maths.png",
                  header: "None",
                  color: textColor,
                  subheader: "Subject taught"),
            ),
          ]),
        )
      ]),
    );
  }
}

class SchoolAdminProfilePositionHeld extends StatelessWidget {
  const SchoolAdminProfilePositionHeld({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(heightSize(78)),
        child: AppBar(
          backgroundColor: maincolor,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(
              top: heightSize(22),
              left: widthSize(20),
            ),
            child: Row(children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SizedBox(
                  height: heightSize(37.5),
                  width: widthSize(37.5),
                  child: Image.asset("assets/Teacher_Dash/backarrow.png"),
                ),
              ),
              SizedBox(width: widthSize(82.5)),
              Text(
                'Position Held',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: fontSize(20),
                    fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: heightSize(43), right: widthSize(30), left: widthSize(30)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Position Held',
            style: TextStyle(
                color: const Color(0xFF555555),
                fontSize: fontSize(14),
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: heightSize(10)),
          SizedBox(
            height: heightSize(65),
            child: const InputTextField(obscureText: false),
          ),
          SizedBox(height: heightSize(251)),
          AppButtons(
              textColor: whitecolor,
              fontSize: fontSize(16),
              backgroundColor: maincolor,
              text: "Save changes",
              borderColor: maincolor,
              height: heightSize(63),
              onTap: () {}),
        ]),
      ),
    );
  }
}
