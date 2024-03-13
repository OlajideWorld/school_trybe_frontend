// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/Submitted%20Assignment/controller/Submitcontroller.dart';
import 'package:school_management/pages/Teacher%20dashboard/Submitted%20Assignment/view/viewstudentprofile.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class SeeAssignments extends StatefulWidget {
  const SeeAssignments({super.key});

  @override
  State<SeeAssignments> createState() => _SeeAssignmentsState();
}

class _SeeAssignmentsState extends State<SeeAssignments> {
  final controller = SubmitController.instance;

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
                  width: 37.5,
                  child: Image.asset("assets/Teacher_Dash/backarrow.png"),
                ),
              ),
              SizedBox(width: widthSize(84.5)),
              Text(
                'Assignments',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: fontSize(20),
                    fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
                top: heightSize(30), right: widthSize(30), left: widthSize(30)),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: widthSize(236),
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: backgroundcolor4,
                          contentPadding: EdgeInsets.only(
                              top: heightSize(10), left: widthSize(10)),
                          hintText: "        Search for student name",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: textcolor7,
                              fontSize: fontSize(17)),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: backgroundcolor4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: backgroundcolor4),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: heightSize(56),
                      width: widthSize(56),
                      decoration: const BoxDecoration(
                          color: textColor3,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Center(
                        child: Icon(
                          Icons.search_rounded,
                          color: whitecolor,
                        ),
                      ),
                    ),
                    Container(
                      height: heightSize(56),
                      width: widthSize(56),
                      decoration: const BoxDecoration(
                          color: maincolor,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Center(
                        child: Icon(
                          Icons.filter_list_sharp,
                          color: whitecolor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: heightSize(32)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          controller.number = SelectNumber.all;
                        });
                      },
                      child: Container(
                        height: heightSize(49),
                        width: widthSize(44),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: backgroundColor2),
                            borderRadius: BorderRadius.circular(widthSize(5)),
                            color: controller.number == SelectNumber.all
                                ? maincolor
                                : backgroundColor3),
                        child: Text(
                          "All",
                          style: TextStyle(
                              color: controller.number == SelectNumber.all
                                  ? whitecolor
                                  : textcolor4),
                        ),
                      ),
                    ),
                    SizedBox(width: widthSize(10)),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          controller.number = SelectNumber.seen;
                        });
                      },
                      child: Container(
                        height: heightSize(49),
                        width: widthSize(53),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: backgroundColor2),
                            borderRadius: BorderRadius.circular(widthSize(5)),
                            color: controller.number == SelectNumber.seen
                                ? maincolor
                                : backgroundColor3),
                        child: Text(
                          "Seen",
                          style: TextStyle(
                              color: controller.number == SelectNumber.seen
                                  ? whitecolor
                                  : textcolor4),
                        ),
                      ),
                    ),
                    SizedBox(width: widthSize(10)),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          controller.number = SelectNumber.unseen;
                        });
                      },
                      child: Container(
                        height: heightSize(49),
                        width: widthSize(70),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: backgroundColor2),
                            borderRadius: BorderRadius.circular(widthSize(5)),
                            color: controller.number == SelectNumber.unseen
                                ? maincolor
                                : backgroundColor3),
                        child: Text(
                          "Unseen",
                          style: TextStyle(
                              color: controller.number == SelectNumber.unseen
                                  ? whitecolor
                                  : textcolor4),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: heightSize(39)),
                if (controller.number == SelectNumber.all)
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ViewStudentAssignments());
                    },
                    child: SizedBox(
                      height: heightSize(877),
                      width: widthSize(367),
                      child:
                          Image.asset("assets/Teacher_Dash/submittedass.png"),
                    ),
                  ),
                if (controller.number == SelectNumber.seen)
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ViewStudentAssignments());
                    },
                    child: SizedBox(
                      height: heightSize(877),
                      width: widthSize(367),
                      child:
                          Image.asset("assets/Teacher_Dash/submitass_seen.png"),
                    ),
                  ),
                if (controller.number == SelectNumber.unseen)
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const ViewStudentAssignments());
                    },
                    child: SizedBox(
                      height: heightSize(629),
                      width: widthSize(367),
                      child: Image.asset(
                          "assets/Teacher_Dash/submitass_unseen.png"),
                    ),
                  ),
              ],
            ),
          )),
    );
  }
}
