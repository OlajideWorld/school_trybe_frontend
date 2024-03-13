import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:school_management/common/custom-text.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../../common/button.dart';

RegistrationController regController = RegistrationController.instance;

scanQrCodeBottomSheet(BuildContext context, double width, String type) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: heightSize(630),
          width: width,
          padding: EdgeInsets.symmetric(
              horizontal: widthSize(20), vertical: heightSize(20)),
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CText(
                text: "Scan Barcode",
                color: Color(0xFF222222),
                size: 24,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: heightSize(10)),
              CText(
                text:
                    "Kindly tell your $type to scan the barcode below to authorize him/her",
                color: const Color(0xFF555555),
                size: 14,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: heightSize(63)),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: widthSize(240),
                  height: heightSize(240),
                  padding: const EdgeInsets.all(20),
                  decoration: ShapeDecoration(
                    color: const Color(0x0C3D4080),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFF3D4080)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: BarcodeWidget(
                    barcode: Barcode.qrCode(),
                    data: regController.userCredentials.value.id,
                    height: heightSize(200),
                    width: widthSize(200),
                  ),
                ),
              ),
              Spacer(),
              AppButtons(
                  textColor: whitecolor,
                  fontSize: fontSize(14),
                  backgroundColor: maincolor,
                  text: "Download QR",
                  borderColor: maincolor,
                  height: heightSize(60),
                  onTap: () {
                    debugPrint(regController.userCredentials.value.id);
                  })
            ],
          ),
        );
      });
}
