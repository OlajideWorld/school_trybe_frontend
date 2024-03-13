import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/models/event_model.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class UpcomingEvents extends StatelessWidget {
  final EventsModel eventsModel;
  UpcomingEvents({super.key, required this.eventsModel});

  @override
  Widget build(BuildContext context) {
    final hours = eventsModel.startTime.hour.toString().padLeft(2, "0");
    final minutes = eventsModel.startTime.minute.toString().padLeft(2, "0");

    final hours2 = eventsModel.stopTime.hour.toString().padLeft(2, "0");
    final minutes2 = eventsModel.stopTime.minute.toString().padLeft(2, "0");

    DateTime yourDate = eventsModel.date;
    String formattedDate = DateFormat('d MMM y').format(yourDate);

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
              SizedBox(width: widthSize(63.5)),
              Text(
                'Upcoming events',
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
              height: heightSize(273),
              width: widthSize(368),
              child: Image.network(eventsModel.image),
            ),
            SizedBox(height: heightSize(31)),
            SizedBox(
              width: widthSize(368),
              child: Text(
                eventsModel.title,
                style: TextStyle(
                    color: maincolor,
                    fontSize: fontSize(21),
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: heightSize(12.38)),
            SizedBox(
              width: widthSize(207),
              child: Row(children: [
                Icon(
                  Icons.location_on,
                  color: textColor3,
                  size: heightSize(20),
                ),
                SizedBox(width: widthSize(4)),
                Text(
                  "Venue: ${eventsModel.venue}",
                  style: TextStyle(
                      color: maincolor,
                      fontSize: fontSize(18),
                      fontWeight: FontWeight.w600),
                )
              ]),
            ),
            SizedBox(height: heightSize(16.5)),
            SizedBox(
              width: widthSize(368),
              child: Text(
                eventsModel.description,
                style: TextStyle(
                    color: const Color(0xFF555555),
                    fontSize: fontSize(18),
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: heightSize(24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: widthSize(180),
                  child: Row(children: [
                    Icon(
                      Icons.location_on,
                      color: textColor3,
                      size: heightSize(16),
                    ),
                    SizedBox(width: widthSize(7)),
                    Text(
                      "Date: $formattedDate",
                      style: TextStyle(
                          color: maincolor,
                          fontSize: fontSize(14),
                          fontWeight: FontWeight.w600),
                    )
                  ]),
                ),
                SizedBox(
                  width: widthSize(165),
                  child: Row(children: [
                    Icon(
                      Icons.alarm,
                      color: textColor3,
                      size: heightSize(16),
                    ),
                    SizedBox(width: widthSize(7)),
                    Text(
                      "Start time: $hours : $minutes",
                      style: TextStyle(
                          color: maincolor,
                          fontSize: fontSize(14),
                          fontWeight: FontWeight.w600),
                    )
                  ]),
                ),
              ],
            ),

            SizedBox(height: heightSize(11)),
            // 2nd Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: widthSize(180),
                  child: Row(children: [
                    Icon(
                      Icons.location_on,
                      color: textColor3,
                      size: heightSize(16),
                    ),
                    SizedBox(width: widthSize(7)),
                    Text(
                      "Author: Mrs Helen Ogoji",
                      style: TextStyle(
                          color: maincolor,
                          fontSize: fontSize(14),
                          fontWeight: FontWeight.w600),
                    )
                  ]),
                ),
                SizedBox(
                  width: widthSize(165),
                  child: Row(children: [
                    Icon(
                      Icons.alarm,
                      color: textColor3,
                      size: heightSize(16),
                    ),
                    SizedBox(width: widthSize(7)),
                    Text(
                      "End time: $hours2 : $minutes2",
                      style: TextStyle(
                          color: maincolor,
                          fontSize: fontSize(14),
                          fontWeight: FontWeight.w600),
                    )
                  ]),
                ),
              ],
            ),

            SizedBox(height: heightSize(45)),
            AppButtons(
                textColor: whitecolor,
                fontSize: fontSize(14),
                backgroundColor: Colors.red,
                text: "Delete Event",
                borderColor: Colors.red,
                height: heightSize(60),
                onTap: () {}),
          ]),
        ),
      ),
    );
  }
}
