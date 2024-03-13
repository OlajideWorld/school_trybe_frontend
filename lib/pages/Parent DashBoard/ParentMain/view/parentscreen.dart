// ignore_for_file: invalid_use_of_protected_member, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_management/pages/Parent%20DashBoard/Parent%20Assignment/view/parentassignment.dart';

import '../../../../common/custom-text.dart';
import '../../../../common/parentsCustomBottomBar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../School Dashboard/home screen/widget/eventsquickview.dart';
import '../../../Teacher dashboard/SIgn-In Page/controller/registrationController.dart';
import '../../Results/view/resultsSelect.dart';
import '../controller/parent_controller.dart';
import '../widget/parentchildrenview.dart';
import '../widget/parentquick.dart';
import '../widget/parentsquickviewall.dart';

class ParentHomePage extends StatelessWidget {
  ParentHomePage({super.key});

  final RegistrationController controller = RegistrationController.instance;
  ParentsController parentController = ParentsController.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: const ParentCustomBottomBar(),
        backgroundColor: whitecolor,
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Obx(() {
              return RefreshIndicator(
                onRefresh: () async {
                  final model = {
                    "ids": regcontroller.parentModel.value.childrenId
                  };
                  await parentController.fetchEvents();
                  await parentController.fetchStudentswithIdList2(model);
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(children: [
                    ParentsHomeAppBarWidget(),
                    SizedBox(height: heightSize(30)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Children",
                            style: TextStyle(
                                color: Color(0xFF555555),
                                fontSize: fontSize(16),
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                                color: maincolor,
                                fontSize: fontSize(14),
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: heightSize(10)),

                    parentController.isloading.value == true
                        ? Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                                height: heightSize(50),
                                width: widthSize(50),
                                child: const CircularProgressIndicator(
                                    color: maincolor)),
                          )
                        : parentController.studentListFromIds.value.isNotEmpty
                            ? SizedBox(
                                height: heightSize(260),
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: parentController
                                        .studentListFromIds.value.length,
                                    itemBuilder: (context, index) {
                                      var data = parentController
                                          .studentListFromIds.value[index];
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            left: widthSize(20)),
                                        child: Row(
                                          children: [
                                            ParentChildrenView(
                                              model: data,
                                              color: maincolor,
                                            ),
                                            SizedBox(width: widthSize(15))
                                          ],
                                        ),
                                      );
                                    }),
                              )
                            : Padding(
                                padding: EdgeInsets.only(
                                    top: heightSize(30),
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
                                            "assets/School_Dash/emptyStudents.png",
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        SizedBox(height: heightSize(20)),
                                        const CText(
                                          text: "No Children",
                                          color: Color(0xFF222222),
                                          size: 20,
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(height: heightSize(20)),
                                        const CText(
                                          text:
                                              "Currently your chidren have not been registeered yet, please inform the admin to register them ",
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

                    SizedBox(height: heightSize(30)),
                    Container(
                      height: heightSize(170),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                          top: heightSize(11),
                          right: widthSize(30),
                          left: widthSize(30)),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE6E6E6)),
                        color: whitecolor,
                      ),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Quick actions",
                              style: TextStyle(
                                  color: const Color(0xFF555555),
                                  fontSize: fontSize(15),
                                  fontWeight: FontWeight.w600),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  Get.to(() => const ParentQuickViewAll()),
                              child: Text(
                                "See all",
                                style: TextStyle(
                                    color: maincolor,
                                    fontSize: fontSize(14),
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: heightSize(15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  Get.to(() => const ParentAssignmentPage()),
                              child: const ParentQuickitems(
                                height: 85,
                                width: 75,
                                image: "assets/Parents_Dash/svgparent.svg",
                                text: "Assignment",
                              ),
                            ),
                            const ParentQuickitems(
                              height: 85,
                              width: 60.27,
                              image: "assets/Parents_Dash/svgparent2.svg",
                              text: "Pay Fees",
                            ),
                            const ParentQuickitems(
                              height: 85,
                              width: 64,
                              image: "assets/Parents_Dash/svgparent3.svg",
                              text: "Time Table",
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => ParentsCheckREsults());
                              },
                              child: const ParentQuickitems(
                                height: 85,
                                width: 60.27,
                                image: "assets/Parents_Dash/svgparent4.svg",
                                text: "Results",
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                    SizedBox(height: heightSize(22)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Upcoming events",
                            style: TextStyle(
                                color: const Color(0xFF555555),
                                fontSize: fontSize(15),
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                                color: maincolor,
                                fontSize: fontSize(14),
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: heightSize(15)),

                    parentController.isloadingEvents.value == true
                        ? Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                                height: heightSize(50),
                                width: widthSize(50),
                                child: const CircularProgressIndicator(
                                    color: maincolor)),
                          )
                        : parentController.eventsModel.value.isNotEmpty
                            ? SizedBox(
                                height: heightSize(415),
                                width: constraints.maxWidth,
                                child: ListView.builder(
                                    // shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        parentController.eventsModel.length,
                                    itemBuilder: (context, index) {
                                      DateTime yourDate = parentController
                                          .eventsModel[index].date;
                                      String formattedDate =
                                          DateFormat('d MMM y')
                                              .format(yourDate);

                                      return SizedBox(
                                        child: Column(
                                          children: [
                                            HomeScreenEventsQuickView(
                                                image: parentController
                                                    .eventsModel[index].image,
                                                color: parentController
                                                        .eventColors[
                                                    index %
                                                        parentController
                                                            .eventColors
                                                            .length],
                                                height: heightSize(125),
                                                width: constraints.maxWidth,
                                                text1: parentController
                                                    .eventsModel[index].title,
                                                text2: parentController
                                                    .eventsModel[index]
                                                    .description
                                                    .tr,
                                                text3: "Date : $formattedDate",
                                                textColor: textColor),
                                            SizedBox(height: heightSize(20))
                                          ],
                                        ),
                                      );
                                    }),
                              )
                            : Padding(
                                padding: EdgeInsets.only(
                                    top: heightSize(30),
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
                                            fit: BoxFit.contain,
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
                                      ]),
                                ),
                              ),
                    // const HomeScreenEventsQuickView(
                    //   image: "",
                    //   color: Color(0xFFE7E7F3),
                    //   height: 125,
                    //   width: 368,
                    //   text1: "Sport day activities",
                    //   text2:
                    //       "Lorem ipsum dolor sit amet consectetur. Quam ut ut tellus urna. Nunc gravida ante nisl morbi ut inte",
                    //   text3: "Date : 12th May 2023",
                    //   textColor: maincolor,
                    // ),
                    // SizedBox(height: heightSize(20)),
                    // const HomeScreenEventsQuickView(
                    //   image: "",
                    //   color: Color(0xFFE2F9EB),
                    //   height: 125,
                    //   width: 368,
                    //   text1: "Sport day activities",
                    //   text2:
                    //       "Lorem ipsum dolor sit amet consectetur. Quam ut ut tellus urna. Nunc gravida ante nisl morbi ut inte",
                    //   text3: "Date : 12th May 2023",
                    //   textColor: Color(0xFF17693A),
                    // ),
                    // SizedBox(height: heightSize(20)),
                    // const HomeScreenEventsQuickView(
                    //   image: "",
                    //   color: Color(0xFFFAEBBD),
                    //   height: 125,
                    //   width: 368,
                    //   text1: "Sport day activities",
                    //   text2:
                    //       "Lorem ipsum dolor sit amet consectetur. Quam ut ut tellus urna. Nunc gravida ante nisl morbi ut inte",
                    //   text3: "Date : 12th May 2023",
                    //   textColor: Color(0xFF695108),
                    // ),
                  ]),
                ),
              );
            }),
          );
        }),
      ),
    );
  }
}
