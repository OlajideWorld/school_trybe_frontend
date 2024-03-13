import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/pages/Teacher%20dashboard/Forget%20Password/widget/profile_details.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/view/registration3.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/widget/teachers_selection.dart';
import 'package:school_management/services/api_calls.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../common/alertMessage.dart';
import '../../../../common/button.dart';
import '../../../../common/custom-text.dart';
import '../../../../models/selectionList.dart';
import '../../../../utils/sizes.dart';
import '../widget/SelectionWidget.dart';
import '../widget/textFieldWidget.dart';
import '../widget/verifyemailMessage.dart';

class RegistrationScreen2 extends StatelessWidget {
  final String type;
  RegistrationScreen2({super.key, required this.type});

  final RegistrationController regController = RegistrationController.instance;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
                '$type Registration',
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
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: SizedBox(
                      child: Form(
                        key: formkey,
                        autovalidateMode: AutovalidateMode.always,
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
                                  "Place of work",
                                  style: TextStyle(
                                      color: maincolor,
                                      fontSize: fontSize(14),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            SizedBox(height: heightSize(24)),
                            SizedBox(
                              // height: heightSize(208),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ProfileDetails(),
                                    SizedBox(height: heightSize(20)),
                                    SizedBox(
                                        height: heightSize(94),
                                        child: const SelectYourClass()),
                                    SizedBox(height: heightSize(20)),
                                    SizedBox(
                                        height: heightSize(94),
                                        child: const TeacherClassSelection()),
                                    SizedBox(height: heightSize(20)),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: widthSize(30)),
                                      child: TextFieldWidgetRegister(
                                          label: "Subject Assigned",
                                          hinttext: "Subject Assigned",
                                          obscure: false,
                                          password: false,
                                          validator: (String? val) {
                                            if (val!.isEmpty) {
                                              return "Please enter your Subject Role";
                                            }
                                            return null;
                                          },
                                          controller:
                                              regController.subjectRole),
                                    ),
                                  ]),
                            ),
                            SizedBox(height: heightSize(33)),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: widthSize(30)),
                              child: SizedBox(
                                height: heightSize(93),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppButtons(
                                          textColor: whitecolor,
                                          fontSize: fontSize(14),
                                          backgroundColor: maincolor,
                                          text: "Continue",
                                          borderColor: maincolor,
                                          height: heightSize(60),
                                          onTap: () async {
                                            final clear = formkey.currentState;
                                            if (clear!.validate()) {
                                              // debugPrint(regController
                                              //     .teacherToken.value);
                                              regController.isLoading.value =
                                                  true;
                                              final model = {
                                                "firstname": regController
                                                    .name.text
                                                    .trim(),
                                                "schoolName": regController
                                                    .schoolModel
                                                    .value
                                                    .schoolName,
                                                "schoolBanner": regController
                                                    .schoolModel.value.image,
                                                "image": regController
                                                    .teacherImage.value,
                                                "email": regController
                                                    .emailAddress.text
                                                    .trim(),
                                                "lastName": regController
                                                    .lastName.text
                                                    .trim(),
                                                "phoneNumber": regController
                                                    .phoneNumber.value,
                                                "nin": regController.nin.text
                                                            .trim() ==
                                                        ""
                                                    ? 11111111111
                                                    : regController.nin.text
                                                        .trim(),
                                                "maritalStatus": regController
                                                    .maritalStatus.value,
                                                "gender": regController
                                                    .teachergender.value,
                                                "stateOfOrigin": regController
                                                    .origin.text
                                                    .trim(),
                                                "className": regController
                                                    .classSelection.value,
                                                "classSection": regController
                                                    .classSection.value,
                                                "subjectRole": regController
                                                    .subjectRole.text
                                                    .trim(),
                                                "nationality":
                                                    regController.country.value,
                                                "address":
                                                    regController.address.text,
                                                "type": 2,
                                              };

                                              debugPrint(model.toString());
                                              regController.teachermodel.value =
                                                  await ApiCalls()
                                                      .createTeacherRoute(
                                                          model,
                                                          regController
                                                              .teacherAdminId
                                                              .value,
                                                          type);

                                              if (regController
                                                      .teachermodel.value !=
                                                  null) {
                                                regController.isLoading.value =
                                                    false;

                                                showAlertMessageTeacher(
                                                    context,
                                                    false,
                                                    heightSize(432),
                                                    widthSize(368),
                                                    "assets/Teacher_Dash/message2.png",
                                                    heightSize(109),
                                                    VerifyEmailMessage(
                                                      type: type,
                                                      email: "email",
                                                    ));
                                              }
                                            }
                                          }),
                                    ]),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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
