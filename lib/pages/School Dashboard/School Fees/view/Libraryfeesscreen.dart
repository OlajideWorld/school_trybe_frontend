import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';
import '../widget/managedueswidget.dart';

enum LibraryValues { paid, pending }

class LibraryFeesScreenSchool extends StatefulWidget {
  const LibraryFeesScreenSchool({super.key});

  @override
  State<LibraryFeesScreenSchool> createState() =>
      _LibraryFeesScreenSchoolState();
}

class _LibraryFeesScreenSchoolState extends State<LibraryFeesScreenSchool> {
  LibraryValues values = LibraryValues.paid;

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
              SizedBox(width: widthSize(84.5)),
              Text(
                'Library fee',
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
        padding: EdgeInsets.only(bottom: heightSize(20)),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      values = LibraryValues.paid;
                    });
                  },
                  child: Container(
                    height: heightSize(62),
                    width: widthSize(204),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: values == LibraryValues.paid
                                    ? const Color(0xFFF2994A)
                                    : const Color(0xFFD1D1D1)))),
                    child: Center(
                        child: Text(
                      "Paid",
                      style: TextStyle(
                          fontSize: fontSize(16), fontWeight: FontWeight.w600),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      values = LibraryValues.pending;
                    });
                  },
                  child: Container(
                    height: heightSize(62),
                    width: widthSize(204),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: values == LibraryValues.pending
                                    ? const Color(0xFFF2994A)
                                    : const Color(0xFFD1D1D1)))),
                    child: Center(
                        child: Text(
                      "Pending",
                      style: TextStyle(
                          fontSize: fontSize(16), fontWeight: FontWeight.w600),
                    )),
                  ),
                )
              ],
            ),
            SizedBox(height: heightSize(28)),
            if (values == LibraryValues.paid) showPaidStudents(context),
            if (values == LibraryValues.pending) showPendingStudents(context)
          ]),
        ),
      ),
    );
  }

  showPaidStudents(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
        child: Column(
          children: [
            Row(children: [
              viewTheStudentLibraryFee(context),
              SizedBox(width: widthSize(10)),
              viewTheStudentLibraryFee(context),
            ]),
            SizedBox(height: heightSize(29)),
            Row(children: [
              viewTheStudentLibraryFee(context),
              SizedBox(width: widthSize(10)),
              viewTheStudentLibraryFee(context),
            ]),
            SizedBox(height: heightSize(29)),
            Row(children: [
              viewTheStudentLibraryFee(context),
              SizedBox(width: widthSize(10)),
              viewTheStudentLibraryFee(context),
            ]),
          ],
        ),
      ),
    );
  }

  showPendingStudents(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
        child: Column(children: [
          Row(children: [
            viewTheStudentLibraryFee2(context),
            SizedBox(width: widthSize(10)),
            viewTheStudentLibraryFee2(context),
          ]),
          SizedBox(height: heightSize(29)),
          Row(children: [
            viewTheStudentLibraryFee2(context),
            SizedBox(width: widthSize(10)),
            viewTheStudentLibraryFee2(context),
          ]),
          SizedBox(height: heightSize(29)),
          Row(children: [
            viewTheStudentLibraryFee2(context),
            SizedBox(width: widthSize(10)),
            viewTheStudentLibraryFee2(context),
          ]),
        ]),
      ),
    );
  }
}
