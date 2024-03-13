import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/pages/School%20Dashboard/Create%20Student/controller/student_controller.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../../routes/routes.dart';

class BarcodeStudentScreen extends StatelessWidget {
  BarcodeStudentScreen({super.key});

  final StudentController controller = StudentController.instance;

  @override
  Widget build(BuildContext context) {
    var student = controller.studentmodel.value;
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
            top: heightSize(102), left: widthSize(30), right: widthSize(30)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                height: heightSize(240),
                width: widthSize(240),
                padding: const EdgeInsets.all(20),
                decoration: ShapeDecoration(
                  color: const Color(0x193D4080),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF3D4080)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: BarcodeWidget(
                  barcode: Barcode.qrCode(),
                  data: "${student.firstname} ${student.lastname}",
                  height: heightSize(200),
                  width: widthSize(200),
                ),
              )),
          SizedBox(height: heightSize(61)),
          Container(
            height: heightSize(206),
            width: widthSize(368),
            padding: EdgeInsets.only(top: heightSize(33)),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(61, 64, 128, 0.05),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: widthSize(80),
                    height: heightSize(80),
                    decoration: ShapeDecoration(
                        image: DecorationImage(
                            image: NetworkImage(student.image),
                            fit: BoxFit.fill),
                        color: const Color(0xFFE6E6E6),
                        shape: OvalBorder(
                          side: BorderSide(
                            width: widthSize(3.04),
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: const Color(0xFF3D4080),
                          ),
                        )),
                  ),
                  SizedBox(height: heightSize(10)),
                  Text(
                    "${student.firstname} ${student.lastname}",
                    style: TextStyle(
                        color: maincolor,
                        fontSize: fontSize(16),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: heightSize(10)),
                  Text(
                    "ID: ${student.id}",
                    style: TextStyle(
                        color: maincolor,
                        fontSize: fontSize(12),
                        fontWeight: FontWeight.w600),
                  ),
                ]),
          ),
          SizedBox(height: heightSize(43)),
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
        ]),
      ),
    );
  }
}
