// ignore_for_file: must_be_immutable, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/pages/Teacher%20dashboard/DashBoard/controller/teacher_controller.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Manage%20Results/views/view_student_results.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Manage%20Student/views/input_fields_student.dart';

import '../../../../common/button.dart';
import '../../../../common/custom-text.dart';
import '../../../../services/api_calls.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../School Dashboard/Manage Student/widget/manageStudentProfileWidget.dart';

class StudentListForViewResults extends StatelessWidget {
  StudentListForViewResults({super.key});

  TeacherController teacherController = TeacherController();

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
              SizedBox(width: widthSize(100)),
              Text(
                'Students',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: fontSize(20),
                    fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Obx(() {
              return LoadingOverlayPro(
                isLoading: teacherController.isloading.value,
                child: RefreshIndicator(
                  onRefresh: () => teacherController.fetchStudentsProfile(),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: teacherController.studentList.isNotEmpty
                        ? Padding(
                            padding: EdgeInsets.only(
                                top: heightSize(28),
                                left: widthSize(30),
                                right: widthSize(30)),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: heightSize(57),
                                    width: widthSize(368),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: widthSize(236),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: backgroundcolor4,
                                                contentPadding: EdgeInsets.only(
                                                    top: heightSize(10),
                                                    left: widthSize(10)),
                                                hintText:
                                                    "        Search for class or term",
                                                hintStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: textcolor7,
                                                    fontSize: fontSize(14)),
                                                border: const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            backgroundcolor4),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                7))),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: backgroundcolor4),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: heightSize(56),
                                            width: widthSize(56),
                                            decoration: const BoxDecoration(
                                                color: textColor3,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: const Center(
                                              child: Icon(
                                                Icons.search_rounded,
                                                color: whitecolor,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: heightSize(56),
                                            width: widthSize(56),
                                            decoration: const BoxDecoration(
                                                color: maincolor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: const Center(
                                              child: Icon(
                                                Icons.filter_list_sharp,
                                                color: whitecolor,
                                              ),
                                            ),
                                          )
                                        ]),
                                  ),
                                  SizedBox(height: heightSize(32)),
                                  Text(
                                    "A-Z",
                                    style: TextStyle(
                                        fontSize: fontSize(16),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: heightSize(15)),
                                  SizedBox(
                                    height: constraints.maxHeight,
                                    width: constraints.maxWidth,
                                    child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          //space between columns
                                          crossAxisSpacing: heightSize(15),
                                          //space between rows
                                          mainAxisSpacing: widthSize(10.0),
                                        ),
                                        itemCount: teacherController
                                            .studentList.value.length,
                                        itemBuilder: (context, index) {
                                          return manageStudentResultsView(
                                              teacherController.studentList
                                                  .value[index], () async {
                                            teacherController.isloading.value =
                                                true;

                                            teacherController
                                                    .studentResult.value =
                                                await ApiCalls()
                                                    .teacherGetStudentResults(
                                                        teacherController
                                                            .studentList
                                                            .value[index]
                                                            .id);

                                            teacherController.isloading.value =
                                                false;
                                            if (teacherController
                                                .studentList.isNotEmpty) {
                                              Get.to(() =>
                                                  ViewStudentResultsScreen(
                                                      model: teacherController
                                                          .studentList
                                                          .value[index]));
                                            }
                                          });
                                        }),
                                  )
                                ]),
                          )
                        : Padding(
                            padding: EdgeInsets.only(
                                top: heightSize(94),
                                left: widthSize(20),
                                right: widthSize(20)),
                            child: SizedBox(
                              width: constraints.maxWidth,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                          "You currently have no students in this class tap “Create” to create a student.",
                                      color: Color(0xFF555555),
                                      size: 14,
                                      textAlign: TextAlign.center,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    SizedBox(height: heightSize(20)),
                                    GestureDetector(
                                      onTap: () =>
                                          Get.to(() => TeacherStudentInputField(
                                                type: "Create student",
                                              )),
                                      child: Container(
                                        height: heightSize(60),
                                        width: widthSize(114),
                                        alignment: Alignment.center,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                width: 1,
                                                color: Color(0xFFD9D9D9)),
                                            borderRadius:
                                                BorderRadius.circular(2200),
                                          ),
                                        ),
                                        child: const CText(
                                          text: "Create",
                                          color: Color(0xFF222222),
                                          size: 16,
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
