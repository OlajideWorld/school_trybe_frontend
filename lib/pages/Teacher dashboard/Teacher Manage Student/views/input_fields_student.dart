import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/pages/School%20Dashboard/Create%20Student/widget/genderSelect.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Manage%20Student/views/input_field_student2.dart';

import '../../../../common/button.dart';
import '../../../../common/getxmessage.dart';
import '../../../../common/input_TextField.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../School Dashboard/Create Student/controller/student_controller.dart';
import '../../SIgn-In Page/controller/registrationController.dart';
import '../../SIgn-In Page/widget/phonefield.dart';
import '../../SIgn-In Page/widget/pickimagescreen.dart';

class TeacherStudentInputField extends StatelessWidget {
  final String type;
  TeacherStudentInputField({super.key, required this.type});

  final StudentController controller = StudentController.instance;
  final RegistrationController controller2 = RegistrationController.instance;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
                child: SizedBox(
                  height: heightSize(37.5),
                  width: widthSize(37.5),
                  child: Image.asset("assets/Teacher_Dash/backarrow.png"),
                ),
              ),
              SizedBox(width: widthSize(74.5)),
              Text(
                type,
                style: TextStyle(
                    color: whitecolor,
                    fontSize: fontSize(20),
                    fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ),
      ),
      body: Obx(() {
        return LoadingOverlayPro(
          isLoading: controller.isloading.value,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formkey,
              child: Padding(
                padding: EdgeInsets.only(
                    top: heightSize(25),
                    right: widthSize(30),
                    left: widthSize(30),
                    bottom: heightSize(30)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "STUDENT INFORMATION",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w600,
                            color: maincolor),
                      ),
                      SizedBox(height: heightSize(38)),
                      Center(
                          child: PickingImage(
                        image: controller2.studentImage,
                      )),
                      SizedBox(height: heightSize(52)),
                      Text(
                        "First Name",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF555555)),
                      ),
                      SizedBox(height: heightSize(10)),
                      SizedBox(
                        height: heightSize(65),
                        child: InputTextField(
                          controller: controller.firstname,
                          obscureText: false,
                          hintText: "Input your first name",
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return "Please enter your Home Address";
                            }
                          },
                        ),
                      ),
                      SizedBox(height: heightSize(20)),
                      Text(
                        "Last Name",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF555555)),
                      ),
                      SizedBox(height: heightSize(10)),
                      SizedBox(
                        height: heightSize(65),
                        child: InputTextField(
                          controller: controller.lastname,
                          obscureText: false,
                          hintText: "Input your last name",
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return "Please enter your Home Address";
                            }
                          },
                        ),
                      ),
                      SizedBox(height: heightSize(20)),
                      Text(
                        "Guardian Full-Name",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF555555)),
                      ),
                      SizedBox(height: heightSize(10)),
                      SizedBox(
                        height: heightSize(65),
                        child: InputTextField(
                          controller: controller.guardianName,
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return "Please enter your Home Address";
                            }
                          },
                          obscureText: false,
                          hintText: "Input gaurdian name",
                        ),
                      ),
                      SizedBox(height: heightSize(20)),
                      Text(
                        "Gender",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF555555)),
                      ),
                      SizedBox(height: heightSize(10)),
                      const GenderSelectWIdget(),
                      SizedBox(height: heightSize(20)),
                      const PhoneFieldInput(),
                      SizedBox(height: heightSize(20)),
                      Text(
                        "Date of Birth",
                        style: TextStyle(
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF555555)),
                      ),
                      SizedBox(height: heightSize(10)),
                      const GetDateWidget(),
                      SizedBox(height: heightSize(20)),
                      const GetBloodGroup(),
                      SizedBox(height: heightSize(20)),
                      SizedBox(
                        height: heightSize(116),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Home Address",
                                  style: TextStyle(
                                      fontSize: fontSize(14),
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                  height: heightSize(87),
                                  child: TextFormField(
                                    controller: controller.homeAddress,
                                    validator: (String? val) {
                                      if (val!.isEmpty) {
                                        return "Please enter your Home Address";
                                      }
                                    },
                                    maxLines: 3,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.grey)),
                                        hintStyle: TextStyle(
                                            fontSize: fontSize(14),
                                            fontWeight: FontWeight.w400),
                                        hintText:
                                            "2715 Ash Dr. San Jose, South Dakota 83475"),
                                  ))
                            ]),
                      ),
                      SizedBox(height: heightSize(36)),
                      AppButtons(
                          textColor: whitecolor,
                          fontSize: fontSize(14),
                          backgroundColor: maincolor,
                          text: "Continue",
                          borderColor: maincolor,
                          height: heightSize(65),
                          onTap: () async {
                            var clear = formkey.currentState;
                            if (clear!.validate()) {
                              controller.isloading.value = true;
                              if (controller2.image!.path.isEmpty) {
                                controller.isloading.value = false;
                                getErrorSnackBar(
                                    "Please provide an Image for the Student");
                              } else {
                                final response =
                                    await controller2.cloudinary.upload(
                                  file: controller2.image!.path,
                                  // fileBytes: file.readAsBytesSync(),
                                  resourceType: CloudinaryResourceType.image,
                                  // folder: "Profile Folder",
                                  fileName: controller.firstname.text.trim(),
                                );

                                if (response.isSuccessful) {
                                  controller.studentImage.value =
                                      "${response.secureUrl}";

                                  controller.isloading.value = false;

                                  getSuccessSnackBar(
                                      "Image stored Successfully");

                                  Get.to(() => TeacherStudentInputField2(
                                        type: "Student",
                                      ));
                                } else {
                                  controller.isloading.value = false;
                                  getErrorSnackBar("Image was not stored");
                                }
                              }
                            } else {
                              getErrorSnackBar(
                                  "Please enter all necessary fields");
                            }
                          })
                    ]),
              ),
            ),
          ),
        );
      }),
    );
  }
}
