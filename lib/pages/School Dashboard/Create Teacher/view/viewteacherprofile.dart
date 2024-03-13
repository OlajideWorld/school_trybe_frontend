import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../../models/teacher_model.dart';
import '../widget/viewteacherwidget.dart';
import '../widget/viewteacherwidget2.dart';

class AdminViewTeachersProfilePage extends StatelessWidget {
  final TeacherModel teacherModel;
  const AdminViewTeachersProfilePage({super.key, required this.teacherModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: heightSize(286),
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
                      left: widthSize(105)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: whitecolor,
                        radius: heightSize(40),
                        child: CircleAvatar(
                          radius: heightSize(37),
                          backgroundImage: NetworkImage(teacherModel.image),
                        ),
                      ),
                      SizedBox(height: heightSize(10)),
                      Text(
                        "${teacherModel.firstname} ${teacherModel.lastName}",
                        style: TextStyle(
                            fontSize: fontSize(20),
                            color: whitecolor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: heightSize(10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.workspace_premium,
                            color: const Color(0xFFFFD964),
                          ),
                          Text(
                            teacherModel.subjectRole,
                            style: TextStyle(
                                fontSize: fontSize(16),
                                color: const Color(0xFFFFD964),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(height: heightSize(10)),
                      Text(
                        "ID: ${teacherModel.id}",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            color: whitecolor,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: heightSize(54),
                  right: widthSize(30),
                  left: widthSize(30)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Personal Details",
                      style: TextStyle(
                         color: Color(0xFF555555),
                          fontSize: fontSize(14),
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: heightSize(15)),
                    //
                    ViewTeacherProfileWidget(
                      teacherModel: teacherModel,
                    ),
                    //
                    SizedBox(height: heightSize(20)),
                  Text(
                      "Place of work",
                      style: TextStyle(
                          color: Color(0xFF555555),
                          fontSize: fontSize(14),
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: heightSize(15)),
                    //
                    ViewTeacherProfileWidget2(teacherModel: teacherModel),
                    //
                    SizedBox(height: heightSize(30)),
                    Container(
                      height: heightSize(121),
                      width: widthSize(368),
                      padding: EdgeInsets.only(
                          top: heightSize(23), left: widthSize(29)),
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(235, 87, 87, 0.05),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Favourite quote",
                                style: TextStyle(
                                    fontSize: fontSize(14),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red)),
                            SizedBox(height: heightSize(10)),
                            SizedBox(
                              height: heightSize(46),
                              width: widthSize(313),
                              child: Text(
                                  "Education is not the filling of a pail, but the lighting of a fire. - William Butler Yeats",
                                  style: TextStyle(
                                      fontSize: fontSize(14),
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red)),
                            ),
                          ]),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
