import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/alertMessage.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/Forget Password/widget/profile_details.dart';
import '../widget/validationsuccess.dart';

class ViewChildSelectionPage extends StatelessWidget {
  const ViewChildSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(children: [
              Container(
                height: heightSize(189),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: maincolor),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: heightSize(70),
                      left: widthSize(30),
                      bottom: heightSize(81.5)),
                  child: Row(children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SizedBox(
                        height: heightSize(37.5),
                        width: 37.5,
                        child: Image.asset("assets/Teacher_Dash/backarrow.png"),
                      ),
                    ),
                    SizedBox(width: widthSize(47)),
                    Text(
                      'Profile confirmation',
                      style: TextStyle(
                          color: whitecolor,
                          fontSize: fontSize(20),
                          fontWeight: FontWeight.w600),
                    ),
                  ]),
                ),
              ),
              SizedBox(height: heightSize(58)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
                child: Text(
                  "Can you please confirm that the children's profile below belong to your children?",
                  style: TextStyle(
                      color: const Color(0xFF555555),
                      fontSize: fontSize(16),
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: heightSize(20)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: heightSize(211),
                      width: widthSize(176),
                      child: Image.asset(
                          "assets/Parents_Dash/validationimage.png"),
                    ),
                    SizedBox(
                      height: heightSize(211),
                      width: widthSize(176),
                      child: Image.asset(
                          "assets/Parents_Dash/validationimage.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: heightSize(15)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: heightSize(211),
                      width: widthSize(176),
                      child: Image.asset(
                          "assets/Parents_Dash/validationimage.png"),
                    ),
                    SizedBox(
                      height: heightSize(211),
                      width: widthSize(176),
                      child: Image.asset(
                          "assets/Parents_Dash/validationimage.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: heightSize(27)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Expanded(
                        child: Container(
                          height: heightSize(60),
                          width: widthSize(160),
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Center(
                              child: Text(
                            "No, back to select",
                            style: TextStyle(
                                color: whitecolor,
                                fontSize: fontSize(14),
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                      ),
                    ),
                    // SizedBox(width: widthSize(15)),
                    GestureDetector(
                      onTap: () {
                        showAlertMessage(
                            context,
                            false,
                            heightSize(438),
                            widthSize(287),
                            "assets/Teacher_Dash/goodtick_green.png",
                            heightSize(138),
                            const ValidationSuccessScreen());
                      },
                      child: Expanded(
                        child: Container(
                          height: heightSize(60),
                          width: widthSize(160),
                          decoration: const BoxDecoration(
                              color: maincolor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Center(
                              child: Text(
                            "Confirm",
                            style: TextStyle(
                                color: whitecolor,
                                fontSize: fontSize(14),
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          ProfileDetails()
        ],
      ),
    );
  }
}
