import "package:barcode_widget/barcode_widget.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";
import "package:school_management/common/button.dart";
import "package:school_management/pages/School%20Dashboard/home%20screen/controller/adminController.dart";
import "package:school_management/routes/routes.dart";
import "package:school_management/utils/colors.dart";

import "../../../../utils/sizes.dart";

class ViewBarcodeSchool extends StatelessWidget {
  ViewBarcodeSchool({super.key});

  final AdminController controller = AdminController.instance;

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
                'Barcode',
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
              top: heightSize(102),
              right: widthSize(30),
              left: widthSize(30),
              bottom: heightSize(59)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            BarcodeWidget(
              barcode: Barcode.qrCode(),
              data: controller.id.value,
              height: heightSize(200),
              width: widthSize(200),
            ),
            SizedBox(height: heightSize(61)),
            Container(
              height: heightSize(168),
              width: widthSize(368),
              padding: EdgeInsets.only(top: heightSize(40)),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(61, 64, 128, 0.05),
              ),
              child: Column(children: [
                Text(
                  controller.name.text.trim(),
                  style: TextStyle(
                      fontSize: fontSize(16),
                      fontWeight: FontWeight.w600,
                      color: maincolor),
                ),
                SizedBox(height: heightSize(10)),
                Text(
                  controller.classSelection.value,
                  style: TextStyle(
                      fontSize: fontSize(14),
                      fontWeight: FontWeight.w600,
                      color: maincolor),
                ),
                SizedBox(height: heightSize(10)),
                Text(
                  "ID: ${controller.id.value}",
                  style: TextStyle(
                      fontSize: fontSize(14),
                      fontWeight: FontWeight.w600,
                      color: maincolor),
                )
              ]),
            ),
            const Spacer(),
            AppButtons(
                textColor: whitecolor,
                fontSize: fontSize(14),
                backgroundColor: maincolor,
                text: "Download Barcode",
                borderColor: maincolor,
                height: heightSize(60),
                onTap: () {
                  Get.offNamed(SchoolRoutes.homeScreen);
                })
          ])),
    );
  }
}
