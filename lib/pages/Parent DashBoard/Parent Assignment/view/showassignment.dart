import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Parent%20DashBoard/Parent%20Assignment/controller/parentsassignmentcon.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../widget/parentstatuswidget.dart';

class ParentsSeeAssignmentPage extends StatefulWidget {
  final String subject;
  const ParentsSeeAssignmentPage({super.key, required this.subject});

  @override
  State<ParentsSeeAssignmentPage> createState() =>
      _ParentsSeeAssignmentPageState();
}

class _ParentsSeeAssignmentPageState extends State<ParentsSeeAssignmentPage> {
  final controller = Get.put(ParentsAssignmentController());
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
              SizedBox(width: widthSize(52.5)),
              Text(
                '${widget.subject} Assignments',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: fontSize(20),
                    fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
              top: heightSize(35), right: widthSize(30), left: widthSize(30)),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.assignmentStatus = AssignmentStatus.all;
                    });
                  },
                  child: Container(
                    height: heightSize(60),
                    width: widthSize(116),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: backgroundColor2),
                        borderRadius: BorderRadius.circular(widthSize(10)),
                        color:
                            controller.assignmentStatus == AssignmentStatus.all
                                ? textColor3
                                : backgroundColor3),
                    child: Text(
                      "All",
                      style: TextStyle(
                          color: controller.assignmentStatus ==
                                  AssignmentStatus.all
                              ? whitecolor
                              : const Color(0xFF9E9E9E)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.assignmentStatus = AssignmentStatus.submitted;
                    });
                  },
                  child: Container(
                    height: heightSize(60),
                    width: widthSize(116),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: backgroundColor2),
                        borderRadius: BorderRadius.circular(widthSize(10)),
                        color: controller.assignmentStatus ==
                                AssignmentStatus.submitted
                            ? textColor3
                            : backgroundColor3),
                    child: Text(
                      "Submitted",
                      style: TextStyle(
                          color: controller.assignmentStatus ==
                                  AssignmentStatus.submitted
                              ? whitecolor
                              : const Color(0xFF9E9E9E)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.assignmentStatus = AssignmentStatus.pending;
                    });
                  },
                  child: Container(
                    height: heightSize(60),
                    width: widthSize(116),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: backgroundColor2),
                        borderRadius: BorderRadius.circular(widthSize(10)),
                        color: controller.assignmentStatus ==
                                AssignmentStatus.pending
                            ? textColor3
                            : backgroundColor3),
                    child: Text(
                      "Pending",
                      style: TextStyle(
                          color: controller.assignmentStatus ==
                                  AssignmentStatus.pending
                              ? whitecolor
                              : const Color(0xFF9E9E9E)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: heightSize(36)),
            if (controller.assignmentStatus == AssignmentStatus.all)
              const ParentAssignmentStatus1(),
            if (controller.assignmentStatus == AssignmentStatus.submitted)
              const ParentAssignmentStatus2(),
            if (controller.assignmentStatus == AssignmentStatus.pending)
              const ParentAssignmentStatus3()
          ]),
        ),
      ),
    );
  }
}
