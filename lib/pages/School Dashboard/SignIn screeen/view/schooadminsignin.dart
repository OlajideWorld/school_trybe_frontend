// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:cloudinary/cloudinary.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/common/getxmessage.dart';
import 'package:school_management/services/api_calls.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../common/alertMessage.dart';
import '../../../../common/custom-text.dart';
import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/SIgn-In Page/controller/registrationController.dart';
import '../../../Teacher dashboard/SIgn-In Page/widget/CountryPickwidget.dart';
import '../../../Teacher dashboard/SIgn-In Page/widget/phonefield.dart';
import '../../../Teacher dashboard/SIgn-In Page/widget/pickimagescreen.dart';
import '../../../Teacher dashboard/SIgn-In Page/widget/textFieldWidget.dart';
import '../../../Teacher dashboard/SIgn-In Page/widget/verifyemailMessage.dart';

class SchoolAdminSignInScreen extends StatelessWidget {
  SchoolAdminSignInScreen({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController emailaddress = TextEditingController();
  final TextEditingController position = TextEditingController();
  final TextEditingController homeAddress = TextEditingController();
  final RegistrationController controller = RegistrationController.instance;

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
                  child: backbutton()),
              SizedBox(width: widthSize(43.5)),
              Text(
                'School Administrator',
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
                  bottom: heightSize(30)),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CText(
                        text: "Tell us more about you",
                        color: Color(0xFF04100A),
                        size: 20,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(height: heightSize(10)),
                      const CText(
                        text: "Kindly fill in your personal details",
                        color: Color(0xFF555555),
                        size: 14,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: heightSize(30)),
                      TextFieldWidgetRegister(
                          label: "First Name",
                          hinttext: "Input your first name",
                          obscure: false,
                          password: false,
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return "Please enter your name";
                            }
                            return null;
                          },
                          controller: name),
                      SizedBox(height: heightSize(20)),
                      TextFieldWidgetRegister(
                          label: "Last Name",
                          hinttext: "Input your last name",
                          obscure: false,
                          password: false,
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return "Please enter your last name";
                            }
                            return null;
                          },
                          controller: lastname),
                      SizedBox(height: heightSize(20)),
                      TextFieldWidgetRegister(
                          label: "Email Address",
                          hinttext: "e.g example@gmail.com",
                          obscure: false,
                          password: false,
                          validator: (String? val) {
                            if (val!.isEmpty || !EmailValidator.validate(val)) {
                              return "Please enter an email address that is valid";
                            }
                            return null;
                          },
                          controller: emailaddress),
                      SizedBox(height: heightSize(20)),
                      TextFieldWidgetRegister(
                          label: "Position / Role",
                          hinttext: "e.g Principal, vice principal",
                          obscure: false,
                          password: false,
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return "Please enter your position or role";
                            }
                            return null;
                          },
                          controller: position),
                      SizedBox(height: heightSize(20)),
                      const PhoneFieldInput(),
                      SizedBox(height: heightSize(20)),
                      const CountryPickerWidget(),
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
                                    controller: homeAddress,
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
                      SizedBox(height: heightSize(50)),
                      AppButtons(
                          textColor: whitecolor,
                          fontSize: fontSize(14),
                          backgroundColor: maincolor,
                          text: "Continue",
                          borderColor: maincolor,
                          height: heightSize(60),
                          onTap: () async {
                            var clear = formkey.currentState;
                            if (clear!.validate()) {
                              controller.isLoading.value = true;

                              final model = {
                                "firstname": name.text.trim(),
                                "password": "",
                                "lastname": lastname.text.trim(),
                                "email": emailaddress.text.trim(),
                                "position": position.text.trim(),
                                "phoneNumber": controller.phoneNumber.value,
                                "country": controller.country.value,
                                "address": homeAddress.text.trim(),
                                "notification": true,
                                "image": controller.uploadedImage.value
                              };
                              controller.userCredentials.value =
                                  await ApiCalls().signIn(model);
                              if (controller.userCredentials.value != null) {
                                controller.isLoading.value = false;
                                showAlertMessageTeacher(
                                    context,
                                    false,
                                    heightSize(432),
                                    widthSize(368),
                                    "assets/Teacher_Dash/message2.png",
                                    heightSize(109),
                                    VerifyEmailMessage(
                                      type: "schoolAdmin",
                                      email: controller
                                          .userCredentials.value.email,
                                    ));
                              }
                            } else {
                              controller.isLoading.value = false;
                              getErrorSnackBar(
                                  "Please fill the necessary fields");
                            }
                          }),
                      SizedBox(height: heightSize(20)),
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
