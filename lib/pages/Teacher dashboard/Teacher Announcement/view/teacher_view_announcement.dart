import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/models/announce_model.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

class ViewAnnouncementPage extends StatelessWidget {
  final AnnounceModel mymodel;
  const ViewAnnouncementPage({super.key, required this.mymodel});

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
                'Announcements',
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
              top: heightSize(32), left: widthSize(30), right: widthSize(30)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
                height: heightSize(244),
                width: widthSize(368),
                child: Image.network(mymodel.image)),
            SizedBox(height: heightSize(20)),
            SizedBox(
              height: heightSize(250),
              width: widthSize(368),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: widthSize(368),
                    child: Text(
                      mymodel.title,
                      style: TextStyle(
                          color: maincolor,
                          fontSize: fontSize(21),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: heightSize(20)),
                  Expanded(
                    child: Text(
                      mymodel.details,
                      style: TextStyle(
                          color: const Color(0xFF555555),
                          fontSize: fontSize(18),
                          // height: fontSize(0.12),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: heightSize(19.5)),
            // SizedBox(
            //   width: widthSize(163),
            //   child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Icon(
            //           Icons.calendar_month,
            //           color: textColor3,
            //           size: heightSize(16),
            //         ),
            //         Text(
            //           "25 May 2023 8:30pm",
            //           style: TextStyle(
            //               fontSize: fontSize(14), fontWeight: FontWeight.w600),
            //         )
            //       ]),
            // ),
            SizedBox(height: heightSize(21)),
            SizedBox(
              width: widthSize(163),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.person,
                      color: textColor3,
                      size: heightSize(16),
                    ),
                    Text(
                      "Author: Ms.Helen Oto",
                      style: TextStyle(
                          fontSize: fontSize(14), fontWeight: FontWeight.w600),
                    )
                  ]),
            ),
            SizedBox(height: heightSize(58)),
            AppButtons(
                textColor: backgroundColor,
                fontSize: fontSize(14),
                backgroundColor: Color(0xFFEB5757),
                text: "Delete announcement",
                borderColor: Color(0xFFEB5757),
                height: heightSize(63),
                onTap: () {}),
            SizedBox(height: heightSize(58)),
          ]),
        ),
      ),
    );
  }
}
