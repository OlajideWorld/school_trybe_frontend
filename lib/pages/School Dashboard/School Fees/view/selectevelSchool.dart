import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:school_management/common/button.dart";
import "package:school_management/common/getxmessage.dart";
import "package:school_management/pages/School%20Dashboard/School%20Fees/view/summaryscreen.dart";
import "package:school_management/pages/Teacher%20dashboard/Assignment%20Page/widget/selectclassWidget.dart";
import "package:school_management/utils/colors.dart";

import "../../../../utils/sizes.dart";
import "../../Create Student/controller/student_controller.dart";
import "../widget/schoolfeeswidget2.dart";

class SelectlevelSchoolScreen extends StatefulWidget {
  SelectlevelSchoolScreen({super.key});

  @override
  State<SelectlevelSchoolScreen> createState() =>
      _SelectlevelSchoolScreenState();
}

class _SelectlevelSchoolScreenState extends State<SelectlevelSchoolScreen> {
  final StudentController controller = StudentController.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.selectedClasses = [];
        return true;
      },
      child: Scaffold(
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
                    setState(() {
                      controller.selectedClasses = [];
                    });
                  },
                  child: SizedBox(
                    height: heightSize(37.5),
                    width: widthSize(37.5),
                    child: Image.asset("assets/Teacher_Dash/backarrow.png"),
                  ),
                ),
                SizedBox(width: widthSize(84.5)),
                Text(
                  'Select Levels',
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
              top: heightSize(32),
              left: widthSize(30),
              right: widthSize(30),
              bottom: heightSize(39)),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Who are you creating this for?",
                style: TextStyle(
                    fontSize: fontSize(16), fontWeight: FontWeight.w600),
              ),
              SizedBox(height: heightSize(19)),
              //1st Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SelectClassesWidget(text: "Sss Three"),
                  SelectClassesWidget(text: "Sss Two"),
                ],
              ),
              SizedBox(height: heightSize(20)),
              // 2nd Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SelectClassesWidget(text: "Sss One"),
                  SelectClassesWidget(text: "Jss Three"),
                ],
              ),
              SizedBox(height: heightSize(20)),
              //3rd Row
              Row(
                children: [
                  SelectClassesWidget(text: "Jss Two"),
                  SizedBox(width: widthSize(15)),
                  const SelectClassesWidget(text: "Jss One"),
                ],
              ),

              SizedBox(height: heightSize(32)),
              AppButtons(
                  textColor: whitecolor,
                  fontSize: fontSize(14),
                  backgroundColor: maincolor,
                  text: "Proceed",
                  borderColor: maincolor,
                  height: heightSize(56),
                  onTap: () {
                    debugPrint(controller.selectedClasses.toString());
                    if (controller.selectedClasses.isNotEmpty) {
                      Get.to(() => SummarySchoolfeesScreen());
                    } else {
                      getErrorSnackBar(
                          "Please select atleast one class to assign to");
                    }
                  })
            ]),
          ),
        ),
      ),
    );
  }
}
