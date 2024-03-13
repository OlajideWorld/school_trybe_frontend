import 'package:flutter/material.dart';
import 'package:school_management/common/button.dart';
import 'package:school_management/routes/routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';
import '../widget/onboardPageview.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final PageController controller = PageController();
  bool lastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: Column(children: [
        SizedBox(
          height: heightSize(790),
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              PageView(
                onPageChanged: (index) {
                  setState(() => lastPage = index == 3);
                },
                physics: const BouncingScrollPhysics(),
                controller: controller,
                children: const [
                  OnboardPageView(
                    image: 'assets/Teacher_Dash/onbd1.png',
                    text1: 'Easy communication between parents and school',
                    text2:
                        "Allows for two-way communication between parents, teachers and school administrators through features such as messaging, email, and push notifications",
                  ),
                  OnboardPageView(
                    image: 'assets/Teacher_Dash/onbd2.png',
                    text1: 'Real-time access to student performance',
                    text2:
                        "Parents can view their child's grades, assignments and exam scores in real-time.",
                  ),
                  OnboardPageView(
                    image: 'assets/Teacher_Dash/onbd3.png',
                    text1: 'Efficient Parent-Teacher interaction scheduling.',
                    text2:
                        "Allows parents to view the school calendar, including events, holidays, and important dates, and schedule appointments or meetings with teachers or administrators",
                  ),
                  OnboardPageView(
                    image: 'assets/Teacher_Dash/onbd4.png',
                    text1: 'Monitor your attendance in real-time',
                    text2:
                        "Parents can view their child's attendance records, including any absences, tardiness, or early dismissal",
                  ),
                ],
              ),
              Positioned(
                top: heightSize(750),
                right: widthSize(189),
                left: widthSize(170),
                bottom: heightSize(418),
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 4,
                  effect: ExpandingDotsEffect(
                      activeDotColor: maincolor,
                      dotColor: pageindicator,
                      dotWidth: widthSize(8),
                      dotHeight: heightSize(8)),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
          child: SizedBox(
            height: heightSize(60),
            child: AppButtons(
                textColor: whitecolor,
                fontSize: fontSize(14),
                backgroundColor: maincolor,
                text: "Continue",
                borderColor: maincolor,
                height: heightSize(60),
                onTap: () {
                  if (lastPage) {
                    Get.offAllNamed(TeacherRoutes.authScreen);
                  }
                  controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                }),
          ),
        )
      ]),
    );
  }
}

   // Expanded(
                    //   child: AppButtons(
                    //       textColor: maincolor,
                    //       fontSize: fontSize(14),
                    //       backgroundColor: whitecolor,
                    //       text: "Skip",
                    //       borderColor: Colors.black,
                    //       height: heightSize(60),
                    //       onTap: () {
                    //         controller.animateToPage(3,
                    //             duration: const Duration(milliseconds: 500),
                    //             curve: Curves.easeInOut);
                    //       }),
                    // )