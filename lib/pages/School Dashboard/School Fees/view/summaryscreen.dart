import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:intl/intl.dart";
import "package:school_management/common/alertMessage.dart";
import "package:school_management/common/button.dart";
import "package:school_management/pages/School%20Dashboard/home%20screen/controller/adminController.dart";
import "package:school_management/routes/routes.dart";
import "package:school_management/services/api_calls.dart";
import "package:school_management/utils/colors.dart";

import "../../../../utils/sizes.dart";
import "../../Create Student/controller/student_controller.dart";

class SummarySchoolfeesScreen extends StatelessWidget {
  SummarySchoolfeesScreen({super.key});

  final StudentController controller = StudentController.instance;
  final AdminController adminController = AdminController.instance;

  String formatNumberWithCommas(int number) {
    String formattedNumber = NumberFormat.decimalPattern().format(number);
    return formattedNumber;
  }

  @override
  Widget build(BuildContext context) {
    int amountUsed = int.parse(controller.amount.text.trim());
    String money = formatNumberWithCommas(amountUsed);
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
                'Summary',
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
            top: heightSize(36),
            right: widthSize(30),
            left: widthSize(30),
            bottom: heightSize(24)),
        child: Obx(() {
          return Column(children: [
            Container(
              height: heightSize(140),
              width: widthSize(368),
              padding: EdgeInsets.only(
                  top: heightSize(26),
                  left: widthSize(20),
                  right: widthSize(20)),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(33, 150, 83, 0.05),
                  border: Border.all(color: Color(0xFF219653)),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fee description",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF219653)),
                      ),
                      Text(
                        controller.description.text.trim(),
                        style: TextStyle(
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF219653)),
                      )
                    ]),
                SizedBox(height: heightSize(15)),
                //
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Due date",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF219653)),
                      ),
                      Text(
                        "${controller.dateTime.day} / ${controller.dateTime.month} / ${controller.dateTime.year}",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF219653)),
                      )
                    ]),
                SizedBox(height: heightSize(15)),
                //
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Amount",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF219653)),
                      ),
                      Text(
                        "₦$money",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF219653)),
                      )
                    ])
              ]),
            ),
            const Spacer(),
            adminController.isloading.value == false
                ? AppButtons(
                    textColor: whitecolor,
                    fontSize: fontSize(14),
                    backgroundColor: Color(0xFF219653),
                    text: "Create pay",
                    borderColor: Color(0xFF219653),
                    height: heightSize(60),
                    onTap: () async {
                      adminController.isloading.value = true;
                      var newAmount = int.parse(controller.amount.text.trim());
                      final model = {
                        "amount": newAmount,
                        "feeDescription": controller.description.text.trim(),
                        "deadline": controller.dateTime.toIso8601String(),
                        "classAssigned": controller.selectedClasses
                      };

                      debugPrint(model.toString());

                      await ApiCalls().createSchoolDues(model);

                      adminController.isloading.value = false;
                      showAlertMessage(
                          context,
                          false,
                          heightSize(340),
                          widthSize(288),
                          "assets/Teacher_Dash/goodtick_green.png",
                          heightSize(138),
                          SizedBox(
                            height: heightSize(200),
                            width: widthSize(288),
                            child: Column(children: [
                              SizedBox(height: heightSize(10)),
                              Text(
                                "Success",
                                style: TextStyle(
                                    fontSize: fontSize(20),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green),
                              ),
                              SizedBox(height: heightSize(20)),
                              Text(
                                "You have successfully created a school due",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: fontSize(16),
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF219653)),
                              ),
                              SizedBox(height: heightSize(30)),
                              AppButtons(
                                  textColor: whitecolor,
                                  fontSize: fontSize(14),
                                  backgroundColor: Color(0xFF219653),
                                  text: "Ok",
                                  borderColor: Color(0xFF219653),
                                  height: heightSize(63),
                                  onTap: () {
                                    Get.offNamed(SchoolRoutes.homeScreen);
                                  })
                            ]),
                          ));
                    })
                : Center(
                    child: SizedBox(
                      height: heightSize(60),
                      width: widthSize(60),
                      child: CircularProgressIndicator(
                        color: maincolor,
                      ),
                    ),
                  )
          ]);
        }),
      ),
    );
  }
}
