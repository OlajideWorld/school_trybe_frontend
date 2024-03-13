// ignore_for_file: must_be_immutable, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/pages/School%20Dashboard/Create%20Teacher/view/viewteacherprofile.dart';
import 'package:school_management/pages/School%20Dashboard/Authorize%20Creation/views/authorize_main_screen.dart';
import 'package:school_management/pages/School%20Dashboard/home%20screen/controller/adminController.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../common/custom-text.dart';
import '../../../../utils/sizes.dart';
import '../widget/teachersprofilewidget.dart';

class AdminTeacherProfileScreen extends StatelessWidget {
  AdminTeacherProfileScreen({super.key});

  AdminController adminController = AdminController.instance;

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
                  'Teachers',
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
              child: RefreshIndicator(
                onRefresh: () async {
                  await adminController.fetchAllTeachers();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: heightSize(36),
                        left: widthSize(30),
                        right: widthSize(30)),
                    child: Obx(() {
                      return Column(
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
                                                  color: backgroundcolor4),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(7))),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: backgroundcolor4),
                                            borderRadius: BorderRadius.all(
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
                            SizedBox(height: heightSize(28)),

                            adminController.teachersList.isNotEmpty
                                ? SizedBox(
                                    height: constraints.maxHeight,
                                    width: constraints.maxWidth,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            adminController.teachersList.length,
                                        itemBuilder: (context, index) {
                                          var name =
                                              "${adminController.teachersList.value[index].firstname} ${adminController.teachersList.value[index].lastName}";
                                          var gender = adminController
                                              .teachersList.value[index].gender;
                                          return Column(children: [
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(() =>
                                                    AdminViewTeachersProfilePage(
                                                        teacherModel:
                                                            adminController
                                                                .teachersList
                                                                .value[index]));
                                              },
                                              child: AdminTeacherWidget(
                                                  width: constraints.maxWidth,
                                                  color: maincolor,
                                                  text: gender == "Male"
                                                      ? "Mr. $name"
                                                      : "Miss/Mrs $name",
                                                  classTeacher: adminController
                                                      .teachersList
                                                      .value[index]
                                                      .subjectRole
                                                      .toUpperCase(),
                                                  image: adminController
                                                      .teachersList
                                                      .value[index]
                                                      .image),
                                            ),
                                            SizedBox(height: heightSize(15)),
                                          ]);
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
                                                "assets/School_Dash/emptyTeachers.png",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            SizedBox(height: heightSize(20)),
                                            const CText(
                                              text: "No Events",
                                              color: Color(0xFF222222),
                                              size: 20,
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w600,
                                            ),
                                            SizedBox(height: heightSize(20)),
                                            const CText(
                                              text:
                                                  "You currently have no Teachers in the school tap “Create” to create one.",
                                              color: Color(0xFF555555),
                                              size: 14,
                                              textAlign: TextAlign.center,
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w400,
                                            ),
                                            SizedBox(height: heightSize(20)),
                                            GestureDetector(
                                              onTap: () => Get.to(
                                                  () => AuthorizeMainScreen()),
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
                                                        color:
                                                            Color(0xFFD9D9D9)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2200),
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
                                  )

                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     GestureDetector(
                            //       onTap: () =>
                            //           Get.to(() => const

                            // ),
                            //       child: const ParentsTeacherWidget(
                            //         image: "assets/Parents_Dash/parentimage1.png",
                            //         color: maincolor,
                            //         text: "Mr. Isaac",
                            //         classTeacher: "Head Teacher",
                            //       ),
                            //     ),
                            //     GestureDetector(
                            //       onTap: () =>
                            //           Get.to(() => const TeachersProfilePage(
                            //                 image:
                            //                     "assets/Parents_Dash/parentimage2.png",
                            //                 name: "Ms Helen Adaramoye",
                            //                 position: "Class Teacher",
                            //               )),
                            //       child: const ParentsTeacherWidget(
                            //         image: "assets/Parents_Dash/parentimage2.png",
                            //         color: Colors.green,
                            //         text: "Ms. Helen",
                            //         classTeacher: "Class Teacher",
                            //       ),
                            //     )
                            //   ],
                            // ),
                            // SizedBox(height: heightSize(20)),
                          ]);
                    }),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
