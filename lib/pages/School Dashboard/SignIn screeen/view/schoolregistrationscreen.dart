import 'package:cloudinary/cloudinary.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/pages/School%20Dashboard/SignIn%20screeen/view/admin_create_password.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';
import 'package:school_management/services/api_calls.dart';
import 'package:school_management/utils/colors.dart';
import 'package:school_management/utils/sizes.dart';

import '../../../../common/button.dart';
import '../../../../common/custom-text.dart';
import '../../../../common/getxmessage.dart';
import '../../../Teacher dashboard/SIgn-In Page/widget/CountryPickwidget.dart';
import '../../../Teacher dashboard/SIgn-In Page/widget/phonefield.dart';
import '../../../Teacher dashboard/SIgn-In Page/widget/pickimagescreen.dart';
import '../../../Teacher dashboard/SIgn-In Page/widget/textFieldWidget.dart';
import '../widget/schoolregistrationwidget.dart';

class SchoolRegistrationAdminScreen extends StatelessWidget {
  SchoolRegistrationAdminScreen({super.key});

  final TextEditingController schoolname = TextEditingController();
  final TextEditingController schoolEmail = TextEditingController();
  final TextEditingController schoolAddress = TextEditingController();
  final RegistrationController controller = RegistrationController.instance;

  RxBool isLoading = false.obs;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(heightSize(100)),
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
              SizedBox(width: widthSize(52.5)),
              Text(
                'School Administrator ',
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
          isLoading: controller.isLoading.value,
          child: Form(
            key: formkey,
            child: Padding(
              padding: EdgeInsets.only(
                  top: heightSize(34),
                  right: widthSize(30),
                  left: widthSize(30),
                  bottom: heightSize(61)),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CText(
                        text: "School Information",
                        color: Color(0xFF04100A),
                        size: 20,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(height: heightSize(10)),
                      const CText(
                        text: "Kindly fill the details of your school",
                        color: Color(0xFF555555),
                        size: 14,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: heightSize(30)),
                      TextFieldWidgetRegister(
                          label: "School Name",
                          hinttext: "Input your first name",
                          obscure: false,
                          password: false,
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return "Please enter your name";
                            }
                            return null;
                          },
                          controller: schoolname),
                      SizedBox(height: heightSize(20)),
                      TextFieldWidgetRegister(
                          label: "School Eamil",
                          hinttext: "Input the email of the school",
                          obscure: false,
                          password: false,
                          validator: (String? val) {
                            if (val!.isEmpty || !EmailValidator.validate(val)) {
                              return "Please enter an email address that is valid";
                            }
                            return null;
                          },
                          controller: schoolEmail),
                      SizedBox(height: heightSize(20)),
                      const PhoneFieldInput(),
                      SizedBox(height: heightSize(20)),
                      SizedBox(
                        height: heightSize(116),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("School Address",
                                  style: TextStyle(
                                      fontSize: fontSize(14),
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                  height: heightSize(87),
                                  child: TextFormField(
                                    controller: schoolAddress,
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
                      SizedBox(height: heightSize(20)),
                      const CountryPickerWidget(),
                      SizedBox(height: heightSize(20)),
                      SchoolRegistrationAdmminWidget(),
                      SizedBox(height: heightSize(20)),
                      const SchoolTypeSchoolregistration(),
                      SizedBox(height: heightSize(41)),
                      AppButtons(
                          textColor: whitecolor,
                          fontSize: fontSize(14),
                          backgroundColor: maincolor,
                          text: "Signup",
                          borderColor: maincolor,
                          height: heightSize(60),
                          onTap: () async {
                            var clear = formkey.currentState;
                            if (clear!.validate()) {
                              controller.isLoading.value = true;
                              controller.schoolName.value =
                                  schoolname.text.trim();

                              final model = {
                                "image": controller.uploadedImage.value,
                                "schoolName": controller.schoolName.value,
                                "totalStudentRange":
                                    controller.schoolsize2.value,
                                "email": schoolEmail.text.trim(),
                                "schoolType": controller.schoolType,
                                "phoneNumber": controller.phoneNumber.value,
                                "address": schoolAddress.text.trim(),
                                "country": controller.country.value
                              };

                              controller.schoolModel.value =
                                  await ApiCalls().createSchool(model);

                              if (controller.schoolModel.value != null) {
                                controller.isLoading.value = false;

                                Get.to(() => AdminRegistrationScreen3(
                                      type: "schoolAdmin",
                                    ));
                              } else {
                                controller.isLoading.value = false;
                                getErrorSnackBar(
                                    "Not Sucessful in storing School data");
                              }
                            } else {
                              getErrorSnackBar(
                                  "Please fill in the necessary fields before proceeding");
                            }
                          }),
                      SizedBox(height: heightSize(10)),
                      Align(
                        child: Text(
                          "Already an account? Login",
                          style: TextStyle(
                              fontSize: fontSize(14),
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ]),
              ),
            ),
          ),
        );
      }),
    );
  }
}
