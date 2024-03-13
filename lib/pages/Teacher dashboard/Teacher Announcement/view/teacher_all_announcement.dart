import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Announcement/controller/teacher_announce_controller.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Announcement/view/annnouncement_options.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Announcement/view/teacher_create_announcement.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Announcement/view/teacher_view_announcement.dart';

import '../../../../common/custom-text.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../School Dashboard/home screen/controller/adminController.dart';
import '../widget/viewaAnnouncementWidget.dart';

class AllAnnouncementPage extends StatelessWidget {
  AllAnnouncementPage({super.key});

  final TeacherAnnounceController controller =
      TeacherAnnounceController.instance;

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
              SizedBox(width: widthSize(53.5)),
              Text(
                'All announcements',
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
              onRefresh: () => controller.fetchAnnouncement(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: heightSize(28),
                      left: widthSize(20),
                      right: widthSize(20)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: heightSize(22),
                          width: widthSize(170),
                          child: Row(children: [
                            Text(
                              "All announcements",
                              style: TextStyle(
                                  fontSize: fontSize(16),
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: widthSize(10)),
                            Icon(
                              Icons.arrow_drop_down,
                              size: heightSize(20),
                            )
                          ]),
                        ),
                        SizedBox(height: heightSize(27)),
                        // GestureDetector(
                        //     onTap: () {
                        //       // Get.to(() => ViewAnnouncementPage(
                        //       //       mymodel: controller.announceModel[index],
                        //       //     ));
                        //     },
                        //     child: const ViewAllAnnouncementWidget(
                        //       title: "No Announcemnet Yet",
                        //       description: "No announcemnet yet",
                        //     )),
                        Obx(
                          () => controller.isloading.value == true
                              ? Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                      height: heightSize(50),
                                      width: widthSize(50),
                                      child: const CircularProgressIndicator(
                                          color: maincolor)),
                                )
                              : controller.announceModel.isNotEmpty
                                  ? SizedBox(
                                      height: constraints.maxHeight,
                                      width: constraints.maxWidth,
                                      child: ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              controller.announceModel.length,
                                          itemBuilder: (context, index) {
                                            return SizedBox(
                                              child: Column(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.to(() =>
                                                          ViewAnnouncementPage(
                                                            mymodel: controller
                                                                    .announceModel[
                                                                index],
                                                          ));
                                                    },
                                                    child:
                                                        ViewAllAnnouncementWidget(
                                                      title: controller
                                                          .announceModel[index]
                                                          .title,
                                                      description: controller
                                                          .announceModel[index]
                                                          .details,
                                                    ),
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
                                                  "assets/School_Dash/emptyAnnouce.png",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              SizedBox(height: heightSize(20)),
                                              const CText(
                                                text: "No Announcement",
                                                color: Color(0xFF222222),
                                                size: 20,
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w600,
                                              ),
                                              SizedBox(height: heightSize(20)),
                                              const CText(
                                                text:
                                                    "You currently have no assignment in the school tap “Create” to create an assignment.",
                                                color: Color(0xFF555555),
                                                size: 14,
                                                textAlign: TextAlign.center,
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w400,
                                              ),
                                              SizedBox(height: heightSize(20)),
                                              GestureDetector(
                                                onTap: () => Get.to(() =>
                                                    const TeacherCreateAnnouncementPage()),
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
                        SizedBox(height: heightSize(27)),
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
