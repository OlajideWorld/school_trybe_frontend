// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';

import '../../../../common/getxmessage.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class PickingImage extends StatefulWidget {
  File? image;
  PickingImage({super.key, required this.image});

  @override
  State<PickingImage> createState() => _PickingImageState();
}

class _PickingImageState extends State<PickingImage> {
  final RegistrationController controller = RegistrationController.instance;

  Future pickImage(ImageSource source) async {
    try {
      final picture = await ImagePicker().pickImage(source: source);
      if (picture == null) return;
      File? newpicture = File(picture.path);
      setState(() {
        controller.image = newpicture;
        widget.image = newpicture;
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
    return SizedBox(
      height: heightSize(109),
      width: widthSize(123),
      child: GestureDetector(
        onTap: () => showSheet(context),
        child: Stack(
          children: [
            Positioned(
              right: widthSize(10),
              top: heightSize(0),
              bottom: heightSize(0),
              left: widthSize(0),
              child: Container(
                height: heightSize(109),
                decoration: const BoxDecoration(
                    color: Color(0xFFE6E6E6), shape: BoxShape.circle),
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
            Positioned(
              bottom: heightSize(0),
              left: widthSize(70),
              top: heightSize(60),
              right: widthSize(0),
              child: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                height: heightSize(44),
                width: widthSize(44),
                child: Image.asset("assets/Teacher_Dash/profileCamera.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
