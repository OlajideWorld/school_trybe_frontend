import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:loading_overlay_pro/loading_overlay_pro.dart";
import "package:school_management/common/app_check_function.dart";
import "package:school_management/common/button.dart";
import "package:school_management/pages/School%20Dashboard/Create%20Student/controller/student_controller.dart";
import "package:school_management/pages/School%20Dashboard/Create%20Student/view/schoolstudentProfile.dart";
import "package:school_management/pages/School%20Dashboard/home%20screen/controller/adminController.dart";
import "package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart";
import "package:school_management/services/api_calls.dart";
import "package:school_management/utils/colors.dart";

import "../../../../utils/sizes.dart";
import "../../../Teacher dashboard/SIgn-In Page/widget/SelectionWidget.dart";
import "../widget/selectstudentsection.dart";

class InputStudentInfoScreen2 extends StatelessWidget {
  InputStudentInfoScreen2({super.key});

  final AdminController adminController = AdminController.instance;
  final RegistrationController regController = RegistrationController.instance;
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
              SizedBox(width: widthSize(74.5)),
              Text(
                'Create student',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: fontSize(20),
                    fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ),
      ),
      body: Obx(() {
        return LoadingOverlayPro(
          isLoading: adminController.isloading.value,
          child: Padding(
            padding: EdgeInsets.only(
                top: heightSize(25),
                right: widthSize(30),
                left: widthSize(30),
                bottom: heightSize(30)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "STUDENT INFORMATION",
                style: TextStyle(
                    fontSize: fontSize(14),
                    fontWeight: FontWeight.w600,
                    color: maincolor),
              ),
              SizedBox(height: heightSize(36)),
              const StudentClassSelection(),
              SizedBox(height: heightSize(20)),
              const SelectYourclassSelection(),
              SizedBox(height: heightSize(20)),
              const SelectDayBoarding(),
              SizedBox(height: heightSize(24)),
              AppButtons(
                  textColor: whitecolor,
                  fontSize: fontSize(14),
                  backgroundColor: maincolor,
                  text: "Continue",
                  borderColor: maincolor,
                  height: heightSize(60),
                  onTap: () async {
                    adminController.isloading.value = true;
                    final model = {
                      "image": studentController.studentImage.value,
                      "firstname": studentController.firstname.text.trim(),
                      "lastname": studentController.lastname.text.trim(),
                      "guardianName":
                          studentController.guardianName.text.trim(),
                      "gender": studentController.genderSelected.value,
                      "phoneNumber": regController.phoneNumber.value,
                      "bloodGroup": studentController.bloodgroup,
                      "address": studentController.homeAddress.text.trim(),
                      "classAssigned": studentController.studentClass,
                      "classSection": studentController.classSection.value,
                      "dateOfBirth":
                          studentController.dateTime.toIso8601String(),
                      "studentType": studentController.studentType
                    };

                    studentController.studentmodel.value =
                        await ApiCalls().createStudent(model);
                    if (studentController.studentmodel.value.id != "") {
                      adminController.isloading.value = false;
                      Get.to(() => SchoolStudentProfileScreen(
                          student: studentController.studentmodel.value));
                    }
                  })
            ]),
          ),
        );
      }),
    );
  }
}
