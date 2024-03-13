import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/getxmessage.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../../models/student_model.dart';
import '../../../Teacher dashboard/DashBoard/view/studentprofile.dart';

import '../../../Teacher dashboard/SIgn-In Page/controller/registrationController.dart';
import '../../Results/view/resultsSelect.dart';

class ParentChildrenView extends StatelessWidget {
  final StudentModel model;
  final Color color;
  ParentChildrenView({super.key, required this.color, required this.model});

  final RegistrationController regController = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize(240),
      width: widthSize(301),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(61, 64, 128, 0.03),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: color)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Stack(
          children: [
            Container(
              height: heightSize(51),
              width: widthSize(305),
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10))),
              child: Align(
                alignment: Alignment.centerRight,
                child: PopupMenuButton(
                    color: whitecolor,
                    onSelected: (value) {
                      if (value == 2) {
                        Get.to(() => ParentsCheckREsults());
                      }
                      if (value == 1) {
                        Get.to(() => const StudentProfile());
                      }
                    },
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              value: 1,
                              child: Text(
                                "View Profile",
                                style: TextStyle(
                                    fontSize: fontSize(16),
                                    fontWeight: FontWeight.w600),
                              )),
                          PopupMenuItem(
                              value: 2,
                              child: Text(
                                "Check results",
                                style: TextStyle(
                                    fontSize: fontSize(16),
                                    fontWeight: FontWeight.w600),
                              )),
                          PopupMenuItem(
                              value: 3,
                              child: Text(
                                "Chat with class teacher",
                                style: TextStyle(
                                    fontSize: fontSize(16),
                                    fontWeight: FontWeight.w600),
                              ))
                        ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: heightSize(22),
                  left: widthSize(105),
                  right: widthSize(100)),
              child: CircleAvatar(
                radius: heightSize(40),
                backgroundColor: whitecolor,
                child: CircleAvatar(
                    radius: heightSize(35),
                    backgroundImage: NetworkImage(model.image)),
              ),
            )
          ],
        ),
        SizedBox(height: heightSize(20)),
        Text(
          "${model.firstname} ${model.lastname}",
          style: TextStyle(
              color: color,
              fontSize: fontSize(16),
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: heightSize(8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: heightSize(30),
              width: widthSize(30),
              child:
                  Image.network(regController.parentModel.value.schoolBanner),
            ),
            SizedBox(width: widthSize(10)),
            Text(
              regController.parentModel.value.schoolName,
              style: TextStyle(
                  color: const Color(0xFF555555),
                  fontSize: fontSize(14),
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(height: heightSize(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: heightSize(31),
              width: widthSize(31),
              child: Image.asset("assets/Parents_Dash/parenticon1.png"),
            ),
            SizedBox(width: widthSize(6)),
            Text(
              model.classAssigned,
              style: TextStyle(
                  fontSize: fontSize(14), fontWeight: FontWeight.w600),
            )
          ],
        ),
      ]),
    );
  }
}
