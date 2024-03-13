import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/AuthPage/controller/authcontroller.dart';

import '../utils/colors.dart';
import '../utils/sizes.dart';

class ParentCustomBottomBar extends StatefulWidget {
  const ParentCustomBottomBar({super.key});

  @override
  State<ParentCustomBottomBar> createState() => _ParentCustomBottomBarState();
}

class _ParentCustomBottomBarState extends State<ParentCustomBottomBar> {
  final controller = AuthController.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize(75),
      padding: EdgeInsets.symmetric(
          horizontal: widthSize(30), vertical: heightSize(10)),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(widthSize(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: heightSize(46),
            width: widthSize(33),
            child: getIcons(Icons.home, 1, "Home", 'parenthomescreen'),
          ),
          SizedBox(
              height: heightSize(46),
              width: widthSize(69),
              child: getIcons(
                  Icons.calendar_today, 2, "Time table", "parentchatpage")),
          SizedBox(
            height: heightSize(46),
            width: widthSize(73),
            child: getIcons(Icons.payment, 3, "Payments", "parentassignment"),
          ),
          SizedBox(
            height: heightSize(46),
            width: widthSize(33),
            child: getIcons(Icons.person, 4, "Profile", "parentprofilepage"),
          ),
        ],
      ),
    );
  }

  Widget getIcons(IconData icon, int index, String pageName, String route) {
    return GestureDetector(
      onTap: () {
        setState(() {
          controller.currentIndex = index;
        });
        Get.toNamed('/$route');
      },
      child: Column(children: [
        Icon(icon,
            size: heightSize(24),
            color: index == controller.currentIndex ? maincolor : Colors.grey),
        SizedBox(height: heightSize(4)),
        Expanded(
          child: Text(
            pageName,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: fontSize(11),
                fontWeight: FontWeight.w500,
                color:
                    index == controller.currentIndex ? maincolor : Colors.grey),
          ),
        )
      ]),
    );
  }
}
