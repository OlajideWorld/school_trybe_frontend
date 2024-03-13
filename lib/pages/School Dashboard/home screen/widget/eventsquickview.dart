import "package:flutter/material.dart";
import "package:school_management/utils/sizes.dart";

class HomeScreenEventsQuickView extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final Color color;
  final String text1;
  final String text2;
  final String text3;
  final Color textColor;
  const HomeScreenEventsQuickView(
      {super.key,
      required this.color,
      required this.height,
      required this.width,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.textColor,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize(height),
      width: widthSize(width),
      padding: EdgeInsets.only(
          left: widthSize(10), top: heightSize(15), bottom: heightSize(15)),
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: color),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Row(children: [
        SizedBox(
            height: heightSize(95),
            width: widthSize(95),
            child: image != ""
                ? Image.network(
                    image,
                    fit: BoxFit.fill,
                  )
                : Image.asset(
                    "assets/School_Dash/eventquickview.png",
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                  )),
        SizedBox(width: widthSize(12)),
        SizedBox(
          height: heightSize(99),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: TextStyle(
                    color: textColor,
                    fontSize: fontSize(16),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: heightSize(10)),
              SizedBox(
                width: widthSize(200),
                child: Text(
                  text2,
                  style: TextStyle(
                      color: textColor,
                      fontSize: fontSize(12),
                      fontWeight: FontWeight.w400),
                ),
              ),
              const Spacer(),
              Text(
                text3,
                style: TextStyle(
                    color: textColor,
                    fontSize: fontSize(12),
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        )
      ]),
    );
  }
}
