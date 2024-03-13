// ignore_for_file: must_be_immutable, invalid_use_of_protected_member, depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:school_management/models/student_model.dart';
import 'package:school_management/pages/Teacher%20dashboard/DashBoard/controller/teacher_controller.dart';

import '../../../../common/button.dart';
import '../../../../common/custom-text.dart';
import '../../../../common/getxmessage.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

import 'package:http/http.dart' as http;
import '../../../School Dashboard/manage_results/widget/view_result_details.dart';

class ViewStudentResultsScreen extends StatelessWidget {
  final StudentModel model;
  ViewStudentResultsScreen({super.key, required this.model});

  TeacherController teacherController = TeacherController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: LayoutBuilder(
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
                              Container(
                                height: heightSize(80),
                                width: widthSize(80),
                                decoration: const ShapeDecoration(
                                  color: Colors.white,
                                  shape: OvalBorder(
                                    side: BorderSide(
                                        width: 1.90, color: Color(0xFFFFFFF)),
                                  ),
                                ),
                                child: Container(
                                  width: widthSize(70.14),
                                  height: heightSize(70.14),
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(model.image),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: const OvalBorder(),
                                  ),
                                ),
                              ),
                              SizedBox(height: heightSize(10)),
                              Text(
                                "${model.lastname} ${model.firstname}",
                                style: TextStyle(
                                    fontSize: fontSize(20),
                                    color: whitecolor,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: heightSize(10)),
                              Text(
                                "ID: ${model.id}",
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
                    SizedBox(height: heightSize(28)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
                      child: SizedBox(
                        height: heightSize(57),
                        width: constraints.maxWidth,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: heightSize(57),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: backgroundcolor4,
                                      contentPadding: EdgeInsets.only(
                                          top: heightSize(10),
                                          left: widthSize(10)),
                                      hintText:
                                          "        Search for class or term",
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: textcolor7,
                                          fontSize: fontSize(14)),
                                      border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: backgroundcolor4),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7))),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: backgroundcolor4),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: widthSize(10)),
                              Container(
                                height: heightSize(56),
                                width: widthSize(56),
                                decoration: const BoxDecoration(
                                    color: textColor3,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: const Center(
                                  child: Icon(
                                    Icons.search_rounded,
                                    color: whitecolor,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(height: heightSize(20)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CText(
                          text: model.classAssigned.capitalize!,
                          color: const Color(0xFF707070),
                          size: 14,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
                      child: SizedBox(
                        height: constraints.maxHeight,
                        width: constraints.maxWidth,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: teacherController.studentResult.length,
                          itemBuilder: (context, index) {
                            return viewResultDetails(
                                teacherController
                                    .studentResult.value[index].name,
                                constraints.maxWidth,
                                () => openFile(
                                    url: teacherController
                                        .studentResult.value[index].document,
                                    fileName: "file.pdf"));
                          },
                        ),
                      ),
                    )
                  ],
                )),
          );
        },
      ),
    );
  }

  Future openFile({required String url, String? fileName}) async {
    teacherController.isloading.value = true;
    final file = await downloadFile(url, fileName!);
    if (file == null) {
      teacherController.isloading.value = false;
      debugPrint("No file");
      getErrorSnackBar("No File found");
      return null;
    }

    debugPrint("Path: ${file.path}");

    teacherController.isloading.value = false;

    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File("${appStorage.path}/$name");

    // try {
    //   var response = await Dio().get(
    //     url,
    //     options: Options(
    //         responseType: ResponseType.bytes,
    //         followRedirects: false,
    //         receiveTimeout: const Duration(seconds: 0)),
    //   );
    //   final raf = file.openSync(mode: FileMode.write);
    //   raf.writeFromSync(response.data);
    //   await raf.close();
    //   debugPrint("Good file");
    //   getSuccessSnackBar("File gotten Successfully");

    //   return file;
    // } catch (e) {
    //   teacherController.isloading.value = false;
    //   debugPrint(e.toString());
    //   debugPrint("No file 21");
    //   getErrorSnackBar("No File found 21");
    //   return null;
    // }

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        // options: Options(
        //     responseType: ResponseType.bytes,
        //     followRedirects: false,
        //     receiveTimeout: const Duration(seconds: 0)),
      );

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.bodyBytes);
      await raf.close();
      debugPrint("Good file");

      return file;
    } catch (e) {
      teacherController.isloading.value = false;
      debugPrint(e.toString());
      debugPrint("No file 21");
      getErrorSnackBar("No File found 21");
      return null;
    }
  }
}
