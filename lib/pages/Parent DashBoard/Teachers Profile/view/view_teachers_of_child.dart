// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:school_management/services/parent_api_services.dart';

import '../../../../common/button.dart';
import 'package:get/get.dart';
import '../../../../common/custom-text.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../School Dashboard/Create Teacher/view/viewteacherprofile.dart';
import '../../../School Dashboard/Create Teacher/widget/teachersprofilewidget.dart';

class ParentsViewChildrenTeachers extends StatelessWidget {
  const ParentsViewChildrenTeachers({super.key});

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
                await parentController.fetchAllTeachers();
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
                                        enabledBorder: const OutlineInputBorder(
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
                          parentController.teachersList.isNotEmpty
                              ? SizedBox(
                                  height: constraints.maxHeight,
                                  width: constraints.maxWidth,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          parentController.teachersList.length,
                                      itemBuilder: (context, index) {
                                        var name =
                                            "${parentController.teachersList.value[index].firstname} ${parentController.teachersList.value[index].lastName}";
                                        var gender = parentController
                                            .teachersList.value[index].gender;
                                        return Column(children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(() =>
                                                  AdminViewTeachersProfilePage(
                                                      teacherModel:
                                                          parentController
                                                              .teachersList
                                                              .value[index]));
                                            },
                                            child: AdminTeacherWidget(
                                                width: constraints.maxWidth,
                                                color: maincolor,
                                                text: gender == "Male"
                                                    ? "Mr. $name"
                                                    : "Miss/Mrs $name",
                                                classTeacher: parentController
                                                    .teachersList
                                                    .value[index]
                                                    .subjectRole
                                                    .toUpperCase(),
                                                image: parentController
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
                                            text: "No Teachers",
                                            color: Color(0xFF222222),
                                            size: 20,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(height: heightSize(20)),
                                          const CText(
                                            text:
                                                "Currently there are no Teachers in the school ",
                                            color: Color(0xFF555555),
                                            size: 14,
                                            textAlign: TextAlign.center,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w400,
                                          ),
                                          SizedBox(height: heightSize(20)),
                                        ]),
                                  ),
                                )
                        ]);
                  }),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
