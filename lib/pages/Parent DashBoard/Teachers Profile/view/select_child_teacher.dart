// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/pages/Parent%20DashBoard/Teachers%20Profile/view/view_teachers_of_child.dart';
import 'package:school_management/pages/Parent%20DashBoard/Teachers%20Profile/widget/parent_view_teacher.dart';
import 'package:school_management/pages/School%20Dashboard/Create%20Teacher/view/Admin_teacherprofile.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../services/api_calls.dart';
import '../../../../utils/sizes.dart';
import '../../ParentMain/controller/parent_controller.dart';

class ParentTeacherProfile extends StatelessWidget {
  ParentTeacherProfile({super.key});

  ParentsController parentController = ParentsController.instance;

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
                'Select Child',
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
          isLoading: parentController.isloading.value,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Padding(
              padding: EdgeInsets.only(
                  top: heightSize(39),
                  right: widthSize(30),
                  left: widthSize(30)),
              child: Padding(
                padding: EdgeInsets.only(bottom: heightSize(20)),
                child: SizedBox(
                  height: constraints.maxHeight,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount:
                          parentController.studentListFromIds.value.length,
                      itemBuilder: (context, index) {
                        var data =
                            parentController.studentListFromIds.value[index];
                        return Column(
                          children: [
                            showChildren(data, () async {
                              parentController.isloading.value = true;
                              parentController.teachersList.value =
                                  await ApiCalls()
                                      .getAllTeachers(data.createdBy);
                              parentController.isloading.value = false;
                              Get.to(() => const ParentsViewChildrenTeachers());
                            }),
                            SizedBox(height: heightSize(15))
                          ],
                        );
                      }),
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}
