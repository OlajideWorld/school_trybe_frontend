import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_management/pages/Parent%20DashBoard/Parents%20Events/views/parents_view_events_details.dart';

import '../../../../common/button.dart';
import '../../../../common/custom-text.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../School Dashboard/Admin Events/view/admin_upcoming_events.dart';
import '../../../School Dashboard/home screen/widget/eventsquickview.dart';
import '../../ParentMain/controller/parent_controller.dart';

class ParentsViewEventsList extends StatelessWidget {
  ParentsViewEventsList({super.key});

  ParentsController parentController = ParentsController.instance;

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
              onRefresh: () => parentController.fetchEvents(),
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
                            width: widthSize(92),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          () => parentController.isloadingEvents.value == true
                              ? Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                      height: heightSize(50),
                                      width: widthSize(50),
                                      child: const CircularProgressIndicator(
                                          color: maincolor)),
                                )
                              : parentController.eventsModel.isNotEmpty
                                  ? SizedBox(
                                      height: constraints.maxHeight,
                                      width: constraints.maxWidth,
                                      child: ListView.builder(
                                          // shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: parentController
                                              .eventsModel.length,
                                          itemBuilder: (context, index) {
                                            DateTime yourDate = parentController
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
                                                          ParentsViewEventsDetails(
                                                            eventsModel:
                                                                parentController
                                                                        .eventsModel[
                                                                    index],
                                                          ));
                                                    },
                                                    child: HomeScreenEventsQuickView(
                                                        image: parentController
                                                            .eventsModel[index]
                                                            .image,
                                                        color: parentController
                                                                .eventColors[
                                                            index %
                                                                parentController
                                                                    .eventColors
                                                                    .length],
                                                        height: heightSize(125),
                                                        width: constraints
                                                            .maxWidth,
                                                        text1: parentController
                                                            .eventsModel[index]
                                                            .title,
                                                        text2: parentController
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
                                                    "Currently there no events in the school",
                                                color: Color(0xFF555555),
                                                size: 14,
                                                textAlign: TextAlign.center,
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w400,
                                              ),
                                              SizedBox(height: heightSize(20)),
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
}
