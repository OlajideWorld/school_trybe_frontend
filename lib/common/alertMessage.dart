// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/pages/School%20Dashboard/home%20screen/controller/adminController.dart';
import 'package:school_management/services/api_services.dart';

import '../pages/Teacher dashboard/SIgn-In Page/controller/registrationController.dart';

AdminController adminController = AdminController.instance;
RegistrationController regController = RegistrationController.instance;

showAlertMessage(
  BuildContext context,
  bool svg,
  double height,
  double width,
  String image,
  double imageheight,
  Widget message,
) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Obx(() {
          return LoadingOverlayPro(
            isLoading: adminController.isloading.value,
            child: AlertDialog(
              title: SizedBox(
                height: height,
                width: width,
                child: Column(children: [
                  SizedBox(
                      height: imageheight,
                      child:
                          svg ? SvgPicture.asset(image) : Image.asset(image)),
                  message
                ]),
              ),
            ),
          );
        });
      });
}

showAlertMessageTeacher(
  BuildContext context,
  bool svg,
  double height,
  double width,
  String image,
  double imageheight,
  Widget message,
) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Obx(() {
          return LoadingOverlayPro(
            isLoading: regController.isLoading.value,
            child: AlertDialog(
              title: SizedBox(
                height: height,
                width: width,
                child: Column(children: [
                  SizedBox(
                      height: imageheight,
                      child:
                          svg ? SvgPicture.asset(image) : Image.asset(image)),
                  message
                ]),
              ),
            ),
          );
        });
      });
}
