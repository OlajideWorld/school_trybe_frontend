import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import 'package:get/get.dart';

class HomeAppBarWidget extends StatelessWidget {
  HomeAppBarWidget({super.key});

  final RegistrationController regController = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize(157),
      decoration: BoxDecoration(
          color: maincolor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(widthSize(20)),
              bottomRight: Radius.circular(widthSize(20)))),
      child: Container(
        padding: EdgeInsets.only(
          left: widthSize(30),
          right: widthSize(30),
        ),
        decoration: const BoxDecoration(color: maincolor),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            child: Row(
              children: [
                CircleAvatar(
                  radius: heightSize(21),
                  backgroundImage: Image.network(
                    regController.teachermodel.value.image,
                    fit: BoxFit.fitWidth,
                  ).image,
                ),
                SizedBox(
                  width: widthSize(10),
                ),
                SizedBox(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hello",
                          style: TextStyle(
                              color: whitecolor, fontSize: fontSize(14)),
                        ),
                        Text(
                            "${regController.teachermodel.value.firstname} ${regController.teachermodel.value.lastName}",
                            style: TextStyle(
                                color: whitecolor, fontSize: fontSize(18))),
                        SizedBox(
                          height: heightSize(5),
                        ),
                      ]),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              SizedBox(
                  height: heightSize(32),
                  width: widthSize(32),
                  child: Icon(
                    Icons.notifications,
                    color: whitecolor,
                    size: heightSize(32),
                  )),
              Padding(
                padding: EdgeInsets.only(
                    left: widthSize(20),
                    top: heightSize(2),
                    right: widthSize(14)),
                child: badges.Badge(
                  badgeStyle: badges.BadgeStyle(
                    shape: badges.BadgeShape.circle,
                    badgeColor: const Color(0xFFD30505),
                    borderRadius: BorderRadius.circular(widthSize(4)),
                    borderSide: BorderSide(
                        color: const Color(0xFFD30505), width: widthSize(2)),
                  ),
                  badgeContent: Text(
                    '2',
                    style:
                        TextStyle(fontSize: fontSize(12.5), color: whitecolor),
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
