// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Profile%20Page/view/aboutScreen.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Profile%20Page/view/change_accounName.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Profile%20Page/view/changepassword.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Profile%20Page/view/class_Assigned.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Profile%20Page/view/help&Support.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Profile%20Page/view/subject_assigned.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Profile%20Page/widget/profileContactInfo.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class TeacherProfileSectionWidget extends StatelessWidget {
  TeacherProfileSectionWidget({super.key});

  final RegistrationController controller = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    var user = controller.teachermodel.value;
    return SizedBox(
      height: heightSize(444),
      width: widthSize(368),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "CONTACT INFORMATION",
          style: TextStyle(
              color: textcolor5,
              fontSize: fontSize(14),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: heightSize(15)),
        Container(
          height: heightSize(411),
          width: widthSize(368),
          padding: EdgeInsets.only(
              top: heightSize(28), left: widthSize(20), right: widthSize(11)),
          decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.circular(widthSize(10)),
              boxShadow: [
                BoxShadow(
                    blurRadius: widthSize(60),
                    color: const Color.fromRGBO(61, 64, 128, 0.2),
                    offset: const Offset(0, 4))
              ]),
          child: Column(children: [
            GestureDetector(
              onTap: () {
                Get.to(() => TeacherChangeAccountNameProfile());
              },
              child: TeacherProfileContactInfo(
                  image: "assets/Teacher_Dash/profile_accname.png",
                  header: "${user.lastName} ${user.firstname}",
                  color: textColor,
                  subheader: "Account name"),
            ),
            Divider(
              thickness: widthSize(2),
              color: const Color(0xFFE8E8E8),
            ),
            SizedBox(height: heightSize(10)),
            TeacherProfileContactInfo(
                image: "assets/Teacher_Dash/profile_email.png",
                header: user.email,
                color: textColor,
                subheader: "Email address"),
            Divider(
              thickness: widthSize(2),
              color: const Color(0xFFE8E8E8),
            ),
            SizedBox(height: heightSize(10)),
            TeacherProfileContactInfo(
                image: "assets/Teacher_Dash/profile_phone.png",
                header: user.phoneNumber,
                color: textColor,
                subheader: "Phone number"),
            Divider(
              thickness: widthSize(2),
              color: const Color(0xFFE8E8E8),
            ),
            SizedBox(height: heightSize(10)),
            GestureDetector(
              onTap: () {
                Get.to(() => TeacherChangePasswordScreen());
              },
              child: const TeacherProfileContactInfo(
                  image: "assets/Teacher_Dash/profile_password.png",
                  header: "Change password",
                  color: textColor,
                  subheader: "Edit password"),
            ),
          ]),
        )
      ]),
    );
  }
}

class TeacherProfileSection2 extends StatelessWidget {
  TeacherProfileSection2({super.key});

  final RegistrationController controller = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(249),
      width: widthSize(368),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "SCHOOL INFORMATION",
          style: TextStyle(
              color: textcolor5,
              fontSize: fontSize(14),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: heightSize(15)),
        Container(
          height: heightSize(216),
          width: widthSize(368),
          padding: EdgeInsets.only(
              top: heightSize(28), left: widthSize(20), right: widthSize(11)),
          decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.circular(widthSize(10)),
              boxShadow: [
                BoxShadow(
                    blurRadius: widthSize(60),
                    color: const Color.fromRGBO(61, 64, 128, 0.2),
                    offset: const Offset(0, 4))
              ]),
          child: Column(children: [
            GestureDetector(
              onTap: () {
                Get.to(() => TeacherSubjectAssignedProfile());
              },
              child: TeacherProfileContactInfo(
                  image: "assets/Teacher_Dash/profile_maths.png",
                  header: controller.teachermodel.value.subjectRole,
                  color: textColor,
                  subheader: "Subject taught"),
            ),
            Divider(
              thickness: widthSize(2),
              color: const Color(0xFFE8E8E8),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => TeacherClassAssignedProfile());
              },
              child: TeacherProfileContactInfo(
                  image: "assets/Teacher_Dash/profile_Class.png",
                  header:
                      "${controller.teachermodel.value.className} / ${controller.teachermodel.value.classSection}",
                  color: textColor,
                  subheader: "Class assigned"),
            ),
          ]),
        )
      ]),
    );
  }
}

class TeacherProfileSection4 extends StatelessWidget {
  const TeacherProfileSection4({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(249),
      width: widthSize(368),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "SECURITY & SUPPORT",
          style: TextStyle(
              color: textcolor5,
              fontSize: fontSize(14),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: heightSize(15)),
        Container(
          height: heightSize(216),
          width: widthSize(368),
          padding: EdgeInsets.only(
              top: heightSize(28), left: widthSize(20), right: widthSize(11)),
          decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.circular(widthSize(10)),
              boxShadow: [
                BoxShadow(
                    blurRadius: widthSize(60),
                    color: const Color.fromRGBO(61, 64, 128, 0.2),
                    offset: const Offset(0, 4))
              ]),
          child: Column(children: [
            GestureDetector(
              onTap: () {
                Get.to(() => const TeacherHelpAndSupportScreen());
              },
              child: const TeacherProfileContactInfo(
                  image: "assets/Teacher_Dash/profile_help.png",
                  header: "Help & Support",
                  color: textColor,
                  subheader: "Subject taught"),
            ),
            Divider(
              thickness: widthSize(2),
              color: const Color(0xFFE8E8E8),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const TeacherAboutScreen());
              },
              child: const TeacherProfileContactInfo(
                  image: "assets/Teacher_Dash/profile_trybe.png",
                  header: "About Schooltrybe",
                  color: textColor,
                  subheader: "Class assigned"),
            ),
          ]),
        )
      ]),
    );
  }
}

class TeacherProfileSection3 extends StatelessWidget {
  final String image;
  final String sectionhead;
  final Color color;
  final String text;
  const TeacherProfileSection3(
      {super.key,
      required this.image,
      required this.text,
      required this.sectionhead,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(137),
      width: widthSize(368),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          sectionhead,
          style: TextStyle(
              color: textcolor5,
              fontSize: fontSize(14),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: heightSize(15)),
        Container(
          height: heightSize(104),
          width: widthSize(368),
          padding: EdgeInsets.only(
              top: heightSize(20), left: widthSize(20), right: widthSize(11)),
          decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.circular(widthSize(10)),
              boxShadow: [
                BoxShadow(
                    blurRadius: widthSize(60),
                    color: const Color.fromRGBO(61, 64, 128, 0.2),
                    offset: const Offset(0, 4))
              ]),
          child: SizedBox(
            height: heightSize(49),
            width: widthSize(336),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: heightSize(49),
                  child: Row(children: [
                    SizedBox(
                      height: heightSize(49),
                      width: widthSize(49),
                      child: Image.asset(image),
                    ),
                    SizedBox(width: widthSize(10)),
                    Text(
                      text,
                      style: TextStyle(
                          color: color,
                          fontSize: fontSize(16),
                          fontWeight: FontWeight.w600),
                    )
                  ]),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: textcolor4,
                  size: heightSize(15),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
