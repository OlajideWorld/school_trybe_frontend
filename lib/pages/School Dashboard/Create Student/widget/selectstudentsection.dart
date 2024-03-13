import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:school_management/pages/School%20Dashboard/Create%20Student/controller/student_controller.dart';

import '../../../../models/selectionList.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class StudentClassSelection extends StatefulWidget {
  const StudentClassSelection({super.key});

  @override
  State<StudentClassSelection> createState() => _StudentClassSelectionState();
}

class _StudentClassSelectionState extends State<StudentClassSelection> {
  final StudentController controller = StudentController.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(94),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Class",
                style: TextStyle(
                    fontSize: fontSize(14), fontWeight: FontWeight.w600)),
            Container(
              height: heightSize(65),
              width: widthSize(368),
              padding: EdgeInsets.symmetric(
                  horizontal: widthSize(20), vertical: heightSize(20)),
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: backgroundColor2),
                borderRadius: BorderRadius.circular(widthSize(10)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: controller.studentClass,
                  onChanged: (String? val) {
                    setState(() {
                      controller.studentClass = val!;
                    });
                    debugPrint(controller.studentClass);
                  },
                  items: SelectionClass().studentClass.map((item) {
                    return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                              fontSize: fontSize(14),
                              fontWeight: FontWeight.w400),
                        ));
                  }).toList(),
                ),
              ),
            )
          ]),
    );
  }
}

class SelectDayBoarding extends StatefulWidget {
  const SelectDayBoarding({super.key});

  @override
  State<SelectDayBoarding> createState() => _SelectDayBoardingState();
}

class _SelectDayBoardingState extends State<SelectDayBoarding> {
  final StudentController controller = StudentController.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(94),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Day / Boarding Scholar",
                style: TextStyle(
                    fontSize: fontSize(14), fontWeight: FontWeight.w600)),
            Container(
              height: heightSize(65),
              width: widthSize(368),
              padding: EdgeInsets.symmetric(
                  horizontal: widthSize(20), vertical: heightSize(20)),
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: backgroundColor2),
                borderRadius: BorderRadius.circular(widthSize(10)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: controller.studentType,
                  onChanged: (String? val) {
                    setState(() {
                      controller.studentType = val!;
                    });
                    debugPrint(controller.studentType);
                  },
                  items: SelectionClass().studentSchoolingtype.map((item) {
                    return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                              fontSize: fontSize(14),
                              fontWeight: FontWeight.w400),
                        ));
                  }).toList(),
                ),
              ),
            )
          ]),
    );
  }
}


