import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/pages/Teacher%20dashboard/DashBoard/view/teacher_dashboard.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';
import 'package:school_management/routes/routes.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../Parent DashBoard/ParentMain/view/parentscreen.dart';
import '../../../School Dashboard/home screen/view/schooladminHome.dart';

class AdminSignUpSuccess extends StatelessWidget {
  final String type;
  AdminSignUpSuccess({super.key, required this.type});

  final RegistrationController controller = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.only(top: heightSize(heightSize(109))),
            child: SizedBox(
                height: heightSize(166),
                width: widthSize(166),
                child: SvgPicture.asset(
                    "assets/Teacher_Dash/goodtick_green2.svg")),
          ),
          SizedBox(height: heightSize(14)),
          Text(
            'Signup successful',
            style:
                TextStyle(fontSize: fontSize(20), fontWeight: FontWeight.w600),
          ),
          SizedBox(height: heightSize(21)),
          Text(
            'Congratulations! You have successfully created your school profile on our application and signed up as the admin. \nYou have successfully signed up as a $type at  ${controller.schoolModel.value.schoolName}',
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: fontSize(16), fontWeight: FontWeight.w400),
          ),
          SizedBox(height: heightSize(30.5)),
          Container(
            height: heightSize(170),
            width: widthSize(170),
            decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(controller.schoolModel.value.image),
                  fit: BoxFit.fill,
                ),
                shape: OvalBorder()),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: heightSize(100)),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: AppButtons(
                    textColor: whitecolor,
                    fontSize: fontSize(14),
                    backgroundColor: Colors.green,
                    text: "Proceed to dashboard",
                    borderColor: Colors.green,
                    height: heightSize(60),
                    onTap: () {
                      Get.offNamed(SchoolRoutes.homeScreen);
                    }),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
