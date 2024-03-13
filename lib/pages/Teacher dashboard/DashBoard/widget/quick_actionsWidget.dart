// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Parent%20DashBoard/ParentMain/widget/parentquick.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Announcement/view/teacher_announcement_screen.dart';
import 'package:school_management/pages/Teacher%20dashboard/DashBoard/widget/quickaction_List.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Events/view/event_Screen.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Manage%20Results/views/teacher_results_main_page.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../../Assignment Page/view/selectClass.dart';

class QuickActionsWidget extends StatelessWidget {
  const QuickActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: heightSize(22), horizontal: widthSize(30)),
      decoration: BoxDecoration(border: Border.all(color: colors1)),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Quick actions",
                style: TextStyle(
                    color: textcolor4,
                    fontSize: fontSize(15),
                    fontWeight: FontWeight.w600)),
            GestureDetector(
              onTap: () {
                Get.to(() => const QuickActionsListScreen());
              },
              child: Text(
                "See all",
                style: TextStyle(
                    color: maincolor,
                    fontSize: fontSize(14),
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
        SizedBox(height: heightSize(15)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  // Get.to(() => const SelectClass());
                },
                child: const ParentQuickitems(
                    width: 85,
                    text: "Post Assignments",
                    image: "assets/Parents_Dash/svgparent.svg",
                    height: 93)),
            GestureDetector(
              onTap: () {
                Get.to(() => const TeacherEventsScreen());
              },
              child: const ParentQuickitems(
                  width: 60,
                  text: "Create Events",
                  image: "assets/Parents_Dash/svgparent6.svg",
                  height: 100),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const AnnouncemnetScreen());
              },
              child: const ParentQuickitems(
                  width: 90,
                  text: "Make Announcement",
                  image: "assets/Teacher_Dash/teacherAnnounce.svg",
                  height: 100),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => TeacherResultsMainPage());
              },
              child: const ParentQuickitems(
                  width: 60,
                  text: "Post Results",
                  image: "assets/Parents_Dash/svgparent4.svg",
                  height: 100),
            )
          ],
        )
      ]),
    );
  }
}
