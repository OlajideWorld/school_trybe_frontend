import 'package:cloudinary/cloudinary.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/pages/Parent%20DashBoard/Parents%20Sign%20Up/views/parents_school_details.dart';
import 'package:school_management/pages/Teacher%20dashboard/DashBoard/controller/teacher_controller.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/widget/textFieldWidget.dart';

import '../../../../common/button.dart';
import '../../../../common/custom-text.dart';
import '../../../../common/getxmessage.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/SIgn-In Page/controller/registrationController.dart';
import '../../../Teacher dashboard/SIgn-In Page/widget/CountryPickwidget.dart';
import '../../../Teacher dashboard/SIgn-In Page/widget/SelectionWidget.dart';
import '../../../Teacher dashboard/SIgn-In Page/widget/phonefield.dart';
import '../../../Teacher dashboard/SIgn-In Page/widget/pickimagescreen.dart';

class ParentsRegistrationScreen extends StatelessWidget {
  ParentsRegistrationScreen({super.key});

  final RegistrationController regController = RegistrationController.instance;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        regController.isLoading.value = false;
        return false;
      },
      child: Scaffold(
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
                SizedBox(width: widthSize(66.5)),
                Text(
                  'Parent Registration',
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
            isLoading: regController.isLoading.value,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return SizedBox(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            width: constraints.maxWidth,
                            height: heightSize(100),
                            padding: EdgeInsets.only(
                              top: heightSize(20),
                              left: widthSize(20),
                              bottom: heightSize(20),
                            ),
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CText(
                                    text: "Create your account",
                                    color: Color(0xFF04100A),
                                    size: 20,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w700,
                                  ),
                                  SizedBox(height: heightSize(20)),
                                  const CText(
                                    text: "Already an account? Login",
                                    color: Color(0xFF222222),
                                    size: 14,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w400,
                                  )
                                ]),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: widthSize(30)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Personal Details',
                                  style: TextStyle(
                                      color: maincolor,
                                      fontSize: fontSize(14),
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                          SizedBox(height: heightSize(37)),
                          Align(
                              alignment: Alignment.center,
                              child: PickingImage(
                                image: regController.schoolLogo,
                              )),
                          SizedBox(height: heightSize(46)),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: widthSize(30)),
                            child: Form(
                              key: formkey,
                              autovalidateMode: AutovalidateMode.always,
                              child: Column(children: [
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
                                    controller: regController.name),
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
                                    controller: regController.lastName),
                                SizedBox(height: heightSize(20)),
                                TextFieldWidgetRegister(
                                    label: "Email Address",
                                    hinttext: "e.g example@gmail.com",
                                    obscure: false,
                                    password: false,
                                    validator: (String? val) {
                                      if (val!.isEmpty ||
                                          !EmailValidator.validate(val)) {
                                        return "Please enter a valid email";
                                      }
                                      return null;
                                    },
                                    controller: regController.emailAddress),

                                SizedBox(height: heightSize(20)),
                                const PhoneFieldInput(),
                                SizedBox(height: heightSize(20)),

                                TextFieldWidgetRegister(
                                    label: "NIN",
                                    hinttext: "NIN",
                                    obscure: false,
                                    password: false,
                                    keyboardtype: TextInputType.number,
                                    controller: regController.nin),

                                SizedBox(height: heightSize(20)),

                                // Marital Status
                                SizedBox(
                                    height: heightSize(94),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Marital Status",
                                            style: TextStyle(
                                                fontSize: fontSize(14),
                                                fontWeight: FontWeight.w600)),
                                        const SelectMaritalStatus(),
                                      ],
                                    )),
                                SizedBox(height: heightSize(20)),

                                // Teacher Gender
                                SizedBox(
                                  height: heightSize(94),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Gender",
                                          style: TextStyle(
                                              fontSize: fontSize(14),
                                              fontWeight: FontWeight.w600)),
                                      const SelectTeacherGender(),
                                    ],
                                  ),
                                ),
                                SizedBox(height: heightSize(20)),

                                TextFieldWidgetRegister(
                                    label: "State Of Origin",
                                    hinttext: "State Of Origin",
                                    obscure: false,
                                    password: false,
                                    validator: (String? val) {
                                      if (val!.isEmpty) {
                                        return "Please enter your State of Origin";
                                      }
                                      return null;
                                    },
                                    controller: regController.origin),

                                SizedBox(height: heightSize(20)),
                                // Country textField
                                //
                                const CountryPickerWidget(),
                                //
                                SizedBox(height: heightSize(20)),

                                TextFieldWidgetRegister(
                                    label: "Occupation",
                                    hinttext: "Occupation",
                                    obscure: false,
                                    password: false,
                                    keyboardtype: TextInputType.text,
                                    validator: (String? val) {
                                      if (val!.isEmpty) {
                                        return "Please state your Occupation";
                                      }
                                      return null;
                                    },
                                    controller: regController.occupation),

                                SizedBox(height: heightSize(20)),
                                // Home Address
                                SizedBox(
                                  height: heightSize(116),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Residential Address",
                                            style: TextStyle(
                                                fontSize: fontSize(14),
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                            height: heightSize(87),
                                            child: TextFormField(
                                              controller: regController.address,
                                              validator: (String? val) {
                                                if (val!.isEmpty) {
                                                  return "Please enter your Home Address";
                                                }
                                              },
                                              maxLines: 3,
                                              textInputAction:
                                                  TextInputAction.done,
                                              decoration: InputDecoration(
                                                  border:
                                                      const OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey)),
                                                  hintStyle: TextStyle(
                                                      fontSize: fontSize(14),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  hintText:
                                                      "2715 Ash Dr. San Jose, South Dakota 83475"),
                                            ))
                                      ]),
                                ),
                                SizedBox(height: heightSize(22)),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: widthSize(30)),
                                  child: SizedBox(
                                    height: heightSize(93),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppButtons(
                                              textColor: whitecolor,
                                              fontSize: fontSize(14),
                                              backgroundColor: maincolor,
                                              text: "Continue",
                                              borderColor: maincolor,
                                              height: heightSize(60),
                                              onTap: () async {
                                                final clear =
                                                    formkey.currentState;

                                                if (clear!.validate() ||
                                                    regController.image !=
                                                        null) {
                                                  regController
                                                      .isLoading.value = true;

                                                  final response =
                                                      await regController
                                                          .cloudinary
                                                          .upload(
                                                    file: regController
                                                        .image!.path,
                                                    // fileBytes: file.readAsBytesSync(),
                                                    resourceType:
                                                        CloudinaryResourceType
                                                            .image,
                                                    // folder: "Profile Folder",
                                                    fileName: regController
                                                        .name.text
                                                        .trim(),
                                                  );

                                                  if (response.isSuccessful) {
                                                    regController.isLoading
                                                        .value = false;
                                                    regController
                                                            .parentImage.value =
                                                        response.secureUrl!;

                                                    Get.to(() =>
                                                        ParentsRegistrationScreen2());
                                                  }
                                                } else {
                                                  getErrorSnackBar(
                                                      "please select an Image for your profile");
                                                }
                                              }),
                                          SizedBox(
                                            height: 23,
                                            width: widthSize(171),
                                            child: Text(
                                              "Already an account? Login",
                                              style: TextStyle(
                                                  fontSize: fontSize(14),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          )
                                        ]),
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            ),
          );
        }),
      ),
    );
  }
}
