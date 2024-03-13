// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/pages/Parent%20DashBoard/Announcement%20Page/view/parents_view_announce_list.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../services/api_calls.dart';
import '../../../../utils/sizes.dart';
import '../../ParentMain/controller/parent_controller.dart';
import '../../Teachers Profile/widget/parent_view_teacher.dart';
import '../widget/emptyAnnouncement.dart';
import '../widget/viewannouncement.dart';

class ParentAnnouncementPage extends StatelessWidget {
  ParentAnnouncementPage({super.key});

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
      body: Obx(() {
        return LoadingOverlayPro(
          isLoading: parentController.isloading.value,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Padding(
              padding: EdgeInsets.only(
                top: heightSize(39),
                right: widthSize(30),
                left: widthSize(30),
              ),
              child: SizedBox(
                height: constraints.maxHeight,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: parentController.studentListFromIds.value.length,
                    itemBuilder: (context, index) {
                      var data =
                          parentController.studentListFromIds.value[index];
                      return Column(
                        children: [
                          showChildren(data, () async {
                            parentController.isloading.value = true;
                            parentController.announceModel.value =
                                await ApiCalls()
                                    .getAnnouncement(data.createdBy);
                            parentController.isloading.value = false;
                            Get.to(() => ParentsViewAnnouncementList());
                          }),
                          SizedBox(height: heightSize(15))
                        ],
                      );
                    }),
              ),
            );
          }),
        );
      }),
    );
  }
}
