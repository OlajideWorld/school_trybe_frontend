import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/AuthPage/controller/authcontroller.dart';

import '../utils/colors.dart';
import '../utils/sizes.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  final controller = AuthController.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize(80),
      padding: EdgeInsets.symmetric(
          horizontal: widthSize(30), vertical: heightSize(5)),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(widthSize(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: heightSize(46),
            width: widthSize(33),
            child: getIcons(Icons.home, 1, "Home", 'homescreen'),
          ),
          SizedBox(
              height: heightSize(46),
              width: widthSize(33),
              child: getIcons(Icons.chat_rounded, 2, "Chat", "chatpage")),
          SizedBox(
            height: heightSize(46),
            width: widthSize(73),
            child: getIcons(Icons.book_rounded, 3, "Assignments", "assignment"),
          ),
          SizedBox(
            height: heightSize(46),
            width: widthSize(33),
            child: getIcons(Icons.person, 4, "Profile", "profilepage"),
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
        Text(
          pageName,
          style: TextStyle(
              fontSize: fontSize(11),
              fontWeight: FontWeight.w500,
              color:
                  index == controller.currentIndex ? maincolor : Colors.grey),
        )
      ]),
    );
  }
}
