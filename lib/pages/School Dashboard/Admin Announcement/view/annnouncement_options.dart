import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/alertMessage.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Announcement/widget/announce_warning.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';

class AnnouncementOptions extends StatelessWidget {
  const AnnouncementOptions({super.key});

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
      body: Padding(
        padding: EdgeInsets.only(
            top: heightSize(32), left: widthSize(30), right: widthSize(30)),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
                height: heightSize(244),
                width: widthSize(368),
                child: Image.asset("assets/Teacher_Dash/AnnounceImage.png")),
            SizedBox(height: heightSize(21)),
            SizedBox(
              width: widthSize(368),
              child: Text(
                'All graduation students are to pay their uniforms',
                style: TextStyle(
                    color: maincolor,
                    fontSize: fontSize(21),
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: heightSize(10)),
            SizedBox(
              width: widthSize(368),
              child: Text(
                'Lorem ipsum dolor sit amet consectetur. A quam sed in consequat vestibulum. Odio in enim aliquam auctor sit vitae ultrices tortor tortor. Varius fermentum mauris quis volutpat. Gravida dapibus urna rhoncus vitae eu. Id sit ipsum'
                'scelerisque risus sit suspendisse enim. Augue mauris morbi enim diam sit neque arcu magna dignissim. Sit quam eleifend in nulla. Nisi mauris tellus orci quam odio sapien. Pellentesque dignissim elementum amet faucibus.us sit suspe'
                'ndisse enim. Augue mauris morbi enim diam sit neque arcu magna dignissim. Sit quam eleifend in nulla. Nisi mauris tellus orci quam odio sapien. Pellen',
                style: TextStyle(
                    color: const Color(0xFF555555),
                    fontSize: fontSize(18),
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: heightSize(19.5)),
            SizedBox(
              width: widthSize(163),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: textColor3,
                      size: heightSize(16),
                    ),
                    Text(
                      "25 May 2023 8:30pm",
                      style: TextStyle(
                          fontSize: fontSize(14), fontWeight: FontWeight.w600),
                    )
                  ]),
            ),
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
            SizedBox(height: heightSize(26)),
            AppButtons(
                textColor: whitecolor,
                fontSize: fontSize(14),
                backgroundColor: Colors.red,
                text: "Delete announcement",
                borderColor: Colors.red,
                height: heightSize(63),
                onTap: () {
                  showAlertMessage(
                      context,
                      false,
                      heightSize(365),
                      widthSize(350),
                      "assets/Teacher_Dash/warningicon.png",
                      heightSize(152),
                      const AnnouncementWarning());
                }),
            SizedBox(height: heightSize(15)),
            AppButtons(
                textColor: maincolor,
                fontSize: fontSize(14),
                backgroundColor: whitecolor,
                text: "Edit announcement",
                borderColor: maincolor,
                height: heightSize(63),
                onTap: () {})
          ]),
        ),
      ),
    );
  }
}
