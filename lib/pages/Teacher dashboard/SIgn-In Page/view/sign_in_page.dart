import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Parent%20DashBoard/ParentMain/view/parentscreen.dart';
import 'package:school_management/pages/School%20Dashboard/SignIn%20screeen/view/admin_upload_image.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/view/scanCode.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/widget/sign_up_Box.dart';
import 'package:school_management/routes/routes.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../School Dashboard/SignIn screeen/view/schooadminsignin.dart';
import '../binding/registrationbinding.dart';
import '../controller/registrationController.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final RegistrationController controller = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: Column(children: [
        Container(
          height: heightSize(134),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: maincolor),
          child: Padding(
            padding: EdgeInsets.only(
                top: heightSize(69),
                left: widthSize(30),
                bottom: heightSize(28.5)),
            child: Row(children: [
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: widthSize(37.50),
                    height: heightSize(37.50),
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.20000000298023224),
                      shape: OvalBorder(),
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_left,
                      color: whitecolor,
                    ),
                  )),
              SizedBox(width: widthSize(70.5)),
              Text(
                'Create an account',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: fontSize(20),
                    fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ),
        SizedBox(height: heightSize(38)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
          child: SizedBox(
            height: heightSize(307),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SignupBox(
                    image: "assets/Teacher_Dash/admin_image.png",
                    header: "School Administrator",
                    subtext: "For school administrators",
                    subtextSize: 43,
                    onTap: () => Get.to(
                        () => AdminImageUpload(
                              image: controller.image,
                            ),
                        binding: Registrationbinding())),
                SignupBox(
                    image: "assets/Teacher_Dash/parent_image.png",
                    header: "Parent",
                    subtext: "For parents who have child registered",
                    subtextSize: 43,
                    onTap: () {
                      Get.to(
                          () => const ScanQrCode(
                                number: 2,
                                type: "parent",
                              ),
                          binding: Registrationbinding());
                    }),
                SignupBox(
                    image: "assets/Teacher_Dash/teacher_image.png",
                    header: "Teacher",
                    subtext: "For teachers who have their schools registered",
                    subtextSize: 59,
                    onTap: () {
                      Get.to(
                          () => const ScanQrCode(
                                number: 3,
                                type: "teacher",
                              ),
                          binding: Registrationbinding());
                    }),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
