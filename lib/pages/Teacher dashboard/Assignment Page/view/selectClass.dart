// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/Assignment%20Page/view/selectSection.dart';
import 'package:school_management/pages/Teacher%20dashboard/Assignment%20Page/widget/selectclassWidget.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';

class SelectClass extends StatelessWidget {
  const SelectClass({super.key});

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
              SizedBox(width: widthSize(90.5)),
              Text(
                'Select Class',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: fontSize(20),
                    fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: widthSize(30), vertical: heightSize(32)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "SENIOR SECONDARY SCHOOL",
            style: TextStyle(
                fontSize: fontSize(14),
                fontWeight: FontWeight.w600,
                color: textcolor5),
          ),
          SizedBox(height: heightSize(10)),
          GestureDetector(
              onTap: () {
                Get.to(() => const SelectSections());
              },
              child: selectClassOptions(context, "Sss Three")),
          SizedBox(height: heightSize(20)),
          selectClassOptions(context, "Sss Two"),
          SizedBox(height: heightSize(20)),
          selectClassOptions(context, "Sss One"),
          SizedBox(height: heightSize(30)),
          Text(
            "JUNIOR SECONDARY SCHOOL",
            style: TextStyle(
                fontSize: fontSize(14),
                fontWeight: FontWeight.w600,
                color: textcolor5),
          ),
          SizedBox(height: heightSize(10)),
          GestureDetector(
              onTap: () {
                Get.to(() => const SelectSections());
              },
              child: selectClassOptions(context, "Jss Three")),
          SizedBox(height: heightSize(20)),
          selectClassOptions(context, "Jss Two"),
          SizedBox(height: heightSize(20)),
          selectClassOptions(context, "Jss One"),
        ]),
      ),
    );
  }
}
