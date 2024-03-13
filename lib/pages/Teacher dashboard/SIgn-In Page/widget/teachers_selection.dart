import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/selectionList.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../controller/registrationController.dart';

class TeacherClassSelection extends StatefulWidget {
  const TeacherClassSelection({super.key});

  @override
  State<TeacherClassSelection> createState() => _TeacherClassSelectionState();
}

class _TeacherClassSelectionState extends State<TeacherClassSelection> {
  final RegistrationController regController = RegistrationController.instance;

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
                    value: regController.classSection.value,
                    onChanged: (String? val) {
                      regController.classSection.value = val!;

                      debugPrint(regController.classSection.value);
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