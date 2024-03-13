import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:school_management/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import 'package:get/get.dart';

class ParentQuickitems extends StatelessWidget {
  final double width;
  final String text;
  final String image;
  final double height;
  const ParentQuickitems(
      {super.key,
      required this.width,
      required this.text,
      required this.image,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(height),
      width: widthSize(width),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: heightSize(61),
              width: widthSize(61),
              child: SvgPicture.asset(image),
            ),
            const Spacer(),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: fontSize(12), fontWeight: FontWeight.w600),
            )
          ]),
    );
  }
}

class ParentsHomeAppBarWidget extends StatelessWidget {
  ParentsHomeAppBarWidget({super.key});

  final RegistrationController regController = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize(110),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: maincolor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(widthSize(20)),
              bottomRight: Radius.circular(widthSize(20)))),
      child: Container(
        padding: EdgeInsets.only(
          top: heightSize(30),
          left: widthSize(15),
          right: widthSize(30),
        ),
        decoration: const BoxDecoration(color: maincolor),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            child: Row(
              children: [
                CircleAvatar(
                  radius: heightSize(28),
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: heightSize(25),
                    backgroundImage: Image.network(
                      regController.parentModel.value.image,
                      fit: BoxFit.fitWidth,
                    ).image,
                  ),
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
                              fontFamily: "Open Sans",
                              fontWeight: FontWeight.w600,
                              color: whitecolor,
                              fontSize: fontSize(14)),
                        ),
                        Text(
                            "${regController.parentModel.value.firstname} ${regController.parentModel.value.lastName}",
                            style: TextStyle(
                                fontFamily: "Open Sans",
                                color: whitecolor,
                                fontWeight: FontWeight.w600,
                                fontSize: fontSize(18))),
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
