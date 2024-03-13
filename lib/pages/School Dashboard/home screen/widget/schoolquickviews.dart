import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/pages/School%20Dashboard/Admin%20Events/view/admin_event_Screen.dart';
import 'package:school_management/pages/School%20Dashboard/Authorize%20Creation/views/authorize_main_screen.dart';
import 'package:school_management/pages/School%20Dashboard/Manage%20Attendance/views/manage_student_attendance.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../Parent DashBoard/ParentMain/widget/parentquick.dart';
import '../../../Teacher dashboard/Teacher Announcement/view/teacher_announcement_screen.dart';
import '../../Create Student/controller/student_bindings.dart';
import '../../Create Student/view/createstudentscreen.dart';
import '../../Create Teacher/view/createteachermain.dart';
import '../../manage_results/view/admin_manage_results.dart';

class SchoolQuickViewWidget extends StatelessWidget {
  const SchoolQuickViewWidget({super.key});

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
              GestureDetector(
                onTap: () => Get.to(() => const CreateStudentScreen(),
                    binding: StudentBindings()),
                child: const ParentQuickitems(
                  height: 85,
                  width: 60.27,
                  image: "assets/Parents_Dash/svgparent5.svg",
                  text: "Students",
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(() => const AdminEventsScreen()),
                child: const ParentQuickitems(
                  height: 85,
                  width: 64.27,
                  image: "assets/Parents_Dash/svgparent6.svg",
                  text: "Events",
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(() => const AnnouncemnetScreen()),
                child: const ParentQuickitems(
                  height: 88,
                  width: 80,
                  image: "assets/School_Dash/schoolhomeicon3.svg",
                  text: "Announcement",
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(() => const AdminManageResults()),
                child: const ParentQuickitems(
                  height: 85,
                  width: 60.27,
                  image: "assets/Parents_Dash/svgparent4.svg",
                  text: "Results",
                ),
              ),
            ],
          ),
          SizedBox(height: heightSize(40)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                // onTap: () => Get.to(() => const ManageDuesScreen()),
                child: const ParentQuickitems(
                  height: 85,
                  width: 60.27,
                  image: "assets/Parents_Dash/svgparent2.svg",
                  text: "Fees",
                ),
              ),
              const ParentQuickitems(
                width: 64.27,
                height: 85,
                image: "assets/Parents_Dash/svgparent.svg",
                text: "Assignments",
              ),
              GestureDetector(
                child: const ParentQuickitems(
                  height: 85,
                  width: 90,
                  image: "assets/Parents_Dash/svgparent3.svg",
                  text: "Time Table",
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(() => const AdminManageStudentAttendance()),
                child: const ParentQuickitems(
                  height: 85,
                  width: 60.27,
                  image: "assets/Parents_Dash/svgparent7.svg",
                  text: "Attendance",
                ),
              ),
            ],
          ),
          SizedBox(height: heightSize(40)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: const ParentQuickitems(
                  height: 84.88,
                  width: 60.27,
                  image: "assets/School_Dash/svgsubject.svg",
                  text: "Subjects",
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(() => AuthorizeMainScreen()),
                child: const ParentQuickitems(
                  height: 84.88,
                  width: 60.27,
                  image: "assets/School_Dash/authorize.svg",
                  text: "Authorize",
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(() => AdminTeacherMainScreen()),
                child: const ParentQuickitems(
                  height: 84.88,
                  width: 60.27,
                  image: "assets/School_Dash/teachers.svg",
                  text: "Teachers",
                ),
              ),
              GestureDetector(
                child: const ParentQuickitems(
                  height: 92,
                  width: 65.27,
                  image: "assets/School_Dash/parents.svg",
                  text: "Manage Parents",
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
