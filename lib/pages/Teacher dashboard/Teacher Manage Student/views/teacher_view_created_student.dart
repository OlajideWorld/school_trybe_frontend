import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/alertMessage.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Manage%20Student/views/view_barcode_student.dart';

import '../../../../common/button.dart';
import '../../../../models/student_model.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../School Dashboard/Create Student/view/barcodeSchool.dart';
import '../../../School Dashboard/Create Student/widget/studentprofileschool.dart';

class TeahcerViewCreatedStudentScreen extends StatelessWidget {
  final StudentModel student;
  const TeahcerViewCreatedStudentScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: heightSize(251),
                    width: widthSize(428),
                    decoration: const BoxDecoration(
                      color: maincolor,
                    ),
                    child: Stack(children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: heightSize(73),
                            right: widthSize(300),
                            left: widthSize(30)),
                        child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: backbutton()),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: heightSize(70),
                            right: widthSize(104),
                            left: widthSize(140)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: heightSize(37),
                              backgroundImage: NetworkImage(student.image),
                            ),
                            SizedBox(height: heightSize(10)),
                            Text(
                              "${student.lastname} ${student.firstname}",
                              style: TextStyle(
                                  fontSize: fontSize(20),
                                  color: whitecolor,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: heightSize(10)),
                            Text(
                              "ID: ${student.id.tr}",
                              style: TextStyle(
                                  fontSize: fontSize(12),
                                  color: whitecolor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                  SizedBox(height: heightSize(48)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
                    child: Text(
                      "PERSONAL INFORMATION",
                      style: TextStyle(
                          color: const Color(0xFF707070),
                          fontSize: fontSize(14),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: heightSize(15)),
                  //
                  showPersonalInfo(student),

                  //
                  SizedBox(height: heightSize(30)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
                    child: Text(
                      "SCHOOL INFORMATION",
                      style: TextStyle(
                          color: const Color(0xFF707070),
                          fontSize: fontSize(14),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: heightSize(15)),

                  //
                  showSchoolInfo(student),
                  //

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: widthSize(30), vertical: heightSize(27)),
                    child: AppButtons(
                        textColor: whitecolor,
                        fontSize: fontSize(14),
                        backgroundColor: maincolor,
                        text: "Continue",
                        borderColor: maincolor,
                        height: heightSize(65),
                        onTap: () {
                          showAlertMessageTeacher(
                              context,
                              true,
                              heightSize(240),
                              widthSize(288),
                              "assets/School_Dash/warningSchool.svg",
                              heightSize(90),
                              SizedBox(
                                width: widthSize(288),
                                child: Column(children: [
                                  SizedBox(height: heightSize(15)),
                                  SizedBox(
                                    height: heightSize(48),
                                    width: widthSize(288),
                                    child: Text(
                                      "Note that these details would be embedded on a barcode",
                                      style: TextStyle(
                                          fontSize: fontSize(16),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(height: heightSize(20)),
                                  AppButtons(
                                      textColor: whitecolor,
                                      fontSize: fontSize(14),
                                      backgroundColor: maincolor,
                                      text: "Proceed",
                                      borderColor: maincolor,
                                      height: heightSize(65),
                                      onTap: () {
                                        showAlertMessageTeacher(
                                          context,
                                          false,
                                          heightSize(326),
                                          widthSize(288),
                                          "assets/Teacher_Dash/goodtick_green.png",
                                          heightSize(135),
                                          SizedBox(
                                            width: widthSize(288),
                                            child: Column(children: [
                                              SizedBox(height: heightSize(10)),
                                              Text(
                                                "Success",
                                                style: TextStyle(
                                                    fontSize: fontSize(20),
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.green),
                                              ),
                                              SizedBox(height: heightSize(20)),
                                              SizedBox(
                                                width: widthSize(288),
                                                child: Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            'You have successfully created ',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF555555),
                                                          fontSize:
                                                              fontSize(16),
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            '${student.firstname} ${student.lastname}',
                                                        style: TextStyle(
                                                          color: maincolor,
                                                          fontSize:
                                                              fontSize(16),
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            ' as a profile in your school',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF555555),
                                                          fontSize:
                                                              fontSize(16),
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              SizedBox(height: heightSize(20)),
                                              AppButtons(
                                                  textColor: whitecolor,
                                                  fontSize: fontSize(14),
                                                  backgroundColor: Colors.green,
                                                  text: "View Barcode",
                                                  borderColor: Colors.green,
                                                  height: heightSize(63),
                                                  onTap: () => Get.to(() =>
                                                      TeacherStudentViewBarcode()))
                                            ]),
                                          ),
                                        );
                                      })
                                ]),
                              ));
                        }),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
