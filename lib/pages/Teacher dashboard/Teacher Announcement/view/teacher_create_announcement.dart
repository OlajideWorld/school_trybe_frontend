// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/common/alertMessage.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/pages/School%20Dashboard/home%20screen/controller/adminController.dart';
import 'package:school_management/pages/Teacher%20dashboard/DashBoard/controller/teacher_controller.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Announcement/controller/teacher_announce_controller.dart';

import '../../../../common/getxmessage.dart';
import '../../../../routes/routes.dart';
import '../../../../services/api_calls.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../SIgn-In Page/widget/textFieldWidget.dart';
import '../widget/annouce_success.dart';

class TeacherCreateAnnouncementPage extends StatefulWidget {
  const TeacherCreateAnnouncementPage({super.key});

  @override
  State<TeacherCreateAnnouncementPage> createState() =>
      _TeacherCreateAnnouncementPageState();
}

class _TeacherCreateAnnouncementPageState
    extends State<TeacherCreateAnnouncementPage> {
  final TeacherAnnounceController announcecontroller =
      TeacherAnnounceController.instance;
  final RegistrationController controller2 = RegistrationController.instance;

  Future pickImage(ImageSource source) async {
    try {
      final picture = await ImagePicker().pickImage(source: source);
      if (picture == null) return;
      File? newpicture = File(picture.path);
      setState(() {
        announcecontroller.teacherAnnounce = newpicture;
        Get.back();
      });
      return announcecontroller.teacherAnnounce;
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

  final TextEditingController announcement = TextEditingController();

  final TextEditingController description = TextEditingController();

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
              SizedBox(width: widthSize(38.5)),
              Text(
                'Create announcement',
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
          isLoading: announcecontroller.isloading.value,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                  top: heightSize(44),
                  left: widthSize(30),
                  right: widthSize(30),
                  bottom: heightSize(20)),
              child: Column(children: [
                GestureDetector(
                  onTap: () => showSheet(context),
                  child: SizedBox(
                    height: heightSize(270),
                    width: widthSize(368),
                    child: announcecontroller.teacherAnnounce != null
                        ? Image.file(
                            announcecontroller.teacherAnnounce!,
                            fit: BoxFit.fitHeight,
                          )
                        : DottedBorder(
                            color: maincolor,
                            dashPattern: const [5, 4],
                            radius: const Radius.circular(10),
                            strokeCap: StrokeCap.round,
                            borderType: BorderType.RRect,
                            child: SizedBox(
                                height: heightSize(270),
                                width: widthSize(368),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.folder_open_outlined,
                                        color: maincolor,
                                        size: 56,
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        'Take a picture or upload',
                                        style: TextStyle(
                                            color: maincolor,
                                            fontSize: fontSize(17),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ])),
                          ),
                  ),
                ),
                SizedBox(height: heightSize(30)),
                TextFieldWidgetRegister(
                    password: false,
                    label: "Announcement Title",
                    hinttext: "Sport day activities",
                    obscure: false,
                    controller: announcement),
                SizedBox(height: heightSize(30)),
                SizedBox(
                  height: heightSize(207),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Details",
                            style: TextStyle(
                                fontSize: fontSize(14),
                                fontWeight: FontWeight.w600)),
                        SizedBox(
                            height: heightSize(178),
                            child: TextFormField(
                              controller: description,
                              validator: (String? val) {
                                if (val!.isEmpty) {
                                  return "Please enter description";
                                }
                              },
                              maxLines: 7,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  hintStyle: TextStyle(
                                      fontSize: fontSize(14),
                                      fontWeight: FontWeight.w400),
                                  hintText:
                                      "Lorem ipsum dolor sit amet consectetur. Quam eget pulvinar sapien tempus risus duis vel turpis facilisis. Mi posuere neque eget magna id quisque. Enim purus dictum nunc amet sed massa lorem tincidunt. Platea tellus faucibus nam elit quam tortor iaculis est. Vesti"),
                            ))
                      ]),
                ),
                SizedBox(height: heightSize(31)),
                AppButtons(
                  textColor: whitecolor,
                  fontSize: fontSize(14),
                  backgroundColor: maincolor,
                  text: "Create announcement",
                  borderColor: maincolor,
                  height: heightSize(60),
                  onTap: () async {
                    announcecontroller.isloading.value = true;

                    final response = await controller2.cloudinary.upload(
                      file: announcecontroller.teacherAnnounce!.path,
                      // fileBytes: file.readAsBytesSync(),
                      resourceType: CloudinaryResourceType.image,
                      // folder: "Profile Folder",
                      fileName: announcement.text.trim(),
                    );

                    if (response.isSuccessful) {
                      getSuccessSnackBar("Image Stored Successfully");
                      final model = {
                        "affiliateID": controller2.teachermodel.value.createdBy,
                        "image": "${response.secureUrl}",
                        "title": announcement.text.trim(),
                        "details": description.text.trim()
                      };

                      await ApiCalls().createAnnouncement(model);

                      announcecontroller.isloading.value = false;
                      showAlertMessage(
                          context,
                          false,
                          heightSize(309),
                          widthSize(312),
                          "assets/Teacher_Dash/goodtick_green.png",
                          heightSize(147),
                          const AnnounceSuccess());
                      await Future.delayed(const Duration(seconds: 2), () {
                        Get.offNamed(SchoolRoutes.homeScreen);
                      });
                    } else {
                      announcecontroller.isloading.value = false;
                      getErrorSnackBar(
                          "Check Internet, Could not upload image");
                    }
                  },
                ),
              ]),
            ),
          ),
        );
      }),
    );
  }
}
