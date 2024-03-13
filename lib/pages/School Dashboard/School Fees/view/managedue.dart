import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:intl/intl.dart";
import "package:school_management/pages/School%20Dashboard/home%20screen/controller/adminController.dart";
import "package:school_management/utils/colors.dart";
import "package:school_management/utils/sizes.dart";

import "../widget/managedueswidget.dart";

class ManageDuesScreen extends StatefulWidget {
  const ManageDuesScreen({super.key});

  @override
  State<ManageDuesScreen> createState() => _ManageDuesScreenState();
}

class _ManageDuesScreenState extends State<ManageDuesScreen> {
  final AdminController controller = AdminController.instance;

  @override
  void initState() {
    super.initState();
    controller.fetchSchoolDues();
  }

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
                SizedBox(width: widthSize(69.5)),
                Text(
                  'All created dues',
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
            return Obx(() {
              return controller.isloading.value == false
                  ? Padding(
                      padding: EdgeInsets.only(
                          top: heightSize(20),
                          right: widthSize(30),
                          left: widthSize(30)),
                      child: SizedBox(
                        height: constraints.maxHeight,
                        width: constraints.maxWidth,
                        child: ListView.builder(
                            // shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: controller.schoolDues.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ManageDuesScreenWidget(
                                      schoolDues: controller.schoolDues[index]),
                                  SizedBox(height: heightSize(10))
                                ],
                              );
                            }),
                      ))
                  : Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          height: heightSize(50),
                          width: widthSize(50),
                          child: const CircularProgressIndicator(
                              color: maincolor)),
                    );
            });
          },
        ));
  }
}

 
            // SizedBox(height: heightSize(10)),
            // const ManageDuesScreenWidget()