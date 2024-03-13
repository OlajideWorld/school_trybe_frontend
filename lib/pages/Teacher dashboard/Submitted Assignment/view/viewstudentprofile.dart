import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";

import "../../../../utils/colors.dart";
import "../../../../utils/sizes.dart";

class ViewStudentAssignments extends StatelessWidget {
  const ViewStudentAssignments({super.key});

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
              SizedBox(width: widthSize(66.5)),
              Text(
                'Gbemisola Shola',
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
        padding: EdgeInsets.only(
            left: widthSize(30), right: widthSize(30), top: heightSize(33)),
        child: Column(
          children: [
            SizedBox(
              height: heightSize(95),
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset(
                "assets/Teacher_Dash/gbemisolaAssignment.svg",
              ),
            ),
            SizedBox(height: heightSize(20)),
            SizedBox(
              height: heightSize(95),
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset(
                "assets/Teacher_Dash/gbemisolaAssignment.svg",
              ),
            ),
            SizedBox(height: heightSize(20)),
            SizedBox(
              height: heightSize(95),
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset(
                "assets/Teacher_Dash/gbemisolaAssignment.svg",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
