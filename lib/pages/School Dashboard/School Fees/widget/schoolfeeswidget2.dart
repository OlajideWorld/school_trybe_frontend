import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:school_management/pages/School%20Dashboard/Create%20Student/controller/student_controller.dart";
import "package:school_management/pages/School%20Dashboard/Create%20Student/widget/genderSelect.dart";
import "package:school_management/utils/colors.dart";
import "package:school_management/utils/sizes.dart";

class SelectClassesWidget extends StatefulWidget {
  final String text;
  const SelectClassesWidget({super.key, required this.text});

  @override
  State<SelectClassesWidget> createState() => _SelectClassesWidgetState();
}

class _SelectClassesWidgetState extends State<SelectClassesWidget> {
  final StudentController controller = StudentController.instance;

  @override
  Widget build(BuildContext context) {
    bool isSelected = controller.selectedClasses.contains(widget.text);

    return Container(
      height: heightSize(145),
      width: widthSize(169),
      padding: EdgeInsets.only(bottom: heightSize(27)),
      decoration: BoxDecoration(
          color: whitecolor,
          border: Border.all(color: backgroundColor2),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Stack(children: [
        Padding(
          padding: EdgeInsets.only(
              top: heightSize(2), right: widthSize(16), left: widthSize(140)),
          child: Radio(
              activeColor: maincolor,
              value: widget.text,
              groupValue: isSelected ? widget.text : null,
              onChanged: (value) {
                setState(() {
                  if (isSelected) {
                    controller.selectedClasses.remove(value);
                  } else {
                    controller.selectedClasses.add(value!);
                  }
                });
              }),
        ),
        Padding(
          padding: EdgeInsets.only(top: heightSize(28)),
          child: Align(
            alignment: Alignment.center,
            child: Column(children: [
              SizedBox(
                height: heightSize(58),
                width: widthSize(58),
                child: SvgPicture.asset("assets/School_Dash/levelsicon.svg"),
              ),
              SizedBox(height: heightSize(10)),
              Expanded(
                  child: Text(
                widget.text,
                style: TextStyle(
                    fontSize: fontSize(16), fontWeight: FontWeight.w600),
              ))
            ]),
          ),
        ),
      ]),
    );
  }
}

