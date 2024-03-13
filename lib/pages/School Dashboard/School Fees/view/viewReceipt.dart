import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

class ViewReceiptScreen extends StatelessWidget {
  const ViewReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(heightSize(78)),
        child: AppBar(
          backgroundColor: maincolor,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(
              top: heightSize(22),
              left: widthSize(20),
            ),
            child: Row(children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SizedBox(
                  height: heightSize(37.5),
                  width: widthSize(37.5),
                  child: Image.asset("assets/Teacher_Dash/backarrow.png"),
                ),
              ),
              SizedBox(width: widthSize(77.5)),
              Text(
                'Receipt',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: fontSize(20),
                    fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: heightSize(30), left: widthSize(30), right: widthSize(30)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            height: heightSize(247),
            width: widthSize(368),
            padding: EdgeInsets.only(top: heightSize(30)),
            decoration: BoxDecoration(
                color: whitecolor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: backgroundColor2)),
            child: Column(children: [
              SizedBox(
                height: heightSize(77),
                width: widthSize(77),
                child: SvgPicture.asset("assets/School_Dash/receipt.svg"),
              ),
              SizedBox(height: heightSize(10)),
              Text(
                "Southside Grammar school",
                style: TextStyle(
                    fontSize: fontSize(16), fontWeight: FontWeight.w600),
              ),
              SizedBox(height: heightSize(11)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SvgPicture.asset("assets/School_Dash/receiptcardlogo.svg"),
                SizedBox(width: widthSize(8)),
                Text(
                  "Card payment",
                  style: TextStyle(
                      fontSize: fontSize(14), fontWeight: FontWeight.w600),
                )
              ]),
              SizedBox(height: heightSize(11)),
              Text(
                "₦150,000",
                style: TextStyle(
                    fontSize: fontSize(25),
                    fontWeight: FontWeight.w600,
                    color: Colors.green),
              )
            ]),
          ),
          SizedBox(height: heightSize(20)),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Transaction details",
                style: TextStyle(
                    fontSize: fontSize(14), fontWeight: FontWeight.w600),
              )),
          SizedBox(height: heightSize(10)),
          Container(
            height: heightSize(310),
            width: widthSize(368),
            padding: EdgeInsets.only(
                top: heightSize(26), right: widthSize(29), left: widthSize(30)),
            decoration: BoxDecoration(
                color: whitecolor,
                border: Border.all(color: backgroundColor2),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Column(children: [
              //1st Row
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
          SizedBox(height: heightSize(12)),
          AppButtons(
              textColor: whitecolor,
              fontSize: fontSize(14),
              backgroundColor: maincolor,
              text: "Download PDF",
              borderColor: maincolor,
              height: heightSize(60),
              onTap: () {})
        ]),
      ),
    );
  }
}
