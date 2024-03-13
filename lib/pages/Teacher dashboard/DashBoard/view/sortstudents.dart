import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/DashBoard/view/studentprofile.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../../utils/colors.dart';
import '../widget/sortimages.dart';
import '../widget/teacherhomewidget.dart';

class SortStudent extends StatelessWidget {
  const SortStudent({super.key});

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
                child: SizedBox(
                  height: heightSize(37.5),
                  width: 37.5,
                  child: Image.asset("assets/Teacher_Dash/backarrow.png"),
                ),
              ),
              SizedBox(width: widthSize(103.5)),
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
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
                top: heightSize(20), left: widthSize(30), right: widthSize(30)),
            child: Column(
              children: [
                SizedBox(
                  height: heightSize(57),
                  width: widthSize(368),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: widthSize(236),
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: backgroundcolor4,
                              contentPadding: EdgeInsets.only(
                                  top: heightSize(10), left: widthSize(10)),
                              hintText: "        Search for student name",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: textcolor7,
                                  fontSize: fontSize(17)),
                              border: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: backgroundcolor4),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7))),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: backgroundcolor4),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: heightSize(56),
                          width: widthSize(56),
                          decoration: const BoxDecoration(
                              color: textColor3,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Center(
                            child: Icon(
                              Icons.filter_list_sharp,
                              color: whitecolor,
                            ),
                          ),
                        )
                      ]),
                ),
                SizedBox(height: heightSize(56)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "A - Z",
                    style: TextStyle(
                        color: textcolor5,
                        fontSize: fontSize(16),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: heightSize(10)),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const StudentProfile());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      showStudentProfileHome(),
                      showStudentProfileHome()
                    ],
                  ),
                ),
                SizedBox(height: heightSize(15)),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const StudentProfile());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      showStudentProfileHome(),
                      showStudentProfileHome()
                    ],
                  ),
                ),
                SizedBox(height: heightSize(15)),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const StudentProfile());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      showStudentProfileHome(),
                      showStudentProfileHome()
                    ],
                  ),
                ),
                SizedBox(height: heightSize(15)),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const StudentProfile());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      showStudentProfileHome(),
                      showStudentProfileHome()
                    ],
                  ),
                ),
                SizedBox(height: heightSize(15)),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const StudentProfile());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      showStudentProfileHome(),
                      showStudentProfileHome()
                    ],
                  ),
                ),
                SizedBox(height: heightSize(15)),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const StudentProfile());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      showStudentProfileHome(),
                      showStudentProfileHome()
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
