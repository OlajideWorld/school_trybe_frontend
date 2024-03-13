import 'package:flutter/material.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

class AdminTeacherWidget extends StatelessWidget {
  final Color color;
  final String text;
  final String classTeacher;
  final String image;
  final double width;
  const AdminTeacherWidget(
      {super.key,
      required this.color,
      required this.text,
      required this.classTeacher,
      required this.image,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize(200),
      width: width,
      decoration: BoxDecoration(
        color: whitecolor,
        border: Border.all(color: const Color(0xFFDADADA)),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: heightSize(25),
            left: widthSize(10),
            right: widthSize(11),
            bottom: heightSize(22)),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(left: widthSize(15)),
                child: CircleAvatar(
                  backgroundColor: color,
                  radius: heightSize(40),
                  child: CircleAvatar(
                    backgroundColor: whitecolor,
                    radius: heightSize(38),
                    child: CircleAvatar(
                      radius: heightSize(35),
                      backgroundImage: NetworkImage(image),
                    ),
                  ),
                )),
            SizedBox(height: heightSize(12)),
            Text(
              text,
              style: TextStyle(
                  fontSize: fontSize(16), fontWeight: FontWeight.w600),
            ),
            SizedBox(height: heightSize(12)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.workspace_premium,
                  color: color,
                ),
                Text(
                  classTeacher,
                  style: TextStyle(
                      fontSize: fontSize(14), fontWeight: FontWeight.w600),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
