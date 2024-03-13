import 'package:cloudinary/cloudinary.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:school_management/common/alertMessage.dart';
import 'package:school_management/routes/routes.dart';

import '../../../../common/button.dart';
import '../../../../common/custom-text.dart';
import '../../../../common/getxmessage.dart';
import '../../../../models/student_model.dart';
import '../../../../services/api_calls.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../../../School Dashboard/Create Student/controller/student_controller.dart';

class TeacherUploadStudentResults extends StatefulWidget {
  final StudentModel model;
  TeacherUploadStudentResults({super.key, required this.model});

  @override
  State<TeacherUploadStudentResults> createState() =>
      _TeacherUploadStudentResultsState();
}

class _TeacherUploadStudentResultsState
    extends State<TeacherUploadStudentResults> {
  final StudentController controller = StudentController.instance;

  PlatformFile? newfile;

  RxString filename = "Choose a File".obs;

  RxString filesize = "select a file".obs;

  String formatFileSize(int fileSizeInBytes) {
    if (fileSizeInBytes < 1024) {
      return '$fileSizeInBytes B'; // Display in bytes
    } else if (fileSizeInBytes < 1024 * 1024) {
      double sizeInKB = fileSizeInBytes / 1024;
      return '${sizeInKB.toStringAsFixed(2)} KB'; // Display in kilobytes
    } else {
      double sizeInMB = fileSizeInBytes / (1024 * 1024);
      return '${sizeInMB.toStringAsFixed(2)} MB'; // Display in megabytes
    }
  }

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        // allowedExtensions: ["jpg", "pdf", "doc"],
        );
    if (result != null && result.files.single.path != null) {
      PlatformFile file = result.files.first;

      setState(() {
        newfile = file;
      });

      filesize.value = formatFileSize(newfile!.size);
      filename.value = newfile!.name;

      debugPrint(file.name);
      debugPrint(file.bytes.toString());
      debugPrint(file.size.toString());
      debugPrint(file.extension);
      debugPrint(file.path);
    } else {}
  }

  double uploadProgress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: Obx(() {
        return LoadingOverlayPro(
          isLoading: controller.isloading.value,
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
                        height: heightSize(230),
                        width: constraints.maxWidth,
                        decoration: const BoxDecoration(
                          color: maincolor,
                        ),
                        child: Stack(children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: heightSize(73),
                                right: widthSize(300),
                                left: widthSize(30)),
                            child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: backbutton()),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: heightSize(70),
                                right: widthSize(104),
                                left: widthSize(130)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: heightSize(37),
                                  backgroundImage:
                                      NetworkImage(widget.model.image),
                                ),
                                SizedBox(height: heightSize(10)),
                                Text(
                                  "${widget.model.lastname} ${widget.model.firstname}",
                                  style: TextStyle(
                                      fontSize: fontSize(20),
                                      color: whitecolor,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: heightSize(10)),
                                Text(
                                  "ID: ${widget.model.id}",
                                  style: TextStyle(
                                      fontSize: fontSize(12),
                                      color: whitecolor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
                      SizedBox(height: heightSize(30)),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: widthSize(30)),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: CText(
                            text: "Upload new result",
                            color: Color(0xFF707070),
                            size: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: heightSize(15)),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: widthSize(30)),
                        child: GestureDetector(
                          onTap: () => pickFile(),
                          child: SizedBox(
                            height: heightSize(270),
                            width: widthSize(368),
                            child: DottedBorder(
                              color: maincolor,
                              dashPattern: const [5, 4],
                              radius: const Radius.circular(10),
                              strokeCap: StrokeCap.round,
                              borderType: BorderType.RRect,
                              child: SizedBox(
                                  height: heightSize(270),
                                  width: constraints.maxWidth,
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
                                          'Upload your files here',
                                          style: TextStyle(
                                              color: maincolor,
                                              fontSize: fontSize(17),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ])),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: heightSize(30)),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: widthSize(30)),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: CText(
                            text: "UPLOADING",
                            color: Color(0xFF707070),
                            size: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: heightSize(10)),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: widthSize(30)),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: widthSize(21),
                              vertical: heightSize(16)),
                          width: constraints.maxWidth,
                          height: heightSize(101),
                          decoration: ShapeDecoration(
                            color: const Color(0x193D4080),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: heightSize(54),
                                width: constraints.maxWidth,
                                child: Row(children: [
                                  SizedBox(
                                    height: heightSize(48),
                                    width: widthSize(48),
                                    child: Image.asset(
                                        "assets/School_Dash/pdflogo.png"),
                                  ),
                                  SizedBox(
                                    height: heightSize(43),
                                    width: widthSize(200),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CText(
                                            text: filename.value,
                                            color: maincolor,
                                            size: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          CText(
                                            text: filesize.value,
                                            color: const Color(0xFF555555),
                                            size: 12,
                                            fontWeight: FontWeight.w600,
                                          )
                                        ]),
                                  )
                                ]),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      value: uploadProgress / 100.0,
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                              maincolor),
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: widthSize(10)),
                                  // CText(
                                  //   text: "${newUpload.toString()} %",
                                  //   color: Colors.black,
                                  // )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: heightSize(20)),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: widthSize(30)),
                        child: AppButtons(
                            textColor: whitecolor,
                            fontSize: fontSize(14),
                            backgroundColor: maincolor,
                            text: "Upload new",
                            borderColor: maincolor,
                            height: heightSize(60),
                            onTap: () async {
                              if (newfile != null && newfile!.path != null) {
                                controller.isloading.value = true;
                                final response =
                                    await controller.cloudinary.upload(
                                  file: newfile!.path,
                                  progressCallback: (progress, end) {
                                    double percentage = progress * 100;
                                    print(
                                        'Upload progress: ${percentage.toStringAsFixed(2)}%');
                                    // Update the UI with the upload progress
                                    setState(() {
                                      uploadProgress = percentage;
                                    });
                                  },
                                  // fileBytes: file.readAsBytesSync(),
                                  resourceType: CloudinaryResourceType.raw,
                                  // folder: "Profile Folder",
                                  fileName: widget.model.firstname,
                                );

                                if (response.isSuccessful) {
                                  getSuccessSnackBar(
                                      "Pdf uploaded Successfully");
                                  final data = {
                                    "createdFor": widget.model.id,
                                    "name": filename.value,
                                    "document": "${response.secureUrl}"
                                  };

                                  debugPrint(data.toString());

                                  await ApiCalls().createResults(data);

                                  controller.isloading.value = false;

                                  showAlertMessageTeacher(
                                    context,
                                    false,
                                    heightSize(326),
                                    widthSize(288),
                                    "assets/Teacher_Dash/goodtick_green.png",
                                    heightSize(135),
                                    SizedBox(
                                      width: widthSize(288),
                                      child: Column(children: [
                                        SizedBox(height: heightSize(10)),
                                        Text(
                                          "Success",
                                          style: TextStyle(
                                              fontSize: fontSize(20),
                                              fontWeight: FontWeight.w600,
                                              color: Colors.green),
                                        ),
                                        SizedBox(height: heightSize(20)),
                                        CText(
                                          text:
                                              "You have successfully uploaded a  new result",
                                          size: 16,
                                          color: Color(0xFF555555),
                                          fontWeight: FontWeight.w400,
                                        ),
                                        SizedBox(height: heightSize(20)),
                                        AppButtons(
                                            textColor: whitecolor,
                                            fontSize: fontSize(14),
                                            backgroundColor: Colors.green,
                                            text: "Ok",
                                            borderColor: Colors.green,
                                            height: heightSize(63),
                                            onTap: () {
                                              Get.offNamed(
                                                  TeacherRoutes.homeScreen);
                                            })
                                      ]),
                                    ),
                                  );
                                } else {
                                  controller.isloading.value = false;
                                  getErrorSnackBar("Failed to upload Pdf");
                                }
                              } else {
                                getErrorSnackBar("Please select a file");
                              }
                            }),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
