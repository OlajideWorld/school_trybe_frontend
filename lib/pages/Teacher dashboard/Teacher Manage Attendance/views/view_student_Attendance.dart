// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/models/student_model.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../common/button.dart';
import '../../../../common/custom-text.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../DashBoard/controller/teacher_controller.dart';

class TeacherViewStudentAttendance extends StatelessWidget {
  final StudentModel model;
  TeacherViewStudentAttendance({super.key, required this.model});

  final TeacherController teacherController = TeacherController.instance;

  Rx<DateTime> today = DateTime.now().obs;

  void onDaySelected(DateTime day, DateTime focusedDay) {
    today.value = day;
    debugPrint(today.value.toIso8601String());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Obx(() {
              return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: heightSize(230),
                        width: constraints.maxWidth,
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
                                left: widthSize(130)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: heightSize(80),
                                  width: widthSize(80),
                                  decoration: const ShapeDecoration(
                                    color: Colors.white,
                                    shape: OvalBorder(
                                      side: BorderSide(
                                          width: 1.90, color: Colors.white),
                                    ),
                                  ),
                                  child: Container(
                                    width: widthSize(70.14),
                                    height: heightSize(70.14),
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(model.image),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: const OvalBorder(),
                                    ),
                                  ),
                                ),
                                SizedBox(height: heightSize(10)),
                                Text(
                                  "${model.lastname} ${model.firstname}",
                                  style: TextStyle(
                                      fontSize: fontSize(20),
                                      color: whitecolor,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: heightSize(10)),
                                Text(
                                  "ID: ${model.id}",
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
                      SizedBox(height: heightSize(35)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: widthSize(30),
                            vertical: heightSize(30)),
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CText(
                                text: "CALENDAR",
                                color: Color(0xFF707070),
                                size: 14,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(height: heightSize(15)),
                              Container(
                                padding: EdgeInsets.only(
                                  top: heightSize(26),
                                  left: widthSize(17),
                                  right: widthSize(17),
                                  bottom: heightSize(36),
                                ),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 1, color: Color(0xFFD9D9D9)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                width: constraints.maxWidth,
                                child: TableCalendar(
                                  focusedDay: today.value,
                                  firstDay: DateTime.utc(2023, 1, 23),
                                  lastDay: DateTime.utc(2024, 1, 23),
                                  // daysOfWeekVisible: false,
                                  headerStyle: const HeaderStyle(
                                      formatButtonVisible: false,
                                      titleCentered: true),
                                  onDaySelected: onDaySelected,
                                  selectedDayPredicate: (day) =>
                                      isSameDay(day, today.value),
                                ),
                              ),
                              SizedBox(height: heightSize(40)),
                              const CText(
                                text: "STATISTICS",
                                color: Color(0xFF707070),
                                size: 14,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ));
            }),
          );
        },
      ),
    );
  }
}
