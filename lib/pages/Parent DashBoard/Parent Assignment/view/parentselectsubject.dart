import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Parent%20DashBoard/Parent%20Assignment/view/showassignment.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';
import '../widget/Parentselectsubjectwidget.dart';

class ParentAssignmentSubject extends StatelessWidget {
  const ParentAssignmentSubject({super.key});

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
                  width: widthSize(37.5),
                  child: Image.asset("assets/Teacher_Dash/backarrow.png"),
                ),
              ),
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
      body: Padding(
        padding: EdgeInsets.only(
            top: heightSize(29), right: widthSize(30), left: widthSize(30)),
        child: Column(children: [
          GestureDetector(
            onTap: () => Get.to(() => const ParentsSeeAssignmentPage(
                  subject: "Mathematics",
                )),
            child: const ParentSelectSubjectWidget(
              color2: Color.fromRGBO(61, 64, 128, 0.1),
              color: maincolor,
              text: "Mathematics",
              number: 2,
            ),
          ),
          SizedBox(height: heightSize(15)),
          GestureDetector(
            onTap: () => Get.to(() => const ParentsSeeAssignmentPage(
                  subject: "Biology",
                )),
            child: const ParentSelectSubjectWidget(
              color2: Color.fromRGBO(242, 153, 74, 0.1),
              color: textColor3,
              text: "Biology",
              number: 2,
            ),
          ),
          SizedBox(height: heightSize(15)),
          GestureDetector(
            onTap: () => Get.to(() => const ParentsSeeAssignmentPage(
                  subject: "Physics",
                )),
            child: const ParentSelectSubjectWidget(
              color2: Color.fromRGBO(235, 87, 87, 0.1),
              color: Colors.red,
              text: "Physics",
              number: 1,
            ),
          ),
          SizedBox(height: heightSize(15)),
          GestureDetector(
            onTap: () => Get.to(() => const ParentsSeeAssignmentPage(
                  subject: "English language",
                )),
            child: const ParentSelectSubjectWidget(
              color2: Color.fromRGBO(33, 150, 83, 0.1),
              color: Colors.green,
              text: "English language",
              number: 0,
            ),
          ),
          SizedBox(height: heightSize(15)),
          const ParentSelectSubjectWidget(
            color2: Color.fromRGBO(242, 153, 74, 0.1),
            color: textColor3,
            text: "Social studies",
            number: 0,
          ),
        ]),
      ),
    );
  }
}
