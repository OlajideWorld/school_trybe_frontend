import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/pages/School%20Dashboard/School%20Fees/view/Libraryfeesscreen.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';
import '../widget/schoolfeeswidget2.dart';

class SelectClassManageDues extends StatelessWidget {
  const SelectClassManageDues({super.key});

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
              SizedBox(width: widthSize(77.5)),
              Text(
                'Select class',
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
            top: heightSize(29),
            left: widthSize(30),
            right: widthSize(30),
            bottom: heightSize(30)),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: heightSize(62),
              width: widthSize(368),
              padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
              decoration: BoxDecoration(
                  border: Border.all(color: maincolor),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: const Color.fromRGBO(61, 64, 128, 0.1)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Library fee",
                      style: TextStyle(
                          fontSize: fontSize(16),
                          fontWeight: FontWeight.w400,
                          color: maincolor),
                    ),
                    Text(
                      "₦5,000",
                      style: TextStyle(
                          fontSize: fontSize(16),
                          fontWeight: FontWeight.w400,
                          color: maincolor),
                    )
                  ]),
            ),
            SizedBox(height: heightSize(20)),
            Container(
              height: heightSize(103),
              width: widthSize(368),
              padding: EdgeInsets.only(
                  left: widthSize(20),
                  right: widthSize(20),
                  top: heightSize(19)),
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromRGBO(235, 87, 87, 0.1)),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(235, 87, 87, 0.1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Note",
                    style: TextStyle(
                        fontSize: fontSize(16),
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFEB5757)),
                  ),
                  SizedBox(height: heightSize(5)),
                  Text(
                    "To view the students who have made payments in a particular class, please select the class",
                    style: TextStyle(
                        fontSize: fontSize(16),
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFEB5757)),
                  ),
                ],
              ),
            ),
            SizedBox(height: heightSize(16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SelectClassesWidget(text: "Sss Three"),
                SelectClassesWidget(text: "Sss Two"),
              ],
            ),
            SizedBox(height: heightSize(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SelectClassesWidget(text: "Sss One"),
                SelectClassesWidget(text: "Jss Three"),
              ],
            ),
            SizedBox(height: heightSize(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SelectClassesWidget(text: "Jss Two"),
                SelectClassesWidget(text: "Jss One"),
              ],
            ),
            SizedBox(height: heightSize(20)),
            const SelectClassesWidget(text: "Sss Three"),
            SizedBox(height: heightSize(37)),
            AppButtons(
                textColor: whitecolor,
                fontSize: fontSize(14),
                backgroundColor: maincolor,
                text: "Proceed",
                borderColor: maincolor,
                height: heightSize(60),
                onTap: () => Get.to(() => const LibraryFeesScreenSchool()))
          ]),
        ),
      ),
    );
  }
}
