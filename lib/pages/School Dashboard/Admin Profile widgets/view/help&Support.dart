// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/School%20Dashboard/Admin%20Profile%20widgets/view/sendAnIssue.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Profile%20Page/view/sendAnIssue.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Profile%20Page/widget/supportContainer.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../widget/supportContainer.dart';

class AdminHelpAndSupportScreen extends StatelessWidget {
  const AdminHelpAndSupportScreen({super.key});

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
                'Help & Support',
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
            top: heightSize(36), left: widthSize(30), right: widthSize(30)),
        child: Column(children: [
          GestureDetector(
            onTap: () {
              Get.to(() => AdminSendAnIssueScreen());
            },
            child: const AdminHelpAndSupportWidget(
                image: "assets/Teacher_Dash/support1.png",
                text: "Contact customer support"),
          ),
          SizedBox(height: heightSize(20)),
          const AdminHelpAndSupportWidget(
              image: "assets/Teacher_Dash/support2.png",
              text: "Chat us on whatsapp"),
          SizedBox(height: heightSize(20)),
          const AdminHelpAndSupportWidget(
              image: "assets/Teacher_Dash/support3.png",
              text: "Chat us on facebook"),
          SizedBox(height: heightSize(20)),
          const AdminHelpAndSupportWidget(
              image: "assets/Teacher_Dash/support4.png",
              text: "Chat us on Instagram"),
          SizedBox(height: heightSize(20)),
          const AdminHelpAndSupportWidget(
              image: "assets/Teacher_Dash/support5.png",
              text: "Chat us on twitter"),
          SizedBox(height: heightSize(20)),
        ]),
      ),
    );
  }
}
