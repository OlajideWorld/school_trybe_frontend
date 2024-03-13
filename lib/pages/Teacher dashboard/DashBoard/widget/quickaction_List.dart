// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Manage%20Results/views/teacher_results_main_page.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';
import '../../../Parent DashBoard/ParentMain/widget/parentquick.dart';
import '../../Teacher Announcement/view/teacher_announcement_screen.dart';
import '../../Assignment Page/view/selectClass.dart';
import '../../Teacher Events/view/event_Screen.dart';

class QuickActionsListScreen extends StatelessWidget {
  const QuickActionsListScreen({super.key});

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
              SizedBox(width: widthSize(84.5)),
              Text(
                'Quick links',
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
            top: heightSize(43), left: widthSize(30), right: widthSize(30)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    // Get.to(() => const SelectClass());
                  },
                  child: const ParentQuickitems(
                      width: 70,
                      text: "Post Assignments",
                      image: "assets/Parents_Dash/svgparent.svg",
                      height: 100)),
              GestureDetector(
                onTap: () {
                  Get.to(() => const TeacherEventsScreen());
                },
                child: const ParentQuickitems(
                    width: 70,
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
          ),
          SizedBox(height: heightSize(40)),
          const ParentQuickitems(
              width: 60,
              text: "Timetable",
              image: "assets/Teacher_Dash/teachertime.svg",
              height: 85),
        ]),
      ),
    );
  }
}
