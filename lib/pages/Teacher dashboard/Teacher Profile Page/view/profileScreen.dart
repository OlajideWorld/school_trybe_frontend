// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/alertMessage.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Profile%20Page/view/notification_screen.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Profile%20Page/widget/profileMessage.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';

import '../../../../common/custombottombar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../SIgn-In Page/widget/pickimagescreen.dart';
import '../widget/profileContactInfo.dart';
import '../widget/profileSections.dart';

class TeacherProfileScreen extends StatelessWidget {
  TeacherProfileScreen({super.key});
  final RegistrationController controller = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomBar(),
      backgroundColor: whitecolor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(heightSize(78)),
        child: AppBar(
          backgroundColor: maincolor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: heightSize(22), left: widthSize(20)),
            child: Text(
              'My profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: whitecolor,
                  fontSize: fontSize(20),
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: heightSize(41), bottom: heightSize(10)),
        child: RefreshIndicator(
          onRefresh: () async {
            String id = controller.teachermodel.value.id;
            debugPrint(id);
            await controller.fetchTeachersDetails(id);
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      height: heightSize(109),
                      child: Container(
                        width: widthSize(109.11),
                        height: heightSize(109.11),
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  controller.teachermodel.value.image),
                              fit: BoxFit.contain),
                          color: const Color(0xFFE6E6E6),
                          shape: const OvalBorder(),
                        ),
                      )),
                ),
                SizedBox(height: heightSize(10)),
                Text(
                    "${controller.teachermodel.value.lastName} ${controller.teachermodel.value.lastName}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: fontSize(20))),
                SizedBox(height: heightSize(10)),
                Text(controller.teachermodel.value.subjectRole,
                    style: TextStyle(
                        color: maincolor,
                        fontWeight: FontWeight.w600,
                        fontSize: fontSize(14))),
                SizedBox(height: heightSize(56.89)),
                TeacherProfileSectionWidget(),
                SizedBox(height: heightSize(40)),
                TeacherProfileSection2(),
                SizedBox(height: heightSize(40)),
                GestureDetector(
                  onTap: () {
                    Get.to(() => TeacherNotificaitionProfilePage());
                  },
                  child: const TeacherProfileSection3(
                      image: "assets/Teacher_Dash/profile_notification.png",
                      text: "Notifications",
                      sectionhead: "COMMUNICATION PREFERENCE",
                      color: textColor),
                ),
                SizedBox(height: heightSize(40)),
                const TeacherProfileSection4(),
                SizedBox(height: heightSize(44)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "DEACTIVATE ACCOUNT",
                      style: TextStyle(
                          color: textcolor5,
                          fontSize: fontSize(14),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: heightSize(15)),
                    GestureDetector(
                      onTap: () {
                        showAlertMessage(
                            context,
                            false,
                            heightSize(350),
                            widthSize(350),
                            "assets/Teacher_Dash/warningicon.png",
                            heightSize(145),
                            const TeacherProfileMessage());
                      },
                      child: Container(
                        height: heightSize(104),
                        width: widthSize(368),
                        padding: EdgeInsets.only(
                            top: heightSize(28),
                            left: widthSize(20),
                            right: widthSize(11)),
                        decoration: BoxDecoration(
                            color: whitecolor,
                            borderRadius: BorderRadius.circular(widthSize(10)),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: widthSize(60),
                                  color: const Color.fromRGBO(61, 64, 128, 0.2),
                                  offset: const Offset(0, 4))
                            ]),
                        child: const TeacherProfileContactInfo(
                            color: Colors.red,
                            image: "assets/Teacher_Dash/profile_delete.png",
                            header: "Deactivate account",
                            subheader: "Deactivate your adio account"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
