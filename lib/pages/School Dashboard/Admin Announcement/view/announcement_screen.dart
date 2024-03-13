import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/School%20Dashboard/Admin%20Announcement/view/all_announcement.dart';
import 'package:school_management/pages/School%20Dashboard/Admin%20Announcement/view/create_announcement.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Announcement/view/teacher_all_announcement.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Announcement/view/teacher_create_announcement.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/SIgn-In Page/widget/sign_up_Box.dart';

class AdminAnnouncemnetScreen extends StatelessWidget {
  const AdminAnnouncemnetScreen({super.key});

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
              SizedBox(width: widthSize(72.5)),
              Text(
                'Announcement',
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
            horizontal: widthSize(30), vertical: heightSize(28)),
        child: Column(
          children: [
            SignupBox(
              image: "assets/Teacher_Dash/announce_logo.png",
              header: "Create a new announcement",
              subtext: "Select to create a new announcement",
              onTap: () {
                Get.to(() => const AdminCreateAnnouncementPage());
              },
              subtextSize: 43,
            ),
            SizedBox(height: heightSize(20)),
            SignupBox(
              image: "assets/Teacher_Dash/announce_logo.png",
              header: "View announcement",
              subtext: "View all announcement",
              onTap: () {
                Get.to(() => AdminAllAnnouncementPage());
              },
              subtextSize: 43,
            ),
          ],
        ),
      ),
    );
  }
}
