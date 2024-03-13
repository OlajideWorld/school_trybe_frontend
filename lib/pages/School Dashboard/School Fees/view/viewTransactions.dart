import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../utils/sizes.dart';
import '../widget/viewmoretransactions.dart';

class ViewTransactionsScreen extends StatefulWidget {
  const ViewTransactionsScreen({super.key});

  @override
  State<ViewTransactionsScreen> createState() => _ViewTransactionsScreenState();
}

class _ViewTransactionsScreenState extends State<ViewTransactionsScreen> {
  bool filter1 = false;
  bool filter2 = false;
  bool filter3 = true;

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
                'Transactions',
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
        padding: EdgeInsets.only(top: heightSize(39)),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            Padding(
              padding:
                  EdgeInsets.only(left: widthSize(30), right: widthSize(30)),
              child: Row(
                children: [
                  //
                  // 1st Container
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        filter1 = !filter1;
                      });
                    },
                    child: Container(
                      height: heightSize(44),
                      width: widthSize(127),
                      padding: EdgeInsets.only(
                          top: heightSize(14),
                          left: widthSize(10),
                          bottom: heightSize(14),
                          right: widthSize(10)),
                      decoration: BoxDecoration(
                          color:
                              filter1 == true ? Color(0xFF0F1FC7) : whitecolor,
                          border: Border.all(
                              color: filter1 == true
                                  ? Color(0xFF0F1FC7)
                                  : Color(0xFF555555)),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Start date",
                              style: TextStyle(
                                  color: filter1 == true
                                      ? Color(0xFFFFFFFF)
                                      : Color(0xFF555555),
                                  fontSize: fontSize(12),
                                  fontWeight: FontWeight.w400),
                            ),
                            Icon(
                              Icons.calendar_month_rounded,
                              size: heightSize(16),
                              color: filter1 == true
                                  ? Color(0xFFFFFFFF)
                                  : Color(0xFF555555),
                            )
                          ]),
                    ),
                  ),
                  SizedBox(width: widthSize(10)),

                  //2nd Container
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        filter2 = !filter2;
                      });
                    },
                    child: Container(
                      height: heightSize(44),
                      width: widthSize(127),
                      padding: EdgeInsets.only(
                          top: heightSize(14),
                          left: widthSize(10),
                          bottom: heightSize(14),
                          right: widthSize(10)),
                      decoration: BoxDecoration(
                          color:
                              filter2 == true ? Color(0xFF0F1FC7) : whitecolor,
                          border: Border.all(
                              color: filter2 == true
                                  ? Color(0xFF0F1FC7)
                                  : Color(0xFF555555)),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "End date",
                              style: TextStyle(
                                  color: filter2 == true
                                      ? Color(0xFFFFFFFF)
                                      : Color(0xFF555555),
                                  fontSize: fontSize(12),
                                  fontWeight: FontWeight.w400),
                            ),
                            Icon(
                              Icons.calendar_month_rounded,
                              size: heightSize(16),
                              color: filter2 == true
                                  ? Color(0xFFFFFFFF)
                                  : Color(0xFF555555),
                            )
                          ]),
                    ),
                  ),
                  SizedBox(width: widthSize(10)),

                  // 3rd Container
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        filter3 = !filter3;
                      });
                    },
                    child: Container(
                      height: heightSize(44),
                      width: widthSize(78),
                      padding: EdgeInsets.only(
                          top: heightSize(14),
                          left: widthSize(10),
                          bottom: heightSize(14),
                          right: widthSize(10)),
                      decoration: BoxDecoration(
                          color:
                              filter3 == true ? Color(0xFF0F1FC7) : whitecolor,
                          border: Border.all(
                              color: filter3 == true
                                  ? Color(0xFF0F1FC7)
                                  : Color(0xFF555555)),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Row(children: [
                        Icon(
                          Icons.filter_list_sharp,
                          size: heightSize(16),
                          color: filter3 == true
                              ? Color(0xFFFFFFFF)
                              : Color(0xFF555555),
                        ),
                        SizedBox(width: widthSize(11)),
                        Text(
                          "Filter",
                          style: TextStyle(
                              color: filter3 == true
                                  ? Color(0xFFFFFFFF)
                                  : Color(0xFF555555),
                              fontSize: fontSize(14),
                              fontWeight: FontWeight.w600),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: heightSize(28)),
            const ShowMoreTransctionsWidget()
          ]),
        ),
      ),
    );
  }
}
