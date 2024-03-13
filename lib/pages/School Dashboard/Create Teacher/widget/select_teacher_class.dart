import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/School%20Dashboard/home%20screen/controller/adminController.dart';

import '../../../../models/selectionList.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class TeacherSelectYourClass extends StatefulWidget {
  const TeacherSelectYourClass({super.key});

  @override
  State<TeacherSelectYourClass> createState() => _TeacherSelectYourClassState();
}

class _TeacherSelectYourClassState extends State<TeacherSelectYourClass> {
  final AdminController controller = AdminController.instance;

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
                                      Image.asset(
                                        map['image'],
                                        height: heightSize(40),
                                        width: widthSize(40),
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

class TeacherSelectYourclassSelection extends StatefulWidget {
  const TeacherSelectYourclassSelection({super.key});

  @override
  State<TeacherSelectYourclassSelection> createState() =>
      _TeacherSelectYourclassSelectionState();
}

class _TeacherSelectYourclassSelectionState
    extends State<TeacherSelectYourclassSelection> {
  final AdminController controller = AdminController.instance;

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
