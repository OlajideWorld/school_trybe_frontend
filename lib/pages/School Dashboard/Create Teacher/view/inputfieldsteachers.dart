// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:school_management/common/alertMessage.dart';
// import 'package:school_management/common/button.dart';
// import 'package:school_management/common/getxmessage.dart';
// import 'package:school_management/common/input_TextField.dart';
// import 'package:school_management/pages/School%20Dashboard/Create%20Teacher/view/viewBarcode.dart';
// import 'package:school_management/pages/School%20Dashboard/home%20screen/controller/adminController.dart';
// import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';
// import 'package:school_management/services/api_calls.dart';
// import 'package:school_management/utils/colors.dart';

// import '../../../../utils/sizes.dart';
// import '../widget/select_teacher_class.dart';

// class InputFieldTeachersScreen extends StatelessWidget {
//   InputFieldTeachersScreen({super.key});

//   final AdminController controller = AdminController.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(heightSize(78)),
//         child: AppBar(
//           backgroundColor: maincolor,
//           automaticallyImplyLeading: false,
//           title: Padding(
//             padding: EdgeInsets.only(
//               top: heightSize(22),
//               left: widthSize(20),
//             ),
//             child: Row(children: [
//               GestureDetector(
//                 onTap: () {
//                   Get.back();
//                 },
//                 child: SizedBox(
//                   height: heightSize(37.5),
//                   width: widthSize(37.5),
//                   child: Image.asset("assets/Teacher_Dash/backarrow.png"),
//                 ),
//               ),
//               SizedBox(width: widthSize(77.5)),
//               Text(
//                 'Create teacher',
//                 style: TextStyle(
//                     color: whitecolor,
//                     fontSize: fontSize(20),
//                     fontWeight: FontWeight.w600),
//               ),
//             ]),
//           ),
//         ),
//       ),
//       backgroundColor: whitecolor,
//       body: Padding(
//         padding: EdgeInsets.only(
//             top: heightSize(29),
//             right: widthSize(30),
//             left: widthSize(30),
//             bottom: heightSize(20)),
//         child: Column(children: [
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               "Firstname",
//               style: TextStyle(
//                   fontSize: fontSize(14), fontWeight: FontWeight.w600),
//             ),
//           ),
//           SizedBox(height: heightSize(10)),
//           SizedBox(
//               height: heightSize(65),
//               child: InputTextField(
//                 controller: controller.name,
//                 obscureText: false,
//                 hintText: "Input your last name",
//               )),
//           SizedBox(height: heightSize(20)),
//           const TeacherSelectYourClass(),

//           SizedBox(height: heightSize(10)),
//           const TeacherSelectYourclassSelection(),
//           // SizedBox(
//           //     height: heightSize(65),
//           //     child: const InputTextField(
//           //       obscureText: false,
//           //       hintText: "create a classname",
//           //     )),
//           const Spacer(),
//           AppButtons(
//               textColor: whitecolor,
//               fontSize: fontSize(14),
//               backgroundColor: maincolor,
//               text: "Continue",
//               borderColor: maincolor,
//               height: heightSize(63),
//               onTap: () {
//                 if (controller.name.text.isNotEmpty) {
//                   Get.to(() => InputFieldteacherscreen2());
//                 } else {
//                   getErrorSnackBar("Please enter teacher's name");
//                 }
//               })
//         ]),
//       ),
//     );
//   }
// }

// class InputFieldteacherscreen2 extends StatelessWidget {
//   InputFieldteacherscreen2({super.key});

//   final AdminController controller = AdminController.instance;
//   final RegistrationController regController = RegistrationController.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: whitecolor,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(heightSize(78)),
//         child: AppBar(
//           backgroundColor: maincolor,
//           automaticallyImplyLeading: false,
//           title: Padding(
//             padding: EdgeInsets.only(
//               top: heightSize(22),
//               left: widthSize(20),
//             ),
//             child: Row(children: [
//               GestureDetector(
//                 onTap: () {
//                   Get.back();
//                 },
//                 child: SizedBox(
//                   height: heightSize(37.5),
//                   width: widthSize(37.5),
//                   child: Image.asset("assets/Teacher_Dash/backarrow.png"),
//                 ),
//               ),
//               SizedBox(width: widthSize(77.5)),
//               Text(
//                 'Create teacher',
//                 style: TextStyle(
//                     color: whitecolor,
//                     fontSize: fontSize(20),
//                     fontWeight: FontWeight.w600),
//               ),
//             ]),
//           ),
//         ),
//       ),
//       body: Obx(() {
//         return Padding(
//           padding: EdgeInsets.only(
//               top: heightSize(29),
//               right: widthSize(30),
//               left: widthSize(30),
//               bottom: heightSize(20)),
//           child: Column(children: [
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "Subject Assigned",
//                 style: TextStyle(
//                     fontSize: fontSize(14), fontWeight: FontWeight.w600),
//               ),
//             ),
//             SizedBox(height: heightSize(10)),
//             SizedBox(
//                 height: heightSize(65),
//                 child: InputTextField(
//                   controller: controller.subject,
//                   obscureText: false,
//                   hintText: "Assign a Subject",
//                 )),
//             const Spacer(),
//             controller.isloading.value == false
//                 ? AppButtons(
//                     textColor: whitecolor,
//                     fontSize: fontSize(14),
//                     backgroundColor: maincolor,
//                     text: "Continue",
//                     borderColor: maincolor,
//                     height: heightSize(63),
//                     onTap: () async {
//                       if (controller.subject.text.isNotEmpty) {
//                         controller.isloading.value = true;
//                         final model = {
//                           "firstname": controller.name.text.trim(),
//                           "email": "${controller.name.text.trim()}@gmail.com",
//                           "schoolName":
//                               regController.schoolModel.value.schoolName,
//                           "schoolBanner": regController.schoolModel.value.image,
//                           "className": controller.classSelection.value,
//                           "classSection": controller.classSection.value,
//                           "subjectRole": controller.subject.text.trim()
//                         };

//                         debugPrint(model.toString());

//                         controller.id.value =
//                             await ApiCalls().createTeacher(model);

//                         if (controller.id.value != "") {
//                           controller.isloading.value = false;

//                           showAlertMessage(
//                             context,
//                             false,
//                             heightSize(350),
//                             widthSize(288),
//                             "assets/Teacher_Dash/goodtick_green.png",
//                             heightSize(138),
//                             SizedBox(
//                               width: widthSize(288),
//                               child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       "Success",
//                                       style: TextStyle(
//                                           fontSize: fontSize(20),
//                                           fontWeight: FontWeight.w600,
//                                           color: const Color(0xFF219653)),
//                                     ),
//                                     SizedBox(height: heightSize(20)),
//                                     SizedBox(
//                                       height: heightSize(72),
//                                       width: widthSize(288),
//                                       child: Text(
//                                         "You have successfully created Michael Nelson as a teacher profile in your school",
//                                         style: TextStyle(
//                                             fontSize: fontSize(16),
//                                             fontWeight: FontWeight.w400),
//                                       ),
//                                     ),
//                                     SizedBox(height: heightSize(20)),
//                                     AppButtons(
//                                         textColor: whitecolor,
//                                         fontSize: fontSize(16),
//                                         backgroundColor:
//                                             const Color(0xFF219653),
//                                         text: "View Barcode",
//                                         borderColor: const Color(0xFF219653),
//                                         height: heightSize(63),
//                                         onTap: () =>
//                                             Get.to(() => ViewBarcodeSchool()))
//                                   ]),
//                             ),
//                           );
//                         } else {
//                           controller.isloading.value = false;
//                           getErrorSnackBar("Error");
//                         }
//                       } else {
//                         getErrorSnackBar("Please enter Subject Assigned");
//                       }
//                     })
//                 : Center(
//                     child: SizedBox(
//                       height: heightSize(60),
//                       width: widthSize(60),
//                       child: const CircularProgressIndicator(color: maincolor),
//                     ),
//                   )
//           ]),
//         );
//       }),
//     );
//   }
// }
