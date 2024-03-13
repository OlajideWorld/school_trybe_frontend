import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/School%20Dashboard/Create%20Student/controller/student_controller.dart';
import 'package:school_management/pages/School%20Dashboard/manage_results/view/view_each_student.dart';

import '../../../../models/selectionList.dart';
import '../../../../models/student_model.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class SelectResultsTerm extends StatefulWidget {
  final StudentModel studentModel;
  const SelectResultsTerm({super.key, required this.studentModel});

  @override
  State<SelectResultsTerm> createState() => _SelectResultsTermState();
}

class _SelectResultsTermState extends State<SelectResultsTerm> {
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
                    Get.to(() => ViewEachStudentResultsScreen(
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
