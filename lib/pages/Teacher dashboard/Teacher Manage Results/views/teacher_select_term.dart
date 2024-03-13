import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Manage%20Results/views/view_upload_Student_results.dart';

import '../../../../common/button.dart';
import '../../../../common/custom-text.dart';
import '../../../../models/selectionList.dart';
import '../../../../models/student_model.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../School Dashboard/Create Student/controller/student_controller.dart';
import '../../../School Dashboard/manage_results/widget/select_term_dropdown.dart';
import '../../SIgn-In Page/controller/registrationController.dart';

class TeacherSelectTermScreen extends StatelessWidget {
  final StudentModel model;
  TeacherSelectTermScreen({super.key, required this.model});

  final RegistrationController controller = RegistrationController.instance;
  final StudentController controller2 = StudentController.instance;

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
                  child: backbutton()),
              SizedBox(width: widthSize(76.5)),
              Text(
                'Select term',
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
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: heightSize(32)),
                    SizedBox(
                      height: heightSize(40),
                      width: constraints.maxWidth,
                      child: Row(children: [
                        Container(
                          width: widthSize(40),
                          height: heightSize(40),
                          decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    controller.schoolModel.value.image),
                                fit: BoxFit.fill,
                              ),
                              shape: const OvalBorder()),
                        ),
                        SizedBox(width: widthSize(5)),
                        CText(
                          text:
                              "${controller2.classAssigned.value} / ${controller2.classSection.value}",
                          size: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF555555),
                        )
                      ]),
                    ),
                    SizedBox(height: heightSize(42)),
                    SelectResultsTerm(studentModel: model)
                  ]),
            ),
          );
        },
      ),
    );
  }
}

class TeacherSelectResultsTerm extends StatefulWidget {
  final StudentModel studentModel;
  const TeacherSelectResultsTerm({super.key, required this.studentModel});

  @override
  State<TeacherSelectResultsTerm> createState() =>
      _TeacherSelectResultsTermState();
}

class _TeacherSelectResultsTermState extends State<TeacherSelectResultsTerm> {
  final StudentController controller = StudentController.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(94),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Term",
                style: TextStyle(
                    fontSize: fontSize(14), fontWeight: FontWeight.w600)),
            Container(
              height: heightSize(65),
              width: widthSize(368),
              padding: EdgeInsets.symmetric(
                  horizontal: widthSize(20), vertical: heightSize(20)),
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: backgroundColor2),
                borderRadius: BorderRadius.circular(widthSize(10)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: controller.termAssigned,
                  onChanged: (String? val) {
                    setState(() {
                      controller.termAssigned = val!;
                    });
                    debugPrint(controller.termAssigned);
                    Get.to(() => TeacherUploadStudentResults(
                        model: widget.studentModel));
                  },
                  items: SelectionClass().termsUsed.map((item) {
                    return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                              fontSize: fontSize(14),
                              fontWeight: FontWeight.w400),
                        ));
                  }).toList(),
                ),
              ),
            )
          ]),
    );
  }
}
