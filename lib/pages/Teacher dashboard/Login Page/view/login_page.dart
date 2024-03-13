import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/common/input_TextField.dart';
import 'package:school_management/pages/Teacher%20dashboard/Forget%20Password/view/forgetpassword.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';
import 'package:school_management/routes/routes.dart';
import 'package:school_management/services/api_calls.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../School Dashboard/home screen/view/schooladminHome.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController password = TextEditingController();
  final TextEditingController emailAddress = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final RegistrationController controller = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whitecolor,
      body: Obx(() {
        return LoadingOverlayPro(
          isLoading: controller.isLoading.value,
          progressIndicator: const LoadingBouncingGrid.circle(
            borderColor: maincolor,
            backgroundColor: maincolor,
          ),
          child: Form(
            key: formkey,
            child: Column(children: [
              Container(
                height: heightSize(251),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: maincolor),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: heightSize(124), bottom: heightSize(83)),
                  child: Image.asset("assets/Teacher_Dash/schooltrybe.png"),
                ),
              ),
              SizedBox(height: heightSize(62)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
                child: SizedBox(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Email Address",
                            style: TextStyle(
                                fontSize: fontSize(14),
                                fontWeight: FontWeight.w600)),
                        SizedBox(height: heightSize(10)),
                        SizedBox(
                            height: heightSize(75),
                            child: InputTextField(
                              obscureText: false,
                              hintText: "e.g example@gmail.com",
                              controller: emailAddress,
                              textInputAction: true,
                              validator: (String? val) {
                                if (val!.isEmpty) {
                                  return "Please provide your Email address";
                                }
                              },
                            )),
                        SizedBox(height: heightSize(20)),
                        Text("Password",
                            style: TextStyle(
                                fontSize: fontSize(14),
                                fontWeight: FontWeight.w600)),
                        SizedBox(height: heightSize(10)),
                        SizedBox(
                            height: heightSize(75),
                            child: InputTextField(
                              obscureText: true,
                              hintText: "*****************",
                              controller: password,
                              password: true,
                              textInputAction: true,
                              validator: (String? val) {
                                if (val!.isEmpty) {
                                  return "Please provide your password";
                                }
                              },
                            ))
                      ]),
                ),
              ),
              SizedBox(height: heightSize(40)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
                child: SizedBox(
                  height: heightSize(106),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButtons(
                          textColor: whitecolor,
                          fontSize: fontSize(16),
                          backgroundColor: maincolor,
                          text: "Login",
                          borderColor: maincolor,
                          height: heightSize(63),
                          onTap: () async {
                            final clear = formkey.currentState;
                            if (clear!.validate()) {
                              controller.isLoading.value = true;

                              final model = {
                                "email": emailAddress.text.trim(),
                                "password": password.text.trim()
                              };

                              debugPrint(model.toString());
                              var data = await ApiCalls().login(model);
                              if (controller.type.value == 1) {
                                controller.userCredentials.value = data;
                                controller.schoolModel.value = await ApiCalls()
                                    .getSchoolDetails(
                                        controller.userCredentials.value.id);
                                //
                                controller.isLoading.value = false;
                                Get.toNamed(SchoolRoutes.homeScreen);
                              } else if (controller.type.value == 2) {
                                controller.teachermodel.value = data;

                                debugPrint(
                                    controller.teachermodel.value.schoolName);

                                debugPrint("Next API Call");
                                debugPrint("Next API Call");
                                controller.schoolModel.value = await ApiCalls()
                                    .getSchoolDetails(controller
                                        .teachermodel.value.createdBy);

                                //
                                controller.isLoading.value = false;
                                Get.toNamed(TeacherRoutes.homeScreen);
                              } else {
                                controller.parentModel.value = data;
                                debugPrint(
                                    controller.parentModel.value.schoolName);

                                debugPrint("Next API Call");
                                debugPrint("Next API Call");

                                controller.schoolModel.value = await ApiCalls()
                                    .getSchoolDetails(
                                        controller.parentModel.value.createdBy);

                                controller.isLoading.value = false;

                                Get.toNamed(ParentRoutes.homeScreen);
                              }
                            }
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Not Michael Nelson? ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: fontSize(14)),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Log Out",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: fontSize(14),
                                  color: maincolor),
                              recognizer: TapGestureRecognizer()
                                ..onTap =
                                    () => debugPrint('Logged Out Successfully'),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: heightSize(40)),
              SizedBox(
                height: heightSize(99),
                width: widthSize(113),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => ForgetPasswordScreen());
                      },
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: heightSize(66),
                      width: widthSize(66),
                      child: Image.asset(
                        "assets/Teacher_Dash/finger.png",
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        );
      }),
    );
  }
}
