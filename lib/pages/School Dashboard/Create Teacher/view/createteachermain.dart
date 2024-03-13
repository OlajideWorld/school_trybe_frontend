import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:get/get.dart";
import "package:loading_overlay_pro/loading_overlay_pro.dart";
import "package:school_management/common/button.dart";
import "package:school_management/pages/School%20Dashboard/home%20screen/controller/adminController.dart";
import "package:school_management/utils/colors.dart";

import "../../../../utils/sizes.dart";
import 'Admin_teacherprofile.dart';
import "inputfieldsteachers.dart";

class AdminTeacherMainScreen extends StatelessWidget {
  AdminTeacherMainScreen({super.key});

  AdminController adminController = AdminController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SizedBox(width: widthSize(77.5)),
              Text(
                'Manage Teachers',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: fontSize(20),
                    fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ),
      ),
      backgroundColor: whitecolor,
      body: Obx(() {
        return LoadingOverlayPro(
          isLoading: adminController.isloading.value,
          child: Padding(
            padding: EdgeInsets.only(
              top: heightSize(36),
              right: widthSize(30),
              left: widthSize(30),
            ),
            child: Column(children: [
              // // 1st Box
              // GestureDetector(
              //   onTap: () => Get.to(() => InputFieldTeachersScreen()),
              //   child: Container(
              //     height: heightSize(90),
              //     width: widthSize(368),
              //     padding: EdgeInsets.only(
              //         top: heightSize(17),
              //         left: widthSize(31),
              //         right: widthSize(30.8),
              //         bottom: heightSize(15)),
              //     decoration: BoxDecoration(
              //         boxShadow: [
              //           BoxShadow(
              //             blurRadius: widthSize(10),
              //             color: const Color.fromRGBO(61, 64, 128, 0.2),
              //           )
              //         ],
              //         color: whitecolor,
              //         border: Border.all(color: backgroundColor2),
              //         borderRadius: const BorderRadius.all(Radius.circular(10))),
              //     child: Row(children: [
              //       SizedBox(
              //         height: heightSize(57),
              //         width: widthSize(57),
              //         child:
              //             SvgPicture.asset("assets/School_Dash/createTeacher.svg"),
              //       ),
              //       SizedBox(width: widthSize(7)),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text(
              //             "Create a teacher",
              //             style: TextStyle(
              //                 color: maincolor,
              //                 fontSize: fontSize(16),
              //                 fontWeight: FontWeight.w600),
              //           ),
              //           SizedBox(height: heightSize(5)),
              //           Text(
              //             "Select to create a new teacher profile",
              //             style: TextStyle(
              //                 color: maincolor,
              //                 fontSize: fontSize(14),
              //                 fontWeight: FontWeight.w400),
              //           ),
              //         ],
              //       ),
              //       const Spacer(),
              //       Icon(
              //         Icons.arrow_forward_ios,
              //         size: heightSize(15),
              //         color: maincolor,
              //       )
              //     ]),
              //   ),
              // ),
              // SizedBox(height: heightSize(20)),

              // 2nd Box
              GestureDetector(
                onTap: () {
                  // adminController.isloading.value = true;

                  Get.to(() => AdminTeacherProfileScreen());
                },
                child: Container(
                  height: heightSize(90),
                  width: widthSize(368),
                  padding: EdgeInsets.only(
                      top: heightSize(17),
                      left: widthSize(31),
                      right: widthSize(30.8),
                      bottom: heightSize(15)),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: widthSize(10),
                          color: const Color.fromRGBO(61, 64, 128, 0.2),
                        )
                      ],
                      color: whitecolor,
                      border: Border.all(color: backgroundColor2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Row(children: [
                    SizedBox(
                      height: heightSize(57),
                      width: widthSize(57),
                      child: SvgPicture.asset(
                          "assets/School_Dash/createTeacher.svg"),
                    ),
                    SizedBox(width: widthSize(7)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Manage teachers",
                          style: TextStyle(
                              color: maincolor,
                              fontSize: fontSize(16),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: heightSize(5)),
                        Text(
                          "Select to manage teacher profile",
                          style: TextStyle(
                              color: maincolor,
                              fontSize: fontSize(14),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: heightSize(15),
                      color: maincolor,
                    )
                  ]),
                ),
              )
            ]),
          ),
        );
      }),
    );
  }
}
