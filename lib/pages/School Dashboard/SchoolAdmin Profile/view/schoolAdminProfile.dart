import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_management/pages/School%20Dashboard/Admin%20Profile%20widgets/widget/profileContactInfo.dart';
import 'package:school_management/pages/School%20Dashboard/Admin%20Profile%20widgets/widget/profileMessage.dart';
import 'package:school_management/pages/School%20Dashboard/Admin%20Profile%20widgets/widget/profileSections.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';
import 'package:school_management/utils/colors.dart';

import '../../../../common/alertMessage.dart';
import '../../../../common/schooladmninCustombar.dart';
import '../../../../utils/sizes.dart';
import '../../../Teacher dashboard/Teacher Profile Page/view/notification_screen.dart';
import '../../../Teacher dashboard/Teacher Profile Page/widget/profileContactInfo.dart';
import '../../../Teacher dashboard/Teacher Profile Page/widget/profileMessage.dart';
import '../../../Teacher dashboard/Teacher Profile Page/widget/profileSections.dart';
import '../../Admin Profile widgets/view/notification_screen.dart';
import '../widget/schoolAdminprofilewidget.dart';

class SchoolAdminProfileScreen extends StatelessWidget {
  SchoolAdminProfileScreen({super.key});

  final RegistrationController controller = RegistrationController.instance;

  @override
  Widget build(BuildContext context) {
    var user = controller.userCredentials.value;
    return Scaffold(
      backgroundColor: whitecolor,
      bottomNavigationBar: const SchoolAdminCustomBar(),
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
              SizedBox(width: widthSize(84.5)),
              Text(
                'My profile',
                style: TextStyle(
                    color: whitecolor,
                    fontSize: fontSize(20),
                    fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: heightSize(41), bottom: heightSize(40)),
        child: RefreshIndicator(
          onRefresh: () async {
            String id = controller.userCredentials.value.id;
            debugPrint(id);
            await controller.fetchAdminDetails(id);
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      height: heightSize(109),
                      child: Container(
                        width: widthSize(109.11),
                        height: heightSize(109.11),
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                              image: NetworkImage(user.image),
                              fit: BoxFit.fill),
                          color: const Color(0xFFE6E6E6),
                          shape: const OvalBorder(),
                        ),
                      )),
                ),
                SizedBox(height: heightSize(20)),
                Text("${user.lastname} ${user.firstname}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: fontSize(20))),
                SizedBox(height: heightSize(11)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: heightSize(24),
                        width: widthSize(24),
                        child: SvgPicture.asset(
                            "assets/School_Dash/schoolprofilelogo.svg")),
                    Text(user.position,
                        style: TextStyle(
                            color: maincolor,
                            fontWeight: FontWeight.w600,
                            fontSize: fontSize(14))),
                  ],
                ),
                SizedBox(height: heightSize(56.89)),
                AdminProfileSectionWidget(),
                SizedBox(height: heightSize(40)),
                SchoolAdminProfileWdiget(),
                SizedBox(height: heightSize(40)),
                GestureDetector(
                  onTap: () {
                    Get.to(() => AdminNotificaitionProfilePage());
                  },
                  child: const AdminProfileSection3(
                      image: "assets/Teacher_Dash/profile_notification.png",
                      text: "Notifications",
                      sectionhead: "COMMUNICATION PREFERENCE",
                      color: textColor),
                ),
                SizedBox(height: heightSize(40)),
                const AdminProfileSection4(),
                SizedBox(height: heightSize(44)),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "DEACTIVATE ACCOUNT",
                    style: TextStyle(
                        color: textcolor5,
                        fontSize: fontSize(14),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: heightSize(15)),
                  GestureDetector(
                    onTap: () {
                      showAlertMessage(
                          context,
                          false,
                          heightSize(350),
                          widthSize(350),
                          "assets/Teacher_Dash/warningicon.png",
                          heightSize(145),
                          const AdminProfileMessage());
                    },
                    child: Container(
                      height: heightSize(104),
                      width: widthSize(368),
                      padding: EdgeInsets.only(
                          top: heightSize(28),
                          left: widthSize(20),
                          right: widthSize(11)),
                      decoration: BoxDecoration(
                          color: whitecolor,
                          borderRadius: BorderRadius.circular(widthSize(10)),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: widthSize(60),
                                color: const Color.fromRGBO(61, 64, 128, 0.2),
                                offset: const Offset(0, 4))
                          ]),
                      child: const AdminProfileContactInfo(
                          color: Colors.red,
                          image: "assets/Teacher_Dash/profile_delete.png",
                          header: "Deactivate account",
                          subheader: "Deactivate your Admin account"),
                    ),
                  ),
                ]),
                SizedBox(height: heightSize(37)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
