import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_management/common/custom-text.dart';
import 'package:school_management/common/custombottombar.dart';
import 'package:school_management/pages/Teacher%20dashboard/DashBoard/view/sortstudents.dart';
import 'package:school_management/pages/Teacher%20dashboard/DashBoard/widget/quick_actionsWidget.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../../utils/colors.dart';
import '../../../School Dashboard/Create Student/view/inputstudentfields.dart';
import '../../../School Dashboard/home screen/widget/eventsquickview.dart';
import '../../../School Dashboard/home screen/widget/schooladminhomewidget.dart';
import '../../Teacher Events/view/createEvents.dart';
import '../../Teacher Events/view/viewEvents.dart';
import '../controller/teacher_controller.dart';
import '../widget/home_appBar.dart';
import '../widget/teacherhomewidget.dart';

class TeacherDashBoard extends StatelessWidget {
  TeacherDashBoard({super.key});

  final TeacherController teacherController = TeacherController.instance;
  final RegistrationController controller = RegistrationController.instance;

  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit School App'),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), //<-- SEE HERE
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: maincolor)),
                    child: const Text(
                      'No',
                      style: TextStyle(color: maincolor),
                    )),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(true), // <-- SEE HERE
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey)),
                    child: const Text('Yes')),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: const CustomBottomBar(),
        backgroundColor: whitecolor,
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: RefreshIndicator(
              onRefresh: () async {
                String id = controller.teachermodel.value.id;
                debugPrint(id);
                await controller.fetchTeachersDetails(id);
                await teacherController.fetchAllStudents();
                await teacherController.fetchEvents();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Obx(() {
                  return SizedBox(
                    child: Column(
                      children: [
                        SchoolAdminHomewidget(
                          image: controller.teachermodel.value.image,
                          name:
                              "${controller.teachermodel.value.firstname} ${controller.teachermodel.value.lastName}",
                          schoolName: controller.teachermodel.value.schoolName,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: widthSize(30),
                              right: widthSize(30),
                              top: heightSize(24)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Class students",
                                  style: TextStyle(
                                      color: textcolor4,
                                      fontSize: fontSize(16),
                                      fontWeight: FontWeight.w600)),
                              GestureDetector(
                                // onTap: () {
                                //   Get.to(() => const SortStudent());
                                // },
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
                        ),
                        SizedBox(height: heightSize(10)),
                        teacherController.isloadingStudents.value == true
                            ? Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                    height: heightSize(50),
                                    width: widthSize(50),
                                    child: const CircularProgressIndicator(
                                        color: maincolor)),
                              )
                            : teacherController.studentModel.isNotEmpty
                                ? SizedBox(
                                    height: heightSize(200),
                                    width: constraints.maxWidth,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: teacherController
                                            .studentModel.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                left: widthSize(30)),
                                            child: SizedBox(
                                              child: Row(
                                                children: [
                                                  teachershowStudentwidget(
                                                      teacherController
                                                          .studentModel[index]),
                                                  SizedBox(width: widthSize(10))
                                                ],
                                              ),
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
                                                "assets/School_Dash/emptyStudents.png",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            SizedBox(height: heightSize(20)),
                                            const CText(
                                              text: "No Students",
                                              color: Color(0xFF222222),
                                              size: 20,
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w600,
                                            ),
                                            SizedBox(height: heightSize(20)),
                                            const CText(
                                              text:
                                                  "You currently have no students in this class tap “Create” to create a student.",
                                              color: Color(0xFF555555),
                                              size: 14,
                                              textAlign: TextAlign.center,
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w400,
                                            ),
                                            SizedBox(height: heightSize(20)),
                                            GestureDetector(
                                              onTap: () => Get.to(
                                                  () => InputStudentFIeldsInfo(
                                                        type: "Create student",
                                                      )),
                                              child: Container(
                                                height: heightSize(60),
                                                width: widthSize(114),
                                                alignment: Alignment.center,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                        width: 1,
                                                        color:
                                                            Color(0xFFD9D9D9)),
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
                        SizedBox(height: heightSize(23)),
                        const QuickActionsWidget(),
                        SizedBox(height: heightSize(21)),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: widthSize(30)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Upcoming events",
                                      style: TextStyle(
                                          color: textcolor4,
                                          fontSize: fontSize(15),
                                          fontWeight: FontWeight.w600)),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => TeacherViewEventsScreen());
                                    },
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
                              teacherController.isloadingEvents.value == true
                                  ? Align(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                          height: heightSize(50),
                                          width: widthSize(50),
                                          child:
                                              const CircularProgressIndicator(
                                                  color: maincolor)),
                                    )
                                  : teacherController.eventsModel.isNotEmpty
                                      ? SizedBox(
                                          height: heightSize(415),
                                          width: constraints.maxWidth,
                                          child: ListView.builder(
                                              // shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: teacherController
                                                  .eventsModel.length,
                                              itemBuilder: (context, index) {
                                                DateTime yourDate =
                                                    teacherController
                                                        .eventsModel[index]
                                                        .date;
                                                String formattedDate =
                                                    DateFormat('d MMM y')
                                                        .format(yourDate);

                                                return SizedBox(
                                                  child: Column(
                                                    children: [
                                                      HomeScreenEventsQuickView(
                                                          image:
                                                              teacherController
                                                                  .eventsModel[
                                                                      index]
                                                                  .image,
                                                          color: teacherController
                                                                  .eventColors[
                                                              index %
                                                                  teacherController
                                                                      .eventColors
                                                                      .length],
                                                          height:
                                                              heightSize(125),
                                                          width: constraints
                                                              .maxWidth,
                                                          text1:
                                                              teacherController
                                                                  .eventsModel[
                                                                      index]
                                                                  .title,
                                                          text2:
                                                              teacherController
                                                                  .eventsModel[
                                                                      index]
                                                                  .description
                                                                  .tr,
                                                          text3:
                                                              "Date : $formattedDate",
                                                          textColor: textColor),
                                                      SizedBox(
                                                          height:
                                                              heightSize(20))
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: constraints.maxWidth,
                                                    height: heightSize(258.67),
                                                    child: Image.asset(
                                                      "assets/School_Dash/emptyEvents.png",
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: heightSize(20)),
                                                  const CText(
                                                    text: "No Events",
                                                    color: Color(0xFF222222),
                                                    size: 20,
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  SizedBox(
                                                      height: heightSize(20)),
                                                  const CText(
                                                    text:
                                                        "You currently have no events in the school tap “Create” to create one.",
                                                    color: Color(0xFF555555),
                                                    size: 14,
                                                    textAlign: TextAlign.center,
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  SizedBox(
                                                      height: heightSize(20)),
                                                  GestureDetector(
                                                    onTap: () => Get.to(() =>
                                                        TeacherCreateEventsScreen()),
                                                    child: Container(
                                                      height: heightSize(60),
                                                      width: widthSize(114),
                                                      alignment:
                                                          Alignment.center,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration:
                                                          ShapeDecoration(
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          side: const BorderSide(
                                                              width: 1,
                                                              color: Color(
                                                                  0xFFD9D9D9)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      2200),
                                                        ),
                                                      ),
                                                      child: const CText(
                                                        text: "Create",
                                                        color:
                                                            Color(0xFF222222),
                                                        size: 16,
                                                        fontFamily: 'Open Sans',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  )
                                                ]),
                                          ),
                                        ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          );
        }),
      ),
    );
  }
}
