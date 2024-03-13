import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/models/announce_model.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../../common/alertMessage.dart';
import '../../../Teacher dashboard/Teacher Events/widget/eventsWarning.dart';

class AdminViewAnnouncementPage extends StatelessWidget {
  final AnnounceModel mymodel;
  const AdminViewAnnouncementPage({super.key, required this.mymodel});

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
            SizedBox(height: heightSize(58)),
            AppButtons(
                textColor: backgroundColor,
                fontSize: fontSize(14),
                backgroundColor: Color(0xFFEB5757),
                text: "Delete announcement",
                borderColor: Color(0xFFEB5757),
                height: heightSize(63),
                onTap: () {
                  showAlertMessage(
                      context,
                      false,
                      heightSize(420),
                      widthSize(350),
                      'assets/Teacher_Dash/warningicon.png',
                      heightSize(152),
                      AnnounceWarning(
                        id: mymodel.id,
                      ));
                }),
            SizedBox(height: heightSize(58)),
          ]),
        ),
      ),
    );
  }
}
