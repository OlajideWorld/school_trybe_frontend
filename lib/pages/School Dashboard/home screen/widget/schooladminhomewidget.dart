import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/SIgn-In Page/controller/registrationController.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_svg/flutter_svg.dart';

class SchoolAdminHomewidget extends StatelessWidget {
  final String image;
  final String name;
  final String schoolName;
  SchoolAdminHomewidget(
      {super.key,
      required this.image,
      required this.name,
      required this.schoolName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize(130),
      padding: EdgeInsets.only(
        left: widthSize(15),
        top: heightSize(30),
      ),
      decoration: const BoxDecoration(color: maincolor),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          height: heightSize(78),
          width: widthSize(270),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: heightSize(28),
                child: CircleAvatar(
                  radius: heightSize(25),
                  backgroundImage: Image.network(
                    image,
                    fit: BoxFit.fill,
                  ).image,
                ),
              ),
              SizedBox(
                height: heightSize(78),
                width: widthSize(200),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hello",
                        style: TextStyle(
                            fontFamily: "Open Sans",
                            color: whitecolor,
                            fontWeight: FontWeight.w600,
                            fontSize: fontSize(14)),
                      ),
                      SizedBox(height: heightSize(5)),
                      Text(name,
                          style: TextStyle(
                              fontFamily: "Open Sans",
                              color: whitecolor,
                              fontWeight: FontWeight.w600,
                              fontSize: fontSize(18))),
                      SizedBox(height: heightSize(5)),
                      SizedBox(
                        height: heightSize(5),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: heightSize(20),
                            width: widthSize(20),
                            child: SvgPicture.asset(
                              "assets/School_Dash/schoolhomeicon.svg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(width: widthSize(5)),
                          Text(
                            schoolName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: fontSize(16),
                                fontFamily: "Open Sans",
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ]),
              ),
            ],
          ),
        ),
        SizedBox(
          height: heightSize(50),
          width: widthSize(50),
          child: Stack(
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
        ),
      ]),
    );
  }
}
