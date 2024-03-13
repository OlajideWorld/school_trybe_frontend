// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_management/common/alertMessage.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/pages/School%20Dashboard/Admin%20Events/view/admin_createEvents.dart';
import 'package:school_management/pages/School%20Dashboard/Admin%20Events/view/admin_upcoming_events.dart';

import '../../../../common/custom-text.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../home screen/controller/adminController.dart';
import '../../home screen/widget/eventsquickview.dart';

class AdminViewEventsScreen extends StatelessWidget {
  AdminViewEventsScreen({super.key});

  final AdminController adminController = AdminController.instance;

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
              SizedBox(width: widthSize(114.5)),
              Text(
                'Events',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: fontSize(20),
                    fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: RefreshIndicator(
              onRefresh: () => adminController.fetchEvents(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: heightSize(28),
                      left: widthSize(30),
                      right: widthSize(25)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: heightSize(22),
                            width: constraints.maxWidth,
                            child: Row(
                              children: [
                                Text(
                                  "All events",
                                  style: TextStyle(
                                      fontSize: fontSize(18),
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: heightSize(24),
                                  color: textColor,
                                )
                              ],
                            )),
                        SizedBox(height: heightSize(21)),
                        Obx(
                          () => adminController.isloadingEvents.value == true
                              ? Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                      height: heightSize(50),
                                      width: widthSize(50),
                                      child: const CircularProgressIndicator(
                                          color: maincolor)),
                                )
                              : adminController.eventsModel.isNotEmpty
                                  ? SizedBox(
                                      height: constraints.maxHeight,
                                      width: constraints.maxWidth,
                                      child: ListView.builder(
                                          // shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: adminController
                                              .eventsModel.length,
                                          itemBuilder: (context, index) {
                                            DateTime yourDate = adminController
                                                .eventsModel[index].date;
                                            String formattedDate =
                                                DateFormat('d MMM y')
                                                    .format(yourDate);

                                            return SizedBox(
                                              child: Column(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.to(() =>
                                                          AdminUpcomingEvents(
                                                            eventsModel:
                                                                adminController
                                                                        .eventsModel[
                                                                    index],
                                                          ));
                                                    },
                                                    child: HomeScreenEventsQuickView(
                                                        image: adminController
                                                            .eventsModel[index]
                                                            .image,
                                                        color: adminController
                                                                .eventColors[
                                                            index %
                                                                adminController
                                                                    .eventColors
                                                                    .length],
                                                        height: heightSize(125),
                                                        width: constraints
                                                            .maxWidth,
                                                        text1: adminController
                                                            .eventsModel[index]
                                                            .title,
                                                        text2: adminController
                                                            .eventsModel[index]
                                                            .description
                                                            .tr,
                                                        text3:
                                                            "Date : $formattedDate",
                                                        textColor: textColor),
                                                  ),
                                                  SizedBox(
                                                      height: heightSize(20))
                                                ],
                                              ),
                                            );
                                          }),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.only(
                                          top: heightSize(94),
                                          left: widthSize(20),
                                          right: widthSize(20)),
                                      child: SizedBox(
                                        width: constraints.maxWidth,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: constraints.maxWidth,
                                                height: heightSize(258.67),
                                                child: Image.asset(
                                                  "assets/School_Dash/emptyEvents.png",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              SizedBox(height: heightSize(20)),
                                              const CText(
                                                text: "No Events",
                                                color: Color(0xFF222222),
                                                size: 20,
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w600,
                                              ),
                                              SizedBox(height: heightSize(20)),
                                              const CText(
                                                text:
                                                    "Currently there are no events in the school",
                                                color: Color(0xFF555555),
                                                size: 14,
                                                textAlign: TextAlign.center,
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w400,
                                              ),
                                              SizedBox(height: heightSize(20)),
                                              GestureDetector(
                                                onTap: () => Get.to(() =>
                                                    const AdminCreateEventsScreen()),
                                                child: Container(
                                                  height: heightSize(60),
                                                  width: widthSize(114),
                                                  alignment: Alignment.center,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.white,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: const BorderSide(
                                                          width: 1,
                                                          color: Color(
                                                              0xFFD9D9D9)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2200),
                                                    ),
                                                  ),
                                                  child: const CText(
                                                    text: "Create",
                                                    color: Color(0xFF222222),
                                                    size: 16,
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              )
                                            ]),
                                      ),
                                    ),
                        ),
                      ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  showoptions(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: SizedBox(
                height: heightSize(64),
                width: widthSize(131),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Delete this event",
                        style: TextStyle(
                            fontSize: fontSize(18),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => AdminCreateEventsScreen());
                      },
                      child: Text(
                        "Edit this event",
                        style: TextStyle(
                            fontSize: fontSize(18),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )),
          );
        });
  }

  Widget popOptions(BuildContext context) {
    return PopupMenuButton(
        color: whitecolor,
        onSelected: (value) {
          if (value == 1) {
            showAlertMessage(
                context,
                false,
                heightSize(420),
                widthSize(350),
                'assets/Teacher_Dash/warningicon.png',
                heightSize(152),
                Container()
                // const EventsWarning(),
                );
          }
          if (value == 2) {
            Get.to(() => AdminCreateEventsScreen());
          }
        },
        itemBuilder: (context) => [
              PopupMenuItem(
                  value: 1,
                  child: Text(
                    "Delete this Event",
                    style: TextStyle(
                        fontSize: fontSize(16), fontWeight: FontWeight.w600),
                  )),
              PopupMenuItem(
                  value: 2,
                  child: Text(
                    "Edit this Event",
                    style: TextStyle(
                        fontSize: fontSize(16), fontWeight: FontWeight.w600),
                  )),
            ]);
  }
}
