// import 'package:flutter/material.dart';

// import '../../../../utils/colors.dart';
// import '../../../../utils/sizes.dart';

// class TeacherProfileImage extends StatelessWidget {
//   const TeacherProfileImage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: heightSize(178),
//       child: Column(children: [
//         SizedBox(
//           height: heightSize(109),
//           width: widthSize(123),
//           child: Stack(
//             children: [
//               Positioned(
//                 right: widthSize(10),
//                 top: heightSize(0),
//                 bottom: heightSize(0),
//                 left: widthSize(0),
//                 child: Container(
//                   height: heightSize(109),
//                   decoration: const BoxDecoration(
//                       color: Color(0xFFE6E6E6), shape: BoxShape.circle),
//                 ),
//               ),
//               Positioned(
//                 bottom: heightSize(0),
//                 left: widthSize(70),
//                 top: heightSize(60),
//                 right: widthSize(0),
//                 child: Container(
//                   decoration: const BoxDecoration(shape: BoxShape.circle),
//                   height: heightSize(44),
//                   width: widthSize(44),
//                   child: Image.asset("assets/Teacher_Dash/profileCamera.png"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: heightSize(10)),
//         Text(
//           'Sikiru Ademola Isaac',
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: fontSize(24), fontWeight: FontWeight.w600),
//         ),
//         SizedBox(height: heightSize(10)),
//         Text(
//           'Mathematics Teacher',
//           style: TextStyle(
//               color: maincolor,
//               fontSize: fontSize(14),
//               fontWeight: FontWeight.w600),
//         )
//       ]),
//     );
//   }
// }
