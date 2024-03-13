import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:get/get.dart";
import "package:school_management/pages/School%20Dashboard/School%20Fees/view/managedue.dart";
import "package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart";
import "package:school_management/utils/colors.dart";

import "../../../../common/schooladmninCustombar.dart";
import "../../../../utils/sizes.dart";
import "../../home screen/widget/schooladminhomewidget.dart";
import "../widget/schoolfeeswidget.dart";
import "createSchoolDue.dart";

class SchoolFeesMainScreen extends StatelessWidget {
  SchoolFeesMainScreen({super.key});
  final RegistrationController controller = RegistrationController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      bottomNavigationBar: const SchoolAdminCustomBar(),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(children: [
          SchoolAdminHomewidget(
            image: controller.userCredentials.value.image,
            name: controller.userCredentials.value.firstname,
            schoolName: controller.schoolModel.value.schoolName,
          ),
          SizedBox(height: heightSize(30)),
          SizedBox(
            height: heightSize(173),
            width: widthSize(368),
            child: SvgPicture.asset("assets/School_Dash/schoolfees.svg"),
          ),
          SizedBox(height: heightSize(15)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
            child: Row(children: [
              GestureDetector(
                onTap: () => showDialogSchool(context),
                child: Container(
                  height: heightSize(56),
                  width: widthSize(169),
                  decoration: BoxDecoration(
                      color: textColor3,
                      border: Border.all(color: textColor3),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add_circle,
                          color: whitecolor,
                        ),
                        SizedBox(width: widthSize(6.66)),
                        Text(
                          "Create Due",
                          style: TextStyle(
                              color: whitecolor,
                              fontSize: fontSize(14),
                              fontWeight: FontWeight.w600),
                        )
                      ]),
                ),
              ),

              SizedBox(width: widthSize(15)),
              //
              //
              GestureDetector(
                onTap: () => Get.to(() => const ManageDuesScreen()),
                child: Container(
                  height: heightSize(56),
                  width: widthSize(169),
                  decoration: BoxDecoration(
                      color: const Color(0xFF555555),
                      border: Border.all(color: const Color(0xFF555555)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: heightSize(24),
                            width: widthSize(24),
                            child: SvgPicture.asset(
                                "assets/School_Dash/Vectormoneyicon.svg")),
                        SizedBox(width: widthSize(6.66)),
                        Text(
                          "Manage Due",
                          style: TextStyle(
                              color: whitecolor,
                              fontSize: fontSize(14),
                              fontWeight: FontWeight.w600),
                        )
                      ]),
                ),
              )
            ]),
          ),
          SizedBox(height: heightSize(15)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widthSize(30)),
            child: Container(
              height: heightSize(56),
              decoration: BoxDecoration(
                  color: const Color(0xFF555555),
                  border: Border.all(color: const Color(0xFF555555)),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                    height: heightSize(24),
                    width: widthSize(24),
                    child: SvgPicture.asset(
                        "assets/School_Dash/withdrawicon.svg")),
                SizedBox(width: widthSize(6.66)),
                Text(
                  "Withdraw",
                  style: TextStyle(
                      color: whitecolor,
                      fontSize: fontSize(14),
                      fontWeight: FontWeight.w600),
                )
              ]),
            ),
          ),
          SizedBox(height: heightSize(26)),
          showTransactionsschoool(context)
        ]),
      ),
    );
  }

  showDialogSchool(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: SizedBox(
              height: heightSize(206),
              width: widthSize(308),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create New Due",
                      style: TextStyle(
                          fontSize: fontSize(16),
                          fontWeight: FontWeight.w600,
                          color: maincolor),
                    ),
                    SizedBox(height: heightSize(5)),
                    Text(
                      "Are you looking to create a new due? You can do so right now by clicking on the 'Create Due' button below",
                      style: TextStyle(
                          fontSize: fontSize(14), fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: heightSize(20)),
                    GestureDetector(
                      onTap: () => Get.to(() => CreateSchoolDueScreen()),
                      child: Container(
                        height: heightSize(56),
                        width: widthSize(308),
                        decoration: BoxDecoration(
                            color: textColor3,
                            border: Border.all(color: textColor3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.add_circle,
                                color: whitecolor,
                              ),
                              SizedBox(width: widthSize(6.66)),
                              Text(
                                "Create Due",
                                style: TextStyle(
                                    color: whitecolor,
                                    fontSize: fontSize(14),
                                    fontWeight: FontWeight.w600),
                              )
                            ]),
                      ),
                    ),
                    SizedBox(height: heightSize(15)),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Not now",
                        style: TextStyle(
                            color: maincolor,
                            fontSize: fontSize(14),
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ]),
            ),
          );
        });
  }
}
