import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/button.dart';
import '../../../../models/announce_model.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class ParentsViewAnnouncementDetails extends StatelessWidget {
  final AnnounceModel mymodel;
  const ParentsViewAnnouncementDetails({super.key, required this.mymodel});

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
          ]),
        ),
      ),
    );
  }
}
