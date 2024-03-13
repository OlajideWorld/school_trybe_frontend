import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:school_management/common/button.dart";
import "package:school_management/common/input_TextField.dart";
import "package:school_management/pages/School%20Dashboard/Create%20Student/controller/student_controller.dart";
import "package:school_management/pages/School%20Dashboard/School%20Fees/view/selectevelSchool.dart";
import "package:school_management/utils/colors.dart";
import "package:school_management/utils/sizes.dart";

import "../../../../common/getxmessage.dart";
import "../../Create Student/widget/genderSelect.dart";

class CreateSchoolDueScreen extends StatelessWidget {
  CreateSchoolDueScreen({super.key});

  final StudentController controller = StudentController.instance;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
                'Create a Due',
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
            top: heightSize(36), left: widthSize(30), right: widthSize(30)),
        child: Form(
          key: formkey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Amount',
              style: TextStyle(
                  color: const Color(0xFF555555),
                  fontSize: fontSize(14),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: heightSize(10)),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  height: heightSize(63),
                  width: widthSize(70),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(15, 31, 199, 0.02),
                      border: Border.all(color: backgroundColor2)),
                  child: const Center(
                    child: Text(
                      '₦',
                      style: TextStyle(color: maincolor),
                    ),
                  )),
              SizedBox(
                height: heightSize(65),
                width: widthSize(283),
                child: TextField(
                  controller: controller.amount,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: backgroundColor2),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey))),
                ),
              ),
            ]),
            SizedBox(height: heightSize(20)),
            Text(
              'Fee Description',
              style: TextStyle(
                  color: const Color(0xFF555555),
                  fontSize: fontSize(14),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: heightSize(10)),
            SizedBox(
              height: heightSize(65),
              child: InputTextField(
                controller: controller.description,
                obscureText: false,
                hintText: "e.g School fees",
              ),
            ),
            SizedBox(height: heightSize(20)),
            Text(
              'Date Date',
              style: TextStyle(
                  color: const Color(0xFF555555),
                  fontSize: fontSize(14),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: heightSize(10)),
            const GetDateWidget(),
            SizedBox(height: heightSize(20)),
            AppButtons(
              textColor: whitecolor,
              fontSize: fontSize(14),
              backgroundColor: maincolor,
              text: "Preceed",
              borderColor: maincolor,
              height: heightSize(60),
              onTap: () {
                if (controller.amount.text == "" ||
                    controller.description.text == "") {
                  getErrorSnackBar("Please fill all empty forms");
                } else {
                  Get.to(() => SelectlevelSchoolScreen());
                }
              },
            )
          ]),
        ),
      ),
    );
  }
}
