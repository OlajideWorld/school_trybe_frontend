import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:school_management/pages/School%20Dashboard/Admin%20Announcement/controller/announce_binding.dart';
import 'package:school_management/pages/School%20Dashboard/Admin%20Events/view/admin_viewEvents.dart';
import 'package:school_management/pages/School%20Dashboard/Create%20Student/controller/student_bindings.dart';
import 'package:school_management/pages/School%20Dashboard/home%20screen/controller/adminController.dart';
import 'package:school_management/pages/School%20Dashboard/home%20screen/widget/eventsquickview.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Announcement/controller/teacher_announce_binding.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';
import 'package:school_management/services/api_services.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../../common/custom-text.dart';
import '../../../../common/schooladmninCustombar.dart';
import '../../../Parent DashBoard/ParentMain/widget/parentquick.dart';
import '../../../Teacher dashboard/Teacher Announcement/view/teacher_announcement_screen.dart';

import '../../../Teacher dashboard/Teacher Events/view/event_Screen.dart';
import '../../Admin Announcement/view/announcement_screen.dart';
import '../../Admin Events/view/admin_createEvents.dart';
import '../../Create Student/view/createstudentscreen.dart';

import '../../Admin Events/view/admin_event_Screen.dart';
import '../../manage_results/view/admin_manage_results.dart';
import '../widget/schooladminhomewidget.dart';
import '../widget/schoolhomedashscrol.dart';
import '../widget/schoolquickviews.dart';

class SchoolAdminHomeScreen extends StatelessWidget {
  SchoolAdminHomeScreen({
    super.key,
  });

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

  final RegistrationController controller = RegistrationController.instance;
  final AdminController adminController = AdminController.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: whitecolor,
        bottomNavigationBar: const SchoolAdminCustomBar(),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Obx(() {
                return RefreshIndicator(
                  onRefresh: () async {
                    String id = controller.userCredentials.value.id;
                    debugPrint(id);
                    await controller.fetchAdminDetails(id);
                    await adminController.fetchEvents();
                    await adminController.fetchAllStudents();
                    await adminController.fetchAllTeachers();
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SizedBox(
                      child: Column(children: [
                        SchoolAdminHomewidget(
                          image: controller.userCredentials.value.image,
                          name: controller.userCredentials.value.firstname,
                          schoolName: controller.schoolModel.value.schoolName,
                        ),
                        SizedBox(height: heightSize(30)),
                        SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: widthSize(30)),
                            child: Row(children: [
                              SchoolHomeDashScroll(
                                color: textColor3,
                                numberOfStudent:
                                    adminController.numberOfStudent.value,
                              ),
                              SizedBox(width: widthSize(15)),
                              SchoolHomeDashScroll(
                                color: maincolor,
                                numberOfStudent: "",
                              ),
                            ]),
                          ),
                        ),
                        SizedBox(height: heightSize(25)),
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
                                  onTap: () => Get.to(
                                      () => const SchoolQuickViewWidget()),
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
                                      Get.to(() => const CreateStudentScreen()),
                                  child: const ParentQuickitems(
                                    height: 85,
                                    width: 75,
                                    image: "assets/Parents_Dash/svgparent5.svg",
                                    text: "Students",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () =>
                                      Get.to(() => const AdminEventsScreen()),
                                  child: const ParentQuickitems(
                                    height: 85,
                                    width: 60.27,
                                    image: "assets/Parents_Dash/svgparent6.svg",
                                    text: "Events",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Get.to(
                                      () => const AdminAnnouncemnetScreen()),
                                  child: const ParentQuickitems(
                                    height: 90,
                                    width: 80,
                                    image:
                                        "assets/School_Dash/schoolhomeicon3.svg",
                                    text: "Announcement",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const AdminManageResults());
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
                        SizedBox(height: heightSize(23)),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: widthSize(30)),
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
                              GestureDetector(
                                onTap: () =>
                                    Get.to(() => AdminViewEventsScreen()),
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
                        SizedBox(height: heightSize(15)),
                        adminController.isloadingEvents.value == true
                            ? Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                    height: heightSize(50),
                                    width: widthSize(50),
                                    child: const CircularProgressIndicator(
                                        color: maincolor)),
                              )
                            : adminController.eventsModel.value.isNotEmpty
                                ? SizedBox(
                                    height: heightSize(415),
                                    width: constraints.maxWidth,
                                    child: ListView.builder(
                                        // shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            adminController.eventsModel.length,
                                        itemBuilder: (context, index) {
                                          DateTime yourDate = adminController
                                              .eventsModel[index].date;
                                          String formattedDate =
                                              DateFormat('d MMM y')
                                                  .format(yourDate);

                                          return SizedBox(
                                            child: Column(
                                              children: [
                                                HomeScreenEventsQuickView(
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
                                                    width: constraints.maxWidth,
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
                                                  "You currently have no events in the school tap “Create” to create one.",
                                              color: Color(0xFF555555),
                                              size: 14,
                                              textAlign: TextAlign.center,
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w400,
                                            ),
                                            SizedBox(height: heightSize(20)),
                                            GestureDetector(
                                              onTap: () => Get.to(() =>
                                                  AdminCreateEventsScreen()),
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
                      ]),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
