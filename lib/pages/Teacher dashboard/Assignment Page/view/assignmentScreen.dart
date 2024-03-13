// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/Assignment%20Page/view/selectClass.dart';
import 'package:school_management/pages/Teacher%20dashboard/Submitted%20Assignment/view/submitassignment.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../common/custombottombar.dart';
import '../../../../utils/sizes.dart';
import '../../SIgn-In Page/widget/sign_up_Box.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomBar(),
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
              SizedBox(width: widthSize(94.5)),
              Text(
                'Assignments',
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
            vertical: heightSize(30), horizontal: widthSize(30)),
        child: Column(children: [
          SignupBox(
            image: "assets/Teacher_Dash/booksicon.png",
            header: "Create a new assignment",
            subtext: "Select to create a new assignment",
            onTap: () {
              Get.to(() => const SelectClass());
            },
            subtextSize: 43,
          ),
          SizedBox(height: heightSize(20)),
          SignupBox(
            image: "assets/Teacher_Dash/booksicon.png",
            header: "Submitted assignment",
            subtext: "View submitted assignments",
            onTap: () {
              Get.to(() => const SubmitAssignmentScreen());
            },
            subtextSize: 43,
          )
        ]),
      ),
    );
  }
}
