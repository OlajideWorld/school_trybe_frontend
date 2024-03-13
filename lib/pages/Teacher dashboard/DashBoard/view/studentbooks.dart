import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/DashBoard/view/studentstat.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';

class StudentBooks extends StatelessWidget {
  const StudentBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: heightSize(246),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: maincolor),
                child: Stack(children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: heightSize(73),
                        left: widthSize(30),
                      ),
                      child: SizedBox(
                        height: heightSize(37.5),
                        width: 37.5,
                        child: Image.asset("assets/Teacher_Dash/backarrow.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: heightSize(70),
                      left: widthSize(140),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const StudentStats());
                      },
                      child: SizedBox(
                        height: heightSize(149),
                        width: widthSize(148),
                        child:
                            Image.asset("assets/Teacher_Dash/studentinfo.png"),
                      ),
                    ),
                  )
                ]),
              ),
              SizedBox(height: heightSize(33)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
                child: SizedBox(
                  height: heightSize(57),
                  width: widthSize(368),
                  child: Image.asset("assets/Teacher_Dash/searchImage2.png"),
                ),
              ),
              SizedBox(height: heightSize(49)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
                child: SizedBox(
                  height: heightSize(346),
                  width: widthSize(368),
                  child: Image.asset("assets/Teacher_Dash/dash_ss1.png"),
                ),
              ),
              SizedBox(height: heightSize(30)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
                child: SizedBox(
                  height: heightSize(346),
                  width: widthSize(368),
                  child: Image.asset("assets/Teacher_Dash/dash_js3.png"),
                ),
              ),
              SizedBox(height: heightSize(30)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
                child: SizedBox(
                  height: heightSize(346),
                  width: widthSize(368),
                  child: Image.asset("assets/Teacher_Dash/dash_js2.png"),
                ),
              ),
              SizedBox(height: heightSize(30)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
                child: SizedBox(
                  height: heightSize(346),
                  width: widthSize(368),
                  child: Image.asset("assets/Teacher_Dash/dash_js1.png"),
                ),
              )
            ],
          )),
    );
  }
}
