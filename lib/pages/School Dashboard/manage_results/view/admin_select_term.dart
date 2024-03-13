import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/custom-text.dart';
import 'package:school_management/pages/School%20Dashboard/manage_results/widget/select_term_dropdown.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../common/button.dart';
import '../../../../models/student_model.dart';
import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/SIgn-In Page/controller/registrationController.dart';
import '../../Create Student/controller/student_controller.dart';

class AdminSelectTermScreen extends StatelessWidget {
  final StudentModel model;
  AdminSelectTermScreen({super.key, required this.model});

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
