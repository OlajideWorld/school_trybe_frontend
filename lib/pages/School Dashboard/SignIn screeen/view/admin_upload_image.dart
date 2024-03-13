// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

import 'package:school_management/common/custom-text.dart';
import 'package:school_management/pages/School%20Dashboard/SignIn%20screeen/view/schooadminsignin.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../common/button.dart';
import '../../../../common/getxmessage.dart';
import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/SIgn-In Page/controller/registrationController.dart';

class AdminImageUpload extends StatefulWidget {
  File? image;
  AdminImageUpload({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  State<AdminImageUpload> createState() => _AdminImageUploadState();
}

class _AdminImageUploadState extends State<AdminImageUpload> {
  final RegistrationController controller = RegistrationController.instance;

  Future pickImage(ImageSource source) async {
    try {
      final picture = await ImagePicker().pickImage(source: source);
      if (picture == null) return;
      File? newpicture = File(picture.path);
      setState(() {
        controller.image = newpicture;
        widget.image = newpicture;
        controller.uploadedImage.value = newpicture.path;
        Get.back();
      });
      return controller.image;
    } on PlatformException catch (e) {
      return getErrorSnackBar("Failed to pick an Image, $e");
    }
  }

  showSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text(
                  "Camera",
                  style: TextStyle(color: maincolor),
                ),
                onTap: () => pickImage(ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text(
                  "Gallery",
                  style: TextStyle(color: maincolor),
                ),
                onTap: () => pickImage(ImageSource.gallery),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: Obx(() {
        return LoadingOverlayPro(
          isLoading: controller.isLoading.value,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SizedBox(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(children: [
                    Container(
                      height: heightSize(134),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(color: maincolor),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: heightSize(69),
                            left: widthSize(30),
                            bottom: heightSize(28.5)),
                        child: Row(children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: backbutton()),
                          SizedBox(width: widthSize(70.5)),
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
                    SizedBox(height: heightSize(28)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: widthSize(20)),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CText(
                                text: "Add a profile pic",
                                color: Color(0xFF04100A),
                                size: 20,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(height: heightSize(10)),
                              const CText(
                                text:
                                    "Kindly add a profile picture of yourself",
                                color: Color(0xFF555555),
                                size: 14,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(height: heightSize(30)),
                              GestureDetector(
                                onTap: () => showSheet(context),
                                child: Container(
                                  height: heightSize(400),
                                  width: widthSize(400),
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFE6E6E6),
                                      shape: BoxShape.circle),
                                  child: widget.image != null
                                      ? ClipOval(
                                          child: Image.file(
                                          widget.image!,
                                          fit: BoxFit.fitWidth,
                                        ))
                                      : ClipOval(
                                          child: Image.asset(
                                            "assets/Teacher_Dash/profileImage.png",
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                ),
                              ),
                              SizedBox(height: heightSize(100)),
                              controller.uploadedImage.value == ""
                                  ? Container()
                                  : AppButtons(
                                      textColor: whitecolor,
                                      fontSize: fontSize(14),
                                      backgroundColor: maincolor,
                                      text: "Continue",
                                      borderColor: maincolor,
                                      height: heightSize(60),
                                      onTap: () async {
                                        controller.isLoading.value = true;
                                        final response =
                                            await controller.cloudinary.upload(
                                          file: controller.image!.path,
                                          // fileBytes: file.readAsBytesSync(),
                                          resourceType:
                                              CloudinaryResourceType.image,
                                          // folder: "Profile Folder",
                                          // fileName: name.text.trim(),
                                        );
                                        if (response.isSuccessful) {
                                          controller.isLoading.value = false;
                                          controller.uploadedImage.value =
                                              response.secureUrl!;
                                          getSuccessSnackBar(
                                              "Image stored Successfuly");
                                          Get.to(
                                              () => SchoolAdminSignInScreen());
                                        } else {
                                          controller.isLoading.value = false;
                                          getErrorSnackBar(
                                              "Image Upload Error");
                                        }
                                      }),
                              SizedBox(height: heightSize(20)),
                              // Align(
                              //   child: Text(
                              //     "Already an account? Login",
                              //     style: TextStyle(
                              //         fontSize: fontSize(14),
                              //         fontWeight: FontWeight.w400),
                              //   ),
                              // )
                            ]),
                      ),
                    )
                  ]),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
