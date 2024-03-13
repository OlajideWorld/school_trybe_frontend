// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/common/input_TextField.dart';
import 'package:school_management/models/event_model.dart';
import 'package:school_management/pages/School%20Dashboard/home%20screen/controller/adminController.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Events/widget/eventsSuccess.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';
import 'package:school_management/routes/routes.dart';
import 'package:school_management/services/api_calls.dart';

import '../../../../common/alertMessage.dart';
import '../../../../common/getxmessage.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class AdminCreateEventsScreen extends StatefulWidget {
  const AdminCreateEventsScreen({super.key});

  @override
  State<AdminCreateEventsScreen> createState() =>
      _AdminCreateEventsScreenState();
}

class _AdminCreateEventsScreenState extends State<AdminCreateEventsScreen> {
  final TextEditingController title = TextEditingController();

  final TextEditingController venue = TextEditingController();

  final TextEditingController description = TextEditingController();

  final AdminController controller = AdminController.instance;
  final RegistrationController controller2 = RegistrationController.instance;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Future pickImage(ImageSource source) async {
    try {
      final picture = await ImagePicker().pickImage(source: source);
      if (picture == null) return;
      File? newpicture = File(picture.path);
      setState(() {
        controller.eventImage = newpicture;
        Get.back();
      });
      return controller.eventImage;
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

  DateTime dateTime = DateTime(2023, 05, 12, 5, 30);
  DateTime dateTime2 = DateTime(2022, 2, 2, 4, 30);
  DateTime dateTime3 = DateTime(2022, 2, 2, 4, 30);

  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, "0");
    final minutes = dateTime.minute.toString().padLeft(2, "0");

    final newhours = dateTime2.hour.toString().padLeft(2, "0");
    final newminutes = dateTime2.minute.toString().padLeft(2, "0");
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
              SizedBox(width: widthSize(79.5)),
              Text(
                'Create events',
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
          isLoading: controller.isloadingEvents.value,
          child: Form(
            key: formkey,
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
                      child: controller.eventImage != null
                          ? Image.file(
                              controller.eventImage!,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                  SizedBox(height: heightSize(32.5)),
                  SizedBox(
                    height: heightSize(97),
                    width: widthSize(368),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              height: heightSize(24),
                              width: widthSize(120),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.event,
                                    size: heightSize(24),
                                    color: textColor3,
                                  ),
                                  Text(
                                    'Event Title',
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: fontSize(14),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: heightSize(63),
                            child: InputTextField(
                              obscureText: false,
                              controller: title,
                              hintText: "Sport day activities",
                              textInputAction: true,
                              validator: (String? val) {
                                if (val!.isEmpty) {
                                  return "Please enter your Event Title";
                                }
                              },
                            ),
                          )
                        ]),
                  ),
                  SizedBox(height: heightSize(30)),
                  SizedBox(
                    height: heightSize(97),
                    width: widthSize(368),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: heightSize(24),
                              width: widthSize(120),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: heightSize(24),
                                    color: textColor3,
                                  ),
                                  Text(
                                    'Event Venue',
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: fontSize(14),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: heightSize(63),
                            child: InputTextField(
                              obscureText: false,
                              controller: venue,
                              hintText: "Sport day activities",
                              textInputAction: true,
                            ),
                          )
                        ]),
                  ),
                  SizedBox(height: heightSize(30)),
                  SizedBox(
                      height: heightSize(97),
                      width: widthSize(368),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //
                          SizedBox(
                            height: heightSize(97),
                            width: widthSize(170),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Start Time",
                                    style: TextStyle(
                                        fontSize: fontSize(14),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      final newdate = await pickTIme();
                                      if (newdate == null) return;

                                      final date = DateTime(
                                          dateTime.year,
                                          dateTime.month,
                                          dateTime.day,
                                          newdate.hour,
                                          newdate.minute);

                                      setState(() {
                                        dateTime = date;
                                      });
                                    },
                                    child: Container(
                                      height: heightSize(63),
                                      width: widthSize(170),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: widthSize(23)),
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              61, 64, 128, 0.05),
                                          border: Border.all(color: maincolor),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Row(children: [
                                        Icon(
                                          Icons.alarm_sharp,
                                          size: heightSize(20),
                                          color: textColor3,
                                        ),
                                        SizedBox(width: widthSize(8)),
                                        Text(
                                          "$hours : $minutes",
                                          style: TextStyle(
                                              color: maincolor,
                                              fontSize: fontSize(18),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ]),
                                    ),
                                  )
                                ]),
                          ),

                          //
                          SizedBox(
                            height: heightSize(97),
                            width: widthSize(170),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "End Time",
                                    style: TextStyle(
                                        fontSize: fontSize(14),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      final newdate = await pickTIme();
                                      if (newdate == null) return;

                                      final date = DateTime(
                                          dateTime2.year,
                                          dateTime2.month,
                                          dateTime2.day,
                                          newdate.hour,
                                          newdate.minute);

                                      setState(() {
                                        dateTime2 = date;
                                      });
                                    },
                                    child: Container(
                                      height: heightSize(63),
                                      width: widthSize(170),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: widthSize(23)),
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              61, 64, 128, 0.05),
                                          border: Border.all(color: maincolor),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Row(children: [
                                        Icon(
                                          Icons.alarm,
                                          size: heightSize(20),
                                          color: textColor3,
                                        ),
                                        SizedBox(width: widthSize(8)),
                                        Text(
                                          "$newhours : $newminutes",
                                          style: TextStyle(
                                              color: maincolor,
                                              fontSize: fontSize(18),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ]),
                                    ),
                                  )
                                ]),
                          ),
                        ],
                      )),
                  SizedBox(height: heightSize(30)),
                  SizedBox(
                    height: heightSize(97),
                    width: widthSize(368),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date",
                            style: TextStyle(
                                fontSize: fontSize(14),
                                fontWeight: FontWeight.w600),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final date = await pickDate();
                              if (date == null) return;

                              final newdate = DateTime(date.year, date.month,
                                  date.day, dateTime.hour, dateTime.minute);

                              setState(() {
                                dateTime3 = newdate;
                              });
                            },
                            child: Container(
                              height: heightSize(63),
                              width: widthSize(368),
                              padding: EdgeInsets.symmetric(
                                  horizontal: widthSize(23)),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(61, 64, 128, 0.05),
                                  border: Border.all(color: maincolor),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5))),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${dateTime3.year} / ${dateTime3.month} / ${dateTime3.day}",
                                      style: TextStyle(
                                          color: maincolor,
                                          fontSize: fontSize(18),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Icon(
                                      Icons.calendar_today,
                                      size: heightSize(20),
                                      color: textColor3,
                                    )
                                  ]),
                            ),
                          )
                        ]),
                  ),
                  SizedBox(height: heightSize(30)),
                  SizedBox(
                    height: heightSize(206),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Event Description",
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: fontSize(14),
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: heightSize(10)),
                          TextFormField(
                            controller: description,
                            validator: (String? val) {
                              if (val!.isEmpty) {
                                return "Please enter your Event Description";
                              }
                            },
                            maxLines: 5,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: heightSize(20),
                                    left: widthSize(20),
                                    right: widthSize(19)),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                hintStyle: TextStyle(
                                    fontSize: fontSize(14),
                                    fontWeight: FontWeight.w400),
                                hintText:
                                    "Lorem ipsum dolor sit amet consectetur. Quam eget pulvinar sapien tempus risus duis vel turpis facilisis. Mi posuere neque eget magna id quisque. Enim purus dictum nunc amet sed massa lorem tincidunt. Platea tellus faucibus nam elit quam tortor iaculis est. Vesti"),
                          )
                        ]),
                  ),
                  AppButtons(
                      textColor: whitecolor,
                      fontSize: fontSize(14),
                      backgroundColor: maincolor,
                      text: "Create event",
                      borderColor: maincolor,
                      height: heightSize(60),
                      onTap: () async {
                        var clear = formkey.currentState;

                        if (controller.eventImage!.path.isEmpty ||
                            !clear!.validate()) {
                          controller.isloadingEvents.value = false;
                          getErrorSnackBar(
                              "Please provide an Image for the Events");
                        } else {
                          controller.isloadingEvents.value = true;
                          final response = await controller.cloudinary.upload(
                            file: controller.eventImage!.path,
                            // fileBytes: file.readAsBytesSync(),
                            resourceType: CloudinaryResourceType.image,
                            // folder: "Profile Folder",
                            fileName: title.text.trim(),
                          );

                          if (response.isSuccessful) {
                            final model = {
                              "image": "${response.secureUrl}",
                              "title": title.text.trim(),
                              "venue": venue.text.trim(),
                              "startTime": dateTime.toIso8601String(),
                              "stopTime": dateTime2.toIso8601String(),
                              "date": dateTime3.toIso8601String(),
                              "description": description.text.trim()
                            };

                            await ApiCalls().createEvents(model);

                            controller.isloadingEvents.value = false;
                            showAlertMessage(
                                context,
                                false,
                                heightSize(309),
                                widthSize(312),
                                'assets/Teacher_Dash/goodtick_green.png',
                                heightSize(147),
                                const EventsSucesss(
                                  text: "Event successfully created",
                                  text2:
                                      "Congratulations! Your event has been successfully created.",
                                ));

                            await Future.delayed(const Duration(seconds: 2),
                                () {
                              Get.offNamed(SchoolRoutes.homeScreen);
                            });
                          } else {
                            controller.isloadingEvents.value = false;
                            getErrorSnackBar(
                                "Check Internet, Could not upload image");
                          }
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

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2200));

  Future<TimeOfDay?> pickTIme() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));
}
