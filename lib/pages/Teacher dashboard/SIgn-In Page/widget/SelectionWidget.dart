import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/School%20Dashboard/Create%20Student/controller/student_controller.dart';

import '../../../../models/selectionList.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../controller/registrationController.dart';

class SelectYourClass extends StatefulWidget {
  const SelectYourClass({super.key});

  @override
  State<SelectYourClass> createState() => _SelectYourClassState();
}

class _SelectYourClassState extends State<SelectYourClass> {
  final RegistrationController controller = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(94),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Class",
                style: TextStyle(
                    fontSize: fontSize(14), fontWeight: FontWeight.w600)),
            Container(
              height: heightSize(65),
              width: widthSize(368),
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: backgroundColor2),
                borderRadius: BorderRadius.circular(widthSize(10)),
                // boxShadow: [
                //   BoxShadow(
                //     blurRadius: widthSize(10),
                //     color: const Color.fromRGBO(61, 64, 128, 0.2),
                //   )
                // ]
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton<String>(
                            isDense: true,
                            hint: const Text('Select Class'),
                            value: controller.classSelection.value,
                            onChanged: (String? newValue) {
                              setState(() {
                                controller.classSelection.value = newValue!;
                              });

                              print(controller.classSelection.value);
                            },
                            items: SelectionClass().classList.map((Map map) {
                              return DropdownMenuItem<String>(
                                  value: map['name'].toString(),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: heightSize(40),
                                        width: widthSize(40),
                                        decoration: ShapeDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                              map['image'],
                                            )),
                                            shape: OvalBorder()),
                                      ),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            map['name'],
                                            style: TextStyle(
                                                color: maincolor,
                                                fontSize: fontSize(16),
                                                fontWeight: FontWeight.w600),
                                          ))
                                    ],
                                  ));
                            }).toList(),
                          )),
                    ))
                  ]),
            )
          ]),
    );
  }
}

class SelectYourclassSelection extends StatefulWidget {
  const SelectYourclassSelection({super.key});

  @override
  State<SelectYourclassSelection> createState() =>
      _SelectYourclassSelectionState();
}

class _SelectYourclassSelectionState extends State<SelectYourclassSelection> {
  final RegistrationController controller = RegistrationController.instance;
  final StudentController controller2 = StudentController.instance;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(94),
      child: Obx(() {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Section",
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
                    boxShadow: []),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: controller.classSection.value,
                    onChanged: (String? val) {
                      controller.classSection.value = val!;
                      controller2.classSection.value = val;

                      debugPrint(controller2.classSection.value);
                    },
                    items: SelectionClass().classSection.map((item) {
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
            ]);
      }),
    );
  }
}

class SelectSubject extends StatefulWidget {
  const SelectSubject({super.key});

  @override
  State<SelectSubject> createState() => _SelectSubjectState();
}

class _SelectSubjectState extends State<SelectSubject> {
  final RegistrationController controller = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(94),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: heightSize(65),
              width: widthSize(368),
              padding: EdgeInsets.symmetric(
                  horizontal: widthSize(20), vertical: heightSize(20)),
              decoration: BoxDecoration(
                  color: backgroundColor,
                  border: Border.all(color: backgroundColor2),
                  borderRadius: BorderRadius.circular(widthSize(10)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: widthSize(10),
                      color: const Color.fromRGBO(61, 64, 128, 0.2),
                    )
                  ]),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: controller.subjectAssigned.value,
                  onChanged: (String? val) {
                    setState(() {
                      controller.subjectAssigned.value = val!;
                    });
                    log(controller.subjectAssigned.value);
                  },
                  items: SelectionClass().subjectAssigned.map((item) {
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

class SelectMaritalStatus extends StatefulWidget {
  const SelectMaritalStatus({super.key});

  @override
  State<SelectMaritalStatus> createState() => _SelectMaritalStatusState();
}

class _SelectMaritalStatusState extends State<SelectMaritalStatus> {
  final RegistrationController controller = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(65),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                  value: controller.maritalStatus.value,
                  onChanged: (String? val) {
                    setState(() {
                      controller.maritalStatus.value = val!;
                    });
                    log(controller.maritalStatus.value);
                  },
                  items: SelectionClass().maritalStatus.map((item) {
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

class SelectTeacherGender extends StatefulWidget {
  const SelectTeacherGender({super.key});

  @override
  State<SelectTeacherGender> createState() => _SelectTeacherGenderState();
}

class _SelectTeacherGenderState extends State<SelectTeacherGender> {
  final RegistrationController controller = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(65),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                  value: controller.teachergender.value,
                  onChanged: (String? val) {
                    setState(() {
                      controller.teachergender.value = val!;
                    });
                    log(controller.teachergender.value);
                  },
                  items: SelectionClass().gender.map((item) {
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
