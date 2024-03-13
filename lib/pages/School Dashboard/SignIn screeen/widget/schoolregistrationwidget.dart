import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/common/app_check_function.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../Teacher dashboard/SIgn-In Page/controller/registrationController.dart';

class SchoolRegistrationAdmminWidget extends StatelessWidget {
  SchoolRegistrationAdmminWidget({super.key});

  final RegistrationController controller = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(88),
      width: widthSize(368),
      child: Obx(() {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "No of Students",
            style:
                TextStyle(fontSize: fontSize(14), fontWeight: FontWeight.w600),
          ),
          SizedBox(height: heightSize(15)),
          Row(
            children: [
              //1st Container
              Container(
                height: heightSize(54),
                width: widthSize(109),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(
                        color: const Color.fromRGBO(61, 64, 128, 0.1))),
                child: Row(children: [
                  Radio(
                      activeColor: maincolor,
                      value: SchoolSize.hundred,
                      groupValue: controller.schoolSize.value,
                      onChanged: (SchoolSize? val) {
                        controller.schoolSize.value = val!;
                        controller.schoolsize2.value = "1-100";
                      }),
                  SizedBox(width: widthSize(5)),
                  Text(
                    "1-100",
                    style: TextStyle(
                        fontSize: fontSize(14), fontWeight: FontWeight.w600),
                  )
                ]),
              ),
              SizedBox(width: widthSize(10)),

              // 2nd Container
              Container(
                height: heightSize(54),
                width: widthSize(109),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(
                        color: const Color.fromRGBO(61, 64, 128, 0.1))),
                child: Row(children: [
                  Radio(
                      activeColor: maincolor,
                      value: SchoolSize.fiveHundred,
                      groupValue: controller.schoolSize.value,
                      onChanged: (SchoolSize? val) {
                        controller.schoolSize.value = val!;
                        controller.schoolsize2.value = "100-500";
                      }),
                  SizedBox(width: widthSize(5)),
                  Text(
                    "100-500",
                    style: TextStyle(
                        fontSize: fontSize(14), fontWeight: FontWeight.w600),
                  )
                ]),
              ),
              SizedBox(width: widthSize(10)),
              //
              //3rd Container
              Container(
                height: heightSize(54),
                width: widthSize(115),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(
                        color: const Color.fromRGBO(61, 64, 128, 0.1))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Radio(
                          activeColor: maincolor,
                          value: SchoolSize.oneThousand,
                          groupValue: controller.schoolSize.value,
                          onChanged: (SchoolSize? val) {
                            controller.schoolSize.value = val!;
                            controller.schoolsize2.value = "500-1000";
                          }),
                      SizedBox(width: widthSize(2)),
                      Text(
                        "500-1000",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w600),
                      )
                    ]),
              )
            ],
          )
        ]);
      }),
    );
  }
}

class SchoolTypeSchoolregistration extends StatefulWidget {
  const SchoolTypeSchoolregistration({super.key});

  @override
  State<SchoolTypeSchoolregistration> createState() =>
      _SchoolTypeSchoolregistrationState();
}

class _SchoolTypeSchoolregistrationState
    extends State<SchoolTypeSchoolregistration> {
  final RegistrationController controller = RegistrationController.instance;
  bool Creche = false;
  bool Nursery = false;
  bool Primary = false;
  bool Secondary = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSize(230),
      width: widthSize(368),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "School Type",
          style: TextStyle(fontSize: fontSize(14), fontWeight: FontWeight.w600),
        ),
        SizedBox(height: heightSize(10)),
        Container(
          height: heightSize(201),
          width: widthSize(368),
          padding:
              EdgeInsets.only(left: widthSize(22.34), top: heightSize(23.34)),
          decoration: BoxDecoration(
              color: whitecolor,
              border: Border.all(color: const Color(0xFFD1D1D1)),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Column(children: [
            //Creche
            GestureDetector(
              onTap: () => setState(() {
                Creche = !Creche;
                controller.schoolType.add("Creche");
              }),
              child: SizedBox(
                child: Row(children: [
                  Container(
                    height: heightSize(16.5),
                    width: widthSize(16.5),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: Creche == false ? backgroundColor2 : maincolor,
                        border: Border.all(
                            color: Creche == false
                                ? Color(0xFFD1D1D1)
                                : maincolor)),
                    child: Creche == false
                        ? null
                        : Center(
                            child: Icon(
                              Icons.check,
                              color: whitecolor,
                              size: heightSize(12),
                            ),
                          ),
                  ),
                  SizedBox(width: widthSize(7.52)),
                  Text(
                    "Creche",
                    style: TextStyle(
                        fontSize: fontSize(14), fontWeight: FontWeight.w600),
                  )
                ]),
              ),
            ),
            SizedBox(height: heightSize(26.51)),

            // Nursery
            GestureDetector(
              onTap: () => setState(() {
                Nursery = !Nursery;
                controller.schoolType.add("Nursery");
              }),
              child: SizedBox(
                child: Row(children: [
                  Container(
                    height: heightSize(16.5),
                    width: widthSize(16.5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Nursery == false ? backgroundColor2 : maincolor,
                        border: Border.all(
                            color: Nursery == false
                                ? Color(0xFFD1D1D1)
                                : maincolor)),
                    child: Nursery == false
                        ? null
                        : Center(
                            child: Icon(
                              Icons.check,
                              color: whitecolor,
                              size: heightSize(12),
                            ),
                          ),
                  ),
                  SizedBox(width: widthSize(7.52)),
                  Text(
                    "Nursery",
                    style: TextStyle(
                        fontSize: fontSize(14), fontWeight: FontWeight.w600),
                  )
                ]),
              ),
            ),
            SizedBox(height: heightSize(26.51)),

            // Primary
            GestureDetector(
              onTap: () => setState(() {
                Primary = !Primary;
                controller.schoolType.add("Primary");
              }),
              child: SizedBox(
                child: Row(children: [
                  Container(
                    height: heightSize(16.5),
                    width: widthSize(16.5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Primary == false ? backgroundColor2 : maincolor,
                        border: Border.all(
                            color: Primary == false
                                ? Color(0xFFD1D1D1)
                                : maincolor)),
                    child: Primary == false
                        ? null
                        : Center(
                            child: Icon(
                              Icons.check,
                              color: whitecolor,
                              size: heightSize(12),
                            ),
                          ),
                  ),
                  SizedBox(width: widthSize(7.52)),
                  Text(
                    "Primary",
                    style: TextStyle(
                        fontSize: fontSize(14), fontWeight: FontWeight.w600),
                  )
                ]),
              ),
            ),
            SizedBox(height: heightSize(26.51)),

            // Secondary
            GestureDetector(
              onTap: () => setState(() {
                Secondary = !Secondary;
                controller.schoolType.add("Secondary");
              }),
              child: SizedBox(
                child: Row(children: [
                  Container(
                    height: heightSize(16.5),
                    width: widthSize(16.5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color:
                            Secondary == false ? backgroundColor2 : maincolor,
                        border: Border.all(
                            color: Secondary == false
                                ? Color(0xFFD1D1D1)
                                : maincolor)),
                    child: Secondary == false
                        ? null
                        : Center(
                            child: Icon(
                              Icons.check,
                              color: whitecolor,
                              size: heightSize(12),
                            ),
                          ),
                  ),
                  SizedBox(width: widthSize(7.52)),
                  Text(
                    "Secondary",
                    style: TextStyle(
                        fontSize: fontSize(14), fontWeight: FontWeight.w600),
                  )
                ]),
              ),
            ),
          ]),
        )
      ]),
    );
  }
}
