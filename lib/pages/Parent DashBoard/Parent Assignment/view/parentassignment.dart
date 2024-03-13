import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Parent%20DashBoard/Parent%20Assignment/view/parentselectsubject.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

class ParentAssignmentPage extends StatelessWidget {
  const ParentAssignmentPage({super.key});

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
              SizedBox(width: widthSize(66.5)),
              Text(
                'Select Child',
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
            top: heightSize(39), right: widthSize(30), left: widthSize(30)),
        child: Column(children: [
          GestureDetector(
            onTap: () => Get.to(() => const ParentAssignmentSubject()),
            child: Container(
              height: heightSize(125),
              width: widthSize(368),
              padding: EdgeInsets.only(
                  top: heightSize(27),
                  right: widthSize(20),
                  left: widthSize(25),
                  bottom: heightSize(25)),
              decoration: BoxDecoration(
                  color: whitecolor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: colors1)),
              child: Row(children: [
                SizedBox(
                  height: heightSize(72),
                  width: widthSize(72),
                  child: Image.asset("assets/Parents_Dash/michealNelson.png"),
                ),
                SizedBox(width: widthSize(10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Michael Nelson",
                      style: TextStyle(
                          fontSize: fontSize(16), fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: heightSize(5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: heightSize(30),
                          width: widthSize(30),
                          child: Image.asset("assets/Parents_Dash/logo4.png"),
                        ),
                        SizedBox(width: widthSize(5)),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Southside Grammar School",
                            style: TextStyle(
                                fontSize: fontSize(14),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: heightSize(20),
                )
              ]),
            ),
          ),
          SizedBox(height: heightSize(20)),
          GestureDetector(
            onTap: () => Get.to(() => const ParentAssignmentSubject()),
            child: Container(
              height: heightSize(125),
              width: widthSize(368),
              padding: EdgeInsets.only(
                  top: heightSize(27),
                  right: widthSize(20),
                  left: widthSize(25),
                  bottom: heightSize(25)),
              decoration: BoxDecoration(
                  color: whitecolor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: colors1)),
              child: Row(children: [
                SizedBox(
                  height: heightSize(72),
                  width: widthSize(72),
                  child: Image.asset("assets/Parents_Dash/michealNelson.png"),
                ),
                SizedBox(width: widthSize(10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Michael Nelson",
                      style: TextStyle(
                          fontSize: fontSize(16), fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: heightSize(5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: heightSize(30),
                          width: widthSize(30),
                          child: Image.asset("assets/Parents_Dash/logo4.png"),
                        ),
                        SizedBox(width: widthSize(5)),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Southside Grammar School",
                            style: TextStyle(
                                fontSize: fontSize(14),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: heightSize(20),
                )
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
