// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/getxmessage.dart';
import 'package:school_management/pages/Parent%20DashBoard/Parents%20Sign%20Up/views/view_selected_children.dart';

import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../common/button.dart';
import '../../../../common/custom-text.dart';
import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/Forget Password/widget/profile_details.dart';
import '../widget/childvalidationwidget.dart';

class ParentsChildValidationPage extends StatefulWidget {
  const ParentsChildValidationPage({super.key});

  @override
  State<ParentsChildValidationPage> createState() =>
      _ParentsChildValidationPageState();
}

class _ParentsChildValidationPageState
    extends State<ParentsChildValidationPage> {
  RegistrationController regController = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: widthSize(20), vertical: heightSize(3)),
        child: GestureDetector(
          onTap: () async {
            final model = {"ids": regController.selectedStudentIds.value};
            debugPrint(model.toString());

            if (regController.selectedStudentIds.value.isEmpty) {
              getErrorSnackBar(
                  "Please select your children, if you can't find yours report below");
            } else {
              regController.isLoading.value = true;
              regController.fetchStudentswithIdList(model);
              regController.isLoading.value = false;

              Get.to(() => ParentsViewSelectedChidren());
            }
          },
          child: Container(
            alignment: Alignment.center,
            height: heightSize(60),
            decoration: ShapeDecoration(
              color: Color(0xFF219653),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const CText(
              text: "Continue",
              fontWeight: FontWeight.w600,
              color: whitecolor,
            ),
          ),
        ),
      ),
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
                  'Add your child',
                  style: TextStyle(
                      color: whitecolor,
                      fontSize: fontSize(20),
                      fontWeight: FontWeight.w600),
                ),
              ]),
            ),
          )),
      body: LayoutBuilder(
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
                  SizedBox(
                    width: constraints.maxWidth,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: backgroundcolor4,
                          contentPadding: EdgeInsets.only(
                              top: heightSize(10), left: widthSize(10)),
                          hintText: "        Search for your child",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: textcolor7,
                              fontSize: fontSize(14)),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: backgroundcolor4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: backgroundcolor4),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: heightSize(19)),

                  Obx(() => regController.isLoading.value == true
                      ? Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                              height: heightSize(50),
                              width: widthSize(50),
                              child: const CircularProgressIndicator(
                                  color: maincolor)),
                        )
                      : regController.studentList.value.isNotEmpty
                          ? SizedBox(
                              height: heightSize(500),
                              width: constraints.maxWidth,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      regController.studentList.value.length,
                                  itemBuilder: (context, index) {
                                    bool isSelected = regController
                                        .selectedStudentIds.value
                                        .contains(regController
                                            .studentList.value[index].id);

                                    return Column(
                                      children: [
                                        ChidValidationScreenWidget(
                                          model: regController
                                              .studentList.value[index],
                                          isSelected: isSelected,
                                          onTap: () {
                                            toggleSelection(regController
                                                .studentList.value[index].id);
                                          },
                                        ),
                                        SizedBox(height: heightSize(20))
                                      ],
                                    );
                                  }),
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
                            ))

                  // Padding(
                  //   padding: EdgeInsets.only(bottom: heightSize(30)),
                  //   child: InkWell(
                  //     onTap: () => Get.to(() => const ParentsReportChildPage()),
                  //     child: RichText(
                  //       text: TextSpan(
                  //         style: const TextStyle(
                  //           color: Colors.black,
                  //         ),
                  //         children: <TextSpan>[
                  //           TextSpan(
                  //               text: 'Cant find my child? ',
                  //               style: TextStyle(
                  //                   color: Colors.black,
                  //                   fontSize: fontSize(23),
                  //                   fontWeight: FontWeight.w600)),
                  //           TextSpan(
                  //               text: 'Report',
                  //               style: TextStyle(
                  //                   color: maincolor,
                  //                   fontSize: fontSize(23),
                  //                   fontWeight: FontWeight.w600))
                  //         ],
                  //       ),
                  //       textScaleFactor: 0.5,
                  //     ),
                  //   ),
                  // )
                ]),
              ),
            ),
          );
        },
      ),
    );
  }

  void toggleSelection(String studentId) {
    setState(() {
      if (regController.selectedStudentIds.value.contains(studentId)) {
        regController.selectedStudentIds.value.remove(studentId);
      } else {
        regController.selectedStudentIds.value.add(studentId);
      }
    });
  }
}
