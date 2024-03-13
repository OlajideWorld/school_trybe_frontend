import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';

class ViewEachLibraryFeesStudent extends StatelessWidget {
  const ViewEachLibraryFeesStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: Column(children: [
        Container(
          height: heightSize(251),
          width: widthSize(428),
          decoration: const BoxDecoration(
            color: maincolor,
          ),
          child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(
                  top: heightSize(73),
                  right: widthSize(300),
                  left: widthSize(30)),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SizedBox(
                  height: heightSize(37.5),
                  width: widthSize(37.5),
                  child: Image.asset("assets/Teacher_Dash/backarrow.png"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: heightSize(70),
                  right: widthSize(104),
                  left: widthSize(140)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: heightSize(37),
                    backgroundImage: const AssetImage(
                        "assets/Parents_Dash/michealNelson2.png"),
                  ),
                  SizedBox(height: heightSize(10)),
                  Text(
                    "Micheal Nelson",
                    style: TextStyle(
                        fontSize: fontSize(20),
                        color: whitecolor,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: heightSize(10)),
                  Text(
                    "ID: 2356FG",
                    style: TextStyle(
                        fontSize: fontSize(14),
                        color: whitecolor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ]),
        ),
        SizedBox(height: heightSize(33)),
        Padding(
          padding: EdgeInsets.only(left: widthSize(30), right: widthSize(30)),
          child: Container(
            height: heightSize(503),
            width: widthSize(368),
            padding: EdgeInsets.only(
                left: widthSize(30), right: widthSize(29), top: heightSize(30)),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD1D1D1)),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Column(children: [
              SizedBox(
                height: heightSize(77),
                width: widthSize(77),
                child: SvgPicture.asset("assets/School_Dash/receipt.svg"),
              ),
              SizedBox(height: heightSize(10)),
              Text(
                "Library Fee",
                style: TextStyle(
                    fontSize: fontSize(20), fontWeight: FontWeight.w600),
              ),
              SizedBox(height: heightSize(11)),
              Text(
                "₦5,000",
                style: TextStyle(
                    fontSize: fontSize(25),
                    fontWeight: FontWeight.w600,
                    color: Colors.green),
              ),
              SizedBox(height: heightSize(30)),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Student Name:",
                  style: TextStyle(
                      fontSize: fontSize(14), fontWeight: FontWeight.w400),
                ),
                Text(
                  "Michael Nelson",
                  style: TextStyle(
                      fontSize: fontSize(16), fontWeight: FontWeight.w600),
                )
              ]),
              SizedBox(height: heightSize(20)),

              // 2nd Row
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Description: ",
                  style: TextStyle(
                      fontSize: fontSize(14), fontWeight: FontWeight.w400),
                ),
                Text(
                  "Library fee",
                  style: TextStyle(
                      fontSize: fontSize(16), fontWeight: FontWeight.w600),
                )
              ]),
              SizedBox(height: heightSize(20)),

              // 3rd Row
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Date:",
                  style: TextStyle(
                      fontSize: fontSize(14), fontWeight: FontWeight.w400),
                ),
                Text(
                  "26th Jan 2023",
                  style: TextStyle(
                      fontSize: fontSize(16), fontWeight: FontWeight.w600),
                )
              ]),
              SizedBox(height: heightSize(20)),

              // 4th Row
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Time:",
                  style: TextStyle(
                      fontSize: fontSize(14), fontWeight: FontWeight.w400),
                ),
                Text(
                  "12:06pm",
                  style: TextStyle(
                      fontSize: fontSize(16), fontWeight: FontWeight.w600),
                )
              ]),
              SizedBox(height: heightSize(20)),

              // 5th Row
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Payment Method",
                  style: TextStyle(
                      fontSize: fontSize(14), fontWeight: FontWeight.w400),
                ),
                Text(
                  "Card",
                  style: TextStyle(
                      fontSize: fontSize(16), fontWeight: FontWeight.w600),
                )
              ]),
              SizedBox(height: heightSize(20)),

              // 6th Row
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Transaction ID:",
                  style: TextStyle(
                      fontSize: fontSize(14), fontWeight: FontWeight.w400),
                ),
                Text(
                  "123456789",
                  style: TextStyle(
                      fontSize: fontSize(16), fontWeight: FontWeight.w600),
                )
              ]),
              SizedBox(height: heightSize(20)),

              //7th Row
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Paid by:",
                  style: TextStyle(
                      fontSize: fontSize(14), fontWeight: FontWeight.w400),
                ),
                Text(
                  "Victor Ugwu",
                  style: TextStyle(
                      fontSize: fontSize(16), fontWeight: FontWeight.w600),
                )
              ]),
            ]),
          ),
        ),
      ]),
    );
  }
}
