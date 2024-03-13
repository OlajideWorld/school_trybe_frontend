import 'package:flutter/material.dart';
import 'package:school_management/pages/Teacher%20dashboard/DashBoard/controller/teacher_controller.dart';

import '../../../../models/selectionList.dart';
import '../../../../utils/sizes.dart';

class TeacherEventsDropDown extends StatefulWidget {
  const TeacherEventsDropDown({super.key});

  @override
  State<TeacherEventsDropDown> createState() => _TeacherEventsDropDownState();
}

class _TeacherEventsDropDownState extends State<TeacherEventsDropDown> {
  final TeacherController controller = TeacherController.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(30),
      // width: widthSize(100),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: controller.eventsType.value,
          onChanged: (String? val) {
            setState(() {
              controller.eventsType.value = val!;
            });
            if (controller.eventsType.value == "Events created by me") {
              controller.fetchTeacherEvents();
            }
            debugPrint(controller.eventsType.value);
          },
          items: SelectionClass().eventType.map((item) {
            return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                      fontSize: fontSize(14), fontWeight: FontWeight.w400),
                ));
          }).toList(),
        ),
      ),
    );
  }
}
