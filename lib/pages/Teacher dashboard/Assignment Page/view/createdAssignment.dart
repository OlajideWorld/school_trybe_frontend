// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/alertMessage.dart';
import 'package:school_management/pages/Teacher%20dashboard/Assignment%20Page/view/editassignment.dart';
import 'package:school_management/pages/Teacher%20dashboard/Assignment%20Page/widget/deleteMessage.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';

class CreatedAssignment extends StatelessWidget {
  const CreatedAssignment({super.key});

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
              SizedBox(width: widthSize(49.5)),
              Text(
                'Created assignment',
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
            top: heightSize(30), left: widthSize(30), right: widthSize(30)),
        child: Column(children: [
          GestureDetector(
            onTap: () {
              showoptions(context);
            },
            child: SizedBox(
              height: heightSize(274),
              width: widthSize(368),
              child: Image.asset("assets/Teacher_Dash/dash_create_ass2.png"),
            ),
          ),
          SizedBox(height: heightSize(20)),
          SizedBox(
            height: heightSize(274),
            width: widthSize(368),
            child: Image.asset("assets/Teacher_Dash/dash_create_ass2.png"),
          )
        ]),
      ),
    );
  }

  showoptions(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: SizedBox(
                height: heightSize(70),
                width: widthSize(164),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const EditAssignment());
                      },
                      child: Text(
                        "Edit Assignment",
                        style: TextStyle(
                            fontSize: fontSize(18),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showAlertMessage(
                            context,
                            false,
                            heightSize(380),
                            widthSize(348),
                            "assets/Teacher_Dash/warningicon.png",
                            heightSize(150),
                            const DeleteAssignmentMessage());
                      },
                      child: Text(
                        "Delete Assignment",
                        style: TextStyle(
                            fontSize: fontSize(18),
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                )),
          );
        });
  }
}
