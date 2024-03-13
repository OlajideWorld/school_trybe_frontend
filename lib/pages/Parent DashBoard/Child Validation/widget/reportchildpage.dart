import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../common/input_TextField.dart';
import '../../../../utils/sizes.dart';

class ParentsReportChildPage extends StatelessWidget {
  const ParentsReportChildPage({super.key});

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
              SizedBox(width: widthSize(66.5)),
              Text(
                'Report',
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
              top: heightSize(49), left: widthSize(30), right: widthSize(30)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: heightSize(75),
              width: widthSize(75),
              child: Image.asset("assets/Parents_Dash/reportpage.png"),
            ),
            SizedBox(height: heightSize(23)),
            Text(
              "Please send an email to the school administrator indicating that you are unable to locate your child ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: fontSize(16),
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF555555)),
            ),
            SizedBox(height: heightSize(64)),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Full name",
                style: TextStyle(
                    fontSize: fontSize(14),
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF555555)),
              ),
            ),
            SizedBox(height: heightSize(10)),
            SizedBox(
              height: heightSize(65),
              child: const InputTextField(
                obscureText: false,
                textInputAction: true,
                hintText: "Input your first name",
              ),
            ),

            //
            SizedBox(height: heightSize(20)),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Email address",
                style: TextStyle(
                    fontSize: fontSize(14),
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF555555)),
              ),
            ),
            SizedBox(height: heightSize(10)),
            SizedBox(
              height: heightSize(65),
              child: const InputTextField(
                obscureText: false,
                textInputAction: true,
                hintText: " e.g neilsonmike14@gmail.com",
              ),
            ),

            //
            SizedBox(height: heightSize(20)),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Report",
                style: TextStyle(
                    fontSize: fontSize(14),
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF555555)),
              ),
            ),
            SizedBox(height: heightSize(10)),
            SizedBox(
                height: heightSize(114),
                child: TextFormField(
                  validator: (String? val) {
                    if (val!.isEmpty) {
                      return "Please enter your Home Address";
                    }
                  },
                  maxLines: 15,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: maincolor)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: maincolor)),
                      hintStyle: TextStyle(
                          fontSize: fontSize(14), fontWeight: FontWeight.w400),
                      hintText: "Your report here"),
                )),
            SizedBox(height: heightSize(30)),
            Container(
              height: heightSize(60),
              width: widthSize(308),
              decoration: const BoxDecoration(
                  color: maincolor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                  child: Text("Send",
                      style: TextStyle(
                          color: whitecolor,
                          fontSize: fontSize(14),
                          fontWeight: FontWeight.w600))),
            ),
          ]),
        ),
      ),
    );
  }
}
