import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/pages/Parent%20DashBoard/ParentMain/widget/parentquick.dart';
import 'package:school_management/pages/Parent%20DashBoard/Parents%20Events/views/parents_view_events.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/Teacher Events/view/upcoming_events.dart';
import '../../../Teacher dashboard/Teacher Events/view/viewEvents.dart';
import '../../Announcement Page/view/annoucementPage.dart';
import '../../Parent Assignment/view/parentassignment.dart';
import '../../Results/view/resultsSelect.dart';
import '../../Teachers Profile/view/select_child_teacher.dart';

class ParentQuickViewAll extends StatelessWidget {
  const ParentQuickViewAll({super.key});

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
                  child: backbutton()),
              SizedBox(width: widthSize(66.5)),
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
        padding: EdgeInsets.symmetric(
            horizontal: widthSize(30), vertical: heightSize(49)),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ParentQuickitems(
                height: 85,
                width: 60.27,
                image: "assets/Parents_Dash/svgparent2.svg",
                text: "Pay Fees",
              ),
              const ParentQuickitems(
                height: 85,
                width: 64.27,
                image: "assets/Parents_Dash/svgparent3.svg",
                text: "Time Table",
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => ParentsCheckREsults());
                },
                child: const ParentQuickitems(
                  height: 85,
                  width: 60.27,
                  image: "assets/Parents_Dash/svgparent4.svg",
                  text: "Results",
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Get.to(() => ParentTeacherProfile());
                },
                child: const ParentQuickitems(
                  height: 85,
                  width: 60.27,
                  image: "assets/Parents_Dash/svgparent5.svg",
                  text: "Teachers",
                ),
              ),
            ],
          ),
          SizedBox(height: heightSize(40)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.to(() => ParentsViewEventsList()),
                child: const ParentQuickitems(
                  height: 85,
                  width: 60.27,
                  image: "assets/Parents_Dash/svgparent6.svg",
                  text: "Events",
                ),
              ),
              const ParentQuickitems(
                width: 64.27,
                height: 85,
                image: "assets/Parents_Dash/svgparent7.svg",
                text: "Attendance",
              ),
              GestureDetector(
                onTap: () => Get.to(() => ParentAnnouncementPage()),
                child: const ParentQuickitems(
                  height: 85,
                  width: 90,
                  image: "assets/Parents_Dash/svgparent8.svg",
                  text: "Announcement",
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(() => const ParentAssignmentPage()),
                child: const ParentQuickitems(
                  height: 85,
                  width: 80,
                  image: "assets/Parents_Dash/svgparent.svg",
                  text: "Assignments",
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
