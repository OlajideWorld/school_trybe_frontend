// ignore_for_file: file_names

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:school_management/common/button.dart";
import "package:school_management/pages/School%20Dashboard/Create%20Student/controller/student_bindings.dart";
import "package:school_management/pages/School%20Dashboard/manage_results/view/admin_select_class.dart";

import "package:school_management/utils/colors.dart";

import "../../../../utils/sizes.dart";
import "../../../Teacher dashboard/SIgn-In Page/widget/sign_up_Box.dart";

class AdminManageResults extends StatelessWidget {
  const AdminManageResults({super.key});

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
              SizedBox(width: widthSize(111.5)),
              Text(
                'Results',
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
            top: heightSize(38), left: widthSize(30), right: widthSize(30)),
        child: Column(children: [
          SignupBox(
            image: "assets/Teacher_Dash/resultsimage.png",
            header: "Upload results",
            subtext: "Select to upload a student result",
            onTap: () {
              Get.to(() => AdminSelectClassScreen(isManage: false));
            },
            subtextSize: 43,
          ),
          SizedBox(height: heightSize(20)),
          SignupBox(
            image: "assets/Teacher_Dash/resultsimage.png",
            header: "Manage results",
            subtext: "Select to manage all results posted by you",
            onTap: () {
              Get.to(() => AdminSelectClassScreen(isManage: true));
            },
            subtextSize: 63,
          ),
        ]),
      ),
    );
  }
}
