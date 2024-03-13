import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

import '../../../../common/alertMessage.dart';
import '../../../../common/button.dart';
import '../../../../common/custom-text.dart';
import '../../../../services/api_calls.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/Forget Password/widget/profile_details.dart';
import '../../../Teacher dashboard/SIgn-In Page/controller/registrationController.dart';
import '../../../Teacher dashboard/SIgn-In Page/widget/verifyemailMessage.dart';
import '../../Child Validation/view/childvalidation.dart';

class ParentsRegistrationScreen2 extends StatelessWidget {
  ParentsRegistrationScreen2({super.key});
  final RegistrationController regController = RegistrationController.instance;

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
                  child: backbutton()),
              SizedBox(width: widthSize(66.5)),
              Text(
                'Parent Registration',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: fontSize(20),
                    fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ),
      ),
      body: Obx(() {
        return LoadingOverlayPro(
          isLoading: regController.isLoading.value,
          child: SizedBox(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  child: Column(
                    children: [
                      Container(
                        width: constraints.maxWidth,
                        height: heightSize(100),
                        padding: EdgeInsets.only(
                          top: heightSize(20),
                          left: widthSize(20),
                          bottom: heightSize(20),
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CText(
                                text: "Create your account",
                                color: Color(0xFF04100A),
                                size: 20,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(height: heightSize(20)),
                              const CText(
                                text: "Already an account? Login",
                                color: Color(0xFF222222),
                                size: 14,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w400,
                              )
                            ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: widthSize(30)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "School Details",
                            style: TextStyle(
                                color: maincolor,
                                fontSize: fontSize(14),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(height: heightSize(24)),
                      ProfileDetails(),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: widthSize(30),
                            vertical: heightSize(20)),
                        child: AppButtons(
                            textColor: whitecolor,
                            fontSize: fontSize(14),
                            backgroundColor: maincolor,
                            text: "Continue",
                            borderColor: maincolor,
                            height: heightSize(60),
                            onTap: () async {
                              regController.isLoading.value = true;
                              await regController.fetchAllStudentsProfile();
                              regController.isLoading.value = false;
                              Get.to(() => ParentsChildValidationPage());
                              // debugPrint(regController
                              //     .teacherToken.value);
                              // regController.isLoading.value = true;
                              // final model = {
                              //   "firstname":
                              //       regController.name.text.trim(),
                              //   "schoolName": regController
                              //       .schoolModel.value.schoolName,
                              //   "schoolBanner": regController
                              //       .schoolModel.value.image,
                              //   "image": regController
                              //       .teacherImage.value,
                              //   "email": regController
                              //       .emailAddress.text
                              //       .trim(),
                              //   "lastName": regController
                              //       .lastName.text
                              //       .trim(),
                              //   "phoneNumber":
                              //       regController.phoneNumber.value,
                              //   "nin": regController.nin.text
                              //               .trim() ==
                              //           ""
                              //       ? 11111111111
                              //       : regController.nin.text.trim(),
                              //   "maritalStatus": regController
                              //       .maritalStatus.value,
                              //   "gender": regController
                              //       .teachergender.value,
                              //   "stateOfOrigin": regController
                              //       .origin.text
                              //       .trim(),
                              //   "className": regController
                              //       .classSelection.value,
                              //   "classSection": regController
                              //       .classSection.value,
                              //   "subjectRole": regController
                              //       .subjectRole.text
                              //       .trim(),
                              //   "nationality":
                              //       regController.country.value,
                              //   "address":
                              //       regController.address.text,
                              //   "type": 2,
                              // };

                              // showAlertMessageTeacher(
                              //     context,
                              //     false,
                              //     heightSize(432),
                              //     widthSize(368),
                              //     "assets/Teacher_Dash/message2.png",
                              //     heightSize(109),
                              //     VerifyEmailMessage(
                              //       type: "",
                              //       email: "email",
                              //     ));
                            }),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
