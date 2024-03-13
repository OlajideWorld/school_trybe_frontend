import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/Submitted%20Assignment/view/See_assignments.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../Assignment Page/widget/selectclassWidget.dart';
import '../binding/submitbinding.dart';

class SelectSectionSubmit extends StatelessWidget {
  const SelectSectionSubmit({super.key});

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
              SizedBox(width: widthSize(80.5)),
              Text(
                'Select section',
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
            "Sss Three",
            style: TextStyle(
                fontSize: fontSize(16),
                fontWeight: FontWeight.w600,
                color: textcolor5),
          ),
          SizedBox(height: heightSize(10)),
          GestureDetector(
            onTap: () {
              Get.to(() => const SeeAssignments(), binding: SubmitBiindings());
            },
            child: selectClassOptions(context, "A"),
          ),
          SizedBox(height: heightSize(10)),
          selectClassOptions(context, "B"),
          SizedBox(height: heightSize(10)),
          selectClassOptions(context, "C"),
          SizedBox(height: heightSize(10)),
          selectClassOptions(context, "D"),
        ]),
      ),
    );
  }
}
