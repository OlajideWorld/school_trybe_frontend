// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/School%20Dashboard/Admin%20Profile%20widgets/widget/accountName_field.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Profile%20Page/widget/accountName_field.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../common/button.dart';
import '../../../../utils/sizes.dart';

class AdminSendAnIssueScreen extends StatelessWidget {
  AdminSendAnIssueScreen({super.key});

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
              top: heightSize(53), left: widthSize(30), right: widthSize(30)),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: heightSize(25),
                  width: widthSize(25),
                  child: Image.asset("assets/Teacher_Dash/issuepage.png"),
                ),
                SizedBox(width: widthSize(5)),
                Text(
                  'Question',
                  style: TextStyle(
                      fontSize: fontSize(14), fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(height: heightSize(20)),
            AdminAccountNameFields(
                header: "Title", hinttext: "Input title", controller: title),
            SizedBox(height: heightSize(20)),
            SizedBox(
              height: heightSize(206),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: heightSize(10)),
                    TextFormField(
                      controller: description,
                      maxLines: 7,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: heightSize(10),
                              left: widthSize(10),
                              right: widthSize(10)),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          hintStyle: TextStyle(
                              fontSize: fontSize(14),
                              fontWeight: FontWeight.w400),
                          hintText: "Tell us your issue"),
                    )
                  ]),
            ),
            SizedBox(height: heightSize(28)),
            AppButtons(
                textColor: whitecolor,
                fontSize: fontSize(14),
                backgroundColor: maincolor,
                text: "Save messages",
                borderColor: maincolor,
                height: heightSize(60),
                onTap: () {})
          ]),
        ),
      ),
    );
  }
}
