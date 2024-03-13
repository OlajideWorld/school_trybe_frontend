// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/common/alertMessage.dart';
import 'package:school_management/common/getxmessage.dart';
import 'package:school_management/pages/Parent%20DashBoard/Parents%20Sign%20Up/views/parent_password_reset.dart';
import 'package:school_management/pages/Parent%20DashBoard/Parents%20Sign%20Up/widget/view_children_widget.dart';
import 'package:school_management/services/api_calls.dart';

import '../../../../common/button.dart';
import '../../../../common/custom-text.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/Forget Password/widget/profile_details.dart';
import '../../../Teacher dashboard/SIgn-In Page/controller/registrationController.dart';

class ParentsViewSelectedChidren extends StatelessWidget {
  RegistrationController regController = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(heightSize(76)),
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
                SizedBox(width: widthSize(75)),
                Text(
                  'Child Confirmation',
                  style: TextStyle(
                      color: whitecolor,
                      fontSize: fontSize(20),
                      fontWeight: FontWeight.w600),
                ),
              ]),
            ),
          )),
      body: Obx(() {
        return LoadingOverlayPro(
          isLoading: regController.isLoading.value,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SizedBox(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: RefreshIndicator(
                  onRefresh: () async {
                    regController.isLoading.value = true;
                    await regController.fetchAllStudentsProfile();
                    regController.isLoading.value = false;
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(children: [
                      SizedBox(height: heightSize(19)),
                      ProfileDetails(),
                      SizedBox(height: heightSize(20)),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: widthSize(20)),
                        child: const CText(
                          text:
                              "Can you please confirm that the children's profile below belong to your children?",
                          size: 14,
                          color: Color(0xFF555555),
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      SizedBox(height: heightSize(19)),
                      regController.isLoading.value == true
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: widthSize(20)),
                              child: Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: heightSize(50),
                                  width: widthSize(50),
                                ),
                              ),
                            )
                          : regController.studentListFromIds.value.isNotEmpty
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: widthSize(20)),
                                  child: SizedBox(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: heightSize(500),
                                          width: constraints.maxWidth,
                                          child: ListView.builder(
                                              scrollDirection: Axis.vertical,
                                              itemCount: regController
                                                  .studentListFromIds
                                                  .value
                                                  .length,
                                              itemBuilder: (context, index) {
                                                var data = regController
                                                    .studentListFromIds
                                                    .value[index];
                                                return Column(
                                                  children: [
                                                    ViewChildrenWidget(
                                                        width: constraints
                                                            .maxWidth,
                                                        color: maincolor,
                                                        text:
                                                            "${data.lastname} ${data.firstname}",
                                                        classTeacher:
                                                            data.classAssigned,
                                                        image: data.image),
                                                    SizedBox(
                                                        height: heightSize(20))
                                                  ],
                                                );
                                              }),
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: heightSize(60),
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFFEB5757),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  child: CText(
                                                    text: "No, back to select",
                                                    color: Colors.white,
                                                    size: 14,
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: widthSize(10)),
                                            Expanded(
                                              flex: 1,
                                              child: GestureDetector(
                                                onTap: () async {
                                                  regController
                                                      .isLoading.value = true;

                                                  final model = {
                                                    "firstname": regController
                                                        .name.text
                                                        .trim(),
                                                    "schoolName": regController
                                                        .schoolModel
                                                        .value
                                                        .schoolName,
                                                    "schoolBanner":
                                                        regController
                                                            .schoolModel
                                                            .value
                                                            .image,
                                                    "image": regController
                                                        .parentImage.value,
                                                    "email": regController
                                                        .emailAddress.text
                                                        .trim(),
                                                    "lastName": regController
                                                        .lastName.text
                                                        .trim(),
                                                    "phoneNumber": regController
                                                        .phoneNumber.value,
                                                    "nin": regController
                                                                .nin.text
                                                                .trim() ==
                                                            ""
                                                        ? 11111111111
                                                        : regController.nin.text
                                                            .trim(),
                                                    "maritalStatus":
                                                        regController
                                                            .maritalStatus
                                                            .value,
                                                    "gender": regController
                                                        .teachergender.value,
                                                    "stateOfOrigin":
                                                        regController
                                                            .origin.text
                                                            .trim(),
                                                    "childrenID": regController
                                                        .selectedStudentIds
                                                        .value,
                                                    "nationality": regController
                                                        .country.value,
                                                    "occupation": regController
                                                        .occupation.text
                                                        .trim(),
                                                    "address": regController
                                                        .address.text
                                                        .trim(),
                                                    "type": 3,
                                                  };

                                                  debugPrint(model.toString());

                                                  regController
                                                          .parentModel.value =
                                                      await ApiCalls()
                                                          .parentSignUp(
                                                              model,
                                                              regController
                                                                  .parentAdminId
                                                                  .value);

                                                  if (regController
                                                          .parentModel.value !=
                                                      null) {
                                                    regController.isLoading
                                                        .value = false;
                                                    showAlertMessageTeacher(
                                                      context,
                                                      false,
                                                      heightSize(438),
                                                      widthSize(287),
                                                      "assets/Teacher_Dash/goodtick_green.png",
                                                      heightSize(138),
                                                      SizedBox(
                                                        width: constraints
                                                            .maxWidth,
                                                        child:
                                                            Column(children: [
                                                          Container(
                                                            height:
                                                                heightSize(121),
                                                            width: constraints
                                                                .maxWidth,
                                                            alignment: Alignment
                                                                .center,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    color: Color(
                                                                        0x19219653)),
                                                            child: const CText(
                                                                text:
                                                                    "You have successfully created your children profiles and these profiles has been added to your dashboard",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                color: Color(
                                                                    0xFF219653),
                                                                size: 14,
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          SizedBox(
                                                              height:
                                                                  heightSize(
                                                                      20)),
                                                          AppButtons(
                                                              textColor:
                                                                  whitecolor,
                                                              fontSize: 14,
                                                              backgroundColor:
                                                                  Color(
                                                                      0xFF219653),
                                                              text:
                                                                  "Continue parent registration",
                                                              borderColor: Color(
                                                                  0xFF219653),
                                                              height:
                                                                  heightSize(
                                                                      63),
                                                              onTap: () async {
                                                                Get.to(() =>
                                                                    ParentsResetPassword(
                                                                      type:
                                                                          "Parent",
                                                                    ));
                                                              })
                                                        ]),
                                                      ),
                                                    );
                                                  } else {
                                                    getErrorSnackBar(
                                                        "Not Able to register");
                                                  }
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: heightSize(60),
                                                  decoration: ShapeDecoration(
                                                    color:
                                                        const Color(0xFF3D4080),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  child: const CText(
                                                    text: "Confirm",
                                                    color: Colors.white,
                                                    size: 14,
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.only(
                                      top: heightSize(94),
                                      left: widthSize(20),
                                      right: widthSize(20)),
                                  child: SizedBox(
                                    width: constraints.maxWidth,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: constraints.maxWidth,
                                            height: heightSize(258.67),
                                            child: Image.asset(
                                              "assets/School_Dash/emptyStudents.png",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          SizedBox(height: heightSize(20)),
                                          const CText(
                                            text: "No Students",
                                            color: Color(0xFF222222),
                                            size: 20,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(height: heightSize(20)),
                                          const CText(
                                            text:
                                                "There are currently no students in this school",
                                            color: Color(0xFF555555),
                                            size: 14,
                                            textAlign: TextAlign.center,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ]),
                                  ),
                                )
                    ]),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
