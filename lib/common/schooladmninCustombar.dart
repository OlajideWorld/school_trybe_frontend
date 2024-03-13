import "package:flutter/material.dart";
import "package:get/get.dart";

import "../pages/Teacher dashboard/AuthPage/controller/authcontroller.dart";
import "../utils/colors.dart";
import "../utils/sizes.dart";

class SchoolAdminCustomBar extends StatefulWidget {
  const SchoolAdminCustomBar({super.key});

  @override
  State<SchoolAdminCustomBar> createState() => _SchoolAdminCustomBarState();
}

class _SchoolAdminCustomBarState extends State<SchoolAdminCustomBar> {
  final controller = AuthController.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize(90),
      padding: EdgeInsets.symmetric(
          horizontal: widthSize(30), vertical: heightSize(15)),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(widthSize(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: heightSize(46),
            width: widthSize(33),
            child: getIcons(Icons.home, 1, "Home", 'schooladminhomescreen'),
          ),
          SizedBox(
              height: heightSize(46),
              width: widthSize(66),
              child: getIcons(Icons.payment, 2, "School Fees", "schoolfees")),
          SizedBox(
            height: heightSize(46),
            width: widthSize(73),
            child: getIcons(
                Icons.calendar_month, 3, "Time Table", "parentassignment"),
          ),
          SizedBox(
            height: heightSize(46),
            width: widthSize(33),
            child: getIcons(Icons.person, 4, "Profile", "schoolAdminprofile"),
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
