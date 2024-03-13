import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Manage%20Student/views/teacher_view_created_student.dart';

import '../../../../common/button.dart';
import '../../../../services/api_calls.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../School Dashboard/Create Student/controller/student_controller.dart';
import '../../../School Dashboard/Create Student/view/schoolstudentProfile.dart';
import '../../../School Dashboard/Create Student/widget/selectstudentsection.dart';
import '../../SIgn-In Page/controller/registrationController.dart';
import '../../SIgn-In Page/widget/SelectionWidget.dart';

class TeacherStudentInputField2 extends StatelessWidget {
  final String type;
  TeacherStudentInputField2({super.key, required this.type});

  final StudentController studentController = StudentController.instance;
  final RegistrationController regController = RegistrationController.instance;
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
          isLoading: studentController.isloading.value,
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
                    studentController.isloading.value = true;
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
                        await ApiCalls().teacherCreateStudent(model);
                    if (studentController.studentmodel.value.id != "") {
                      studentController.isloading.value = false;
                      Get.to(() => TeahcerViewCreatedStudentScreen(
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
