// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/view/scanbarcode.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../Parent DashBoard/Parents Sign Up/views/parent_scanbarcode.dart';

class ScanQrCode extends StatelessWidget {
  final String type;
  final int number;
  const ScanQrCode({super.key, required this.type, required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: Padding(
        padding: EdgeInsets.only(
            top: heightSize(65), left: widthSize(30), right: widthSize(30)),
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              height: heightSize(37.5),
              width: widthSize(223.5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SizedBox(
                          height: heightSize(37.5),
                          width: widthSize(37.5),
                          child: Image.asset(
                              "assets/Teacher_Dash/backarrow2.png")),
                    ),
                    Text("Scan QR code",
                        style: TextStyle(
                            color: textColor2,
                            fontSize: fontSize(20),
                            fontWeight: FontWeight.w600))
                  ]),
            ),
          ),
          SizedBox(height: heightSize(28.5)),
          Container(
            height: heightSize(115),
            padding: EdgeInsets.only(
                top: heightSize(22),
                left: widthSize(11),
                right: widthSize(12),
                bottom: heightSize(21)),
            decoration: BoxDecoration(
                color: backgroundColor2,
                border: Border.all(color: maincolor),
                borderRadius: BorderRadius.circular(widthSize(5))),
            child: Center(
                child: Text(
              "To confirm your identity as a $type of a registered school, please scan the QR code on the phone of your school administrator",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: maincolor,
                  fontSize: fontSize(16),
                  fontWeight: FontWeight.w400),
            )),
          ),
          SizedBox(height: heightSize(129)),
          SizedBox(
            height: heightSize(176),
            width: widthSize(176),
            child: Image.asset("assets/Teacher_Dash/Qrcode.png"),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: heightSize(55)),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: AppButtons(
                    textColor: whitecolor,
                    fontSize: fontSize(14),
                    backgroundColor: maincolor,
                    text: "Scan barcode",
                    borderColor: maincolor,
                    height: heightSize(60),
                    onTap: () {
                      if (type == "parent") {
                        Get.to(() => const ParentsScanCode());
                      } else {
                        Get.to(() => ScanBarCode(
                              type: type,
                              number: number,
                            ));
                      }
                    }),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
