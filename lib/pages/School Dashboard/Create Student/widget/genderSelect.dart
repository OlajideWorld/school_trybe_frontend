import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/School%20Dashboard/Create%20Student/controller/student_controller.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../../models/selectionList.dart';
import '../../../../utils/colors.dart';

class GenderSelectWIdget extends StatefulWidget {
  const GenderSelectWIdget({super.key});

  @override
  State<GenderSelectWIdget> createState() => _GenderSelectWIdgetState();
}

class _GenderSelectWIdgetState extends State<GenderSelectWIdget> {
  final StudentController controller = StudentController.instance;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(children: [
        Container(
            height: heightSize(65),
            width: widthSize(160),
            padding: EdgeInsets.only(
                top: heightSize(23),
                left: widthSize(20),
                right: widthSize(10),
                bottom: heightSize(20)),
            decoration: BoxDecoration(
                border: Border.all(color: backgroundColor2),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Row(
              children: [
                Text("Male",
                    style: TextStyle(
                        fontSize: fontSize(14),
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFf818181))),
                const Spacer(),
                Radio(
                    activeColor: maincolor,
                    groupValue: controller.gender.value,
                    value: Selectgender.male,
                    onChanged: (Selectgender? val) {
                      controller.gender.value = val!;
                      controller.genderSelected.value = "Male";
                    })
              ],
            )),
        const Spacer(),
        // Second Container
        Container(
            height: heightSize(65),
            width: widthSize(160),
            padding: EdgeInsets.only(
                top: heightSize(23),
                left: widthSize(20),
                right: widthSize(10),
                bottom: heightSize(20)),
            decoration: BoxDecoration(
                border: Border.all(color: backgroundColor2),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Row(
              children: [
                Text(
                  "Female",
                  style: TextStyle(
                      fontSize: fontSize(14),
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFf818181)),
                ),
                const Spacer(),
                Radio(
                    activeColor: maincolor,
                    groupValue: controller.gender.value,
                    value: Selectgender.female,
                    onChanged: (Selectgender? val) {
                      controller.gender.value = val!;
                      controller.genderSelected.value = "Female";
                    })
              ],
            ))
      ]);
    });
  }
}

class GetDateWidget extends StatefulWidget {
  const GetDateWidget({super.key});

  @override
  State<GetDateWidget> createState() => _GetDateWidgetState();
}

class _GetDateWidgetState extends State<GetDateWidget> {
  final StudentController controller = StudentController.instance;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final date = await pickDate();
        if (date == null) return;

        var newdate =
            DateTime(date.year, date.month, date.day, date.hour, date.minute);

        setState(() {
          controller.dateTime = newdate;
        });
      },
      child: Container(
        height: heightSize(63),
        width: widthSize(368),
        padding: EdgeInsets.symmetric(horizontal: widthSize(23)),
        decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            border: Border.all(color: backgroundColor2),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "${controller.dateTime.year} / ${controller.dateTime.month} / ${controller.dateTime.day}",
            style: TextStyle(
                color: maincolor,
                fontSize: fontSize(18),
                fontWeight: FontWeight.w600),
          ),
          Icon(
            Icons.calendar_today,
            size: heightSize(20),
            color: textColor3,
          )
        ]),
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: controller.dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2200));
}

class GetBloodGroup extends StatefulWidget {
  const GetBloodGroup({super.key});

  @override
  State<GetBloodGroup> createState() => _GetBloodGroupState();
}

class _GetBloodGroupState extends State<GetBloodGroup> {
  final StudentController controller = StudentController.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(94),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Blood group",
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
                  value: controller.bloodgroup,
                  onChanged: (String? val) {
                    setState(() {
                      controller.bloodgroup = val!;
                    });
                    debugPrint(controller.bloodgroup);
                  },
                  items: SelectionClass().bloodGroup.map((item) {
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
