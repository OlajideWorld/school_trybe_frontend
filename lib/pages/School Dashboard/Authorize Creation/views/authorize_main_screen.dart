import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/custom-text.dart';
import 'package:school_management/pages/School%20Dashboard/Authorize%20Creation/widget/scanCodeBottonSheet.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../common/button.dart';
import '../../../../utils/sizes.dart';

class AuthorizeMainScreen extends StatelessWidget {
  AuthorizeMainScreen({super.key});

  RxBool isParent = true.obs;
  RxString type = "Parent".obs;

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
                  child: backbutton()),
              SizedBox(width: widthSize(66.5)),
              Text(
                'Generate QR code',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: fontSize(20),
                    fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Obx(() {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: widthSize(30), vertical: heightSize(30)),
                child: Column(
                  children: [
                    Row(children: [
                      // Container 1
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            isParent.value = true;
                            type.value = "Parent";
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                right: widthSize(21),
                                top: heightSize(20),
                                left: widthSize(20),
                                bottom: heightSize(33)),
                            height: heightSize(232),
                            decoration: ShapeDecoration(
                              color: isParent.value == false
                                  ? Colors.white
                                  : const Color(0x0CF2994A),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1,
                                    color: isParent.value == false
                                        ? const Color(0xFFD9D9D9)
                                        : const Color(0xFFF2994A)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  isParent.value == false
                                      ? Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            width: widthSize(20),
                                            height: heightSize(20),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const ShapeDecoration(
                                                shape: OvalBorder(
                                              side: BorderSide(
                                                  color: Color(0xFFDADADA)),
                                            )),
                                          ),
                                        )
                                      : Align(
                                          alignment: Alignment.topRight,
                                          child: Icon(
                                            Icons.check_box_rounded,
                                            color: const Color(0xFFF2994A),
                                            size: heightSize(24),
                                          ),
                                        ),
                                  SizedBox(
                                    height: heightSize(86),
                                    width: widthSize(86),
                                    child: Image.asset(
                                      "assets/Teacher_Dash/parent_image.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const CText(
                                    text: "Parent",
                                    color: Color(0xFF222222),
                                    size: 16,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const CText(
                                    text:
                                        "For parents who have child registered",
                                    color: Color(0xFF555555),
                                    size: 12,
                                    fontFamily: 'Open Sans',
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w400,
                                  )
                                ]),
                          ),
                        ),
                      ),
                      SizedBox(width: widthSize(10)),
                      // Container 2
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            isParent.value = false;
                            type.value = "Teacher";
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                right: widthSize(21),
                                top: heightSize(20),
                                left: widthSize(20),
                                bottom: heightSize(33)),
                            height: heightSize(232),
                            decoration: ShapeDecoration(
                              color: isParent.value == false
                                  ? const Color(0x0CF2994A)
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1,
                                    color: isParent.value == false
                                        ? const Color(0xFFF2994A)
                                        : const Color(0xFFD9D9D9)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  isParent.value == true
                                      ? Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            width: widthSize(20),
                                            height: heightSize(20),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const ShapeDecoration(
                                                shape: OvalBorder(
                                              side: BorderSide(
                                                  color: Color(0xFFDADADA)),
                                            )),
                                          ),
                                        )
                                      : Align(
                                          alignment: Alignment.topRight,
                                          child: Icon(
                                            Icons.check_box_rounded,
                                            color: const Color(0xFFF2994A),
                                            size: heightSize(24),
                                          ),
                                        ),
                                  SizedBox(
                                    height: heightSize(86),
                                    width: widthSize(86),
                                    child: Image.asset(
                                      "assets/Teacher_Dash/teacher_image.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const CText(
                                    text: "Teacher",
                                    color: Color(0xFF222222),
                                    size: 16,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const CText(
                                    text:
                                        "For teachers who work in your school",
                                    color: Color(0xFF555555),
                                    size: 12,
                                    fontFamily: 'Open Sans',
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.w400,
                                  )
                                ]),
                          ),
                        ),
                      )
                    ]),
                    const Spacer(),
                    AppButtons(
                        textColor: whitecolor,
                        fontSize: fontSize(14),
                        backgroundColor: maincolor,
                        text: "Continue",
                        borderColor: maincolor,
                        height: heightSize(60),
                        onTap: () {
                          scanQrCodeBottomSheet(
                              context, constraints.maxWidth, type.value);
                          debugPrint(regController.userCredentials.value.id);
                        })
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
