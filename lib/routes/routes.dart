import 'package:get/get.dart';
import 'package:school_management/pages/School%20Dashboard/Admin%20Events/view/admin_createEvents.dart';
import 'package:school_management/pages/School%20Dashboard/Create%20Student/controller/student_bindings.dart';
import 'package:school_management/pages/Teacher%20dashboard/AuthPage/view/authentication.dart';
import 'package:school_management/pages/Teacher%20dashboard/Chat%20Page/view/chatScreen.dart';
import 'package:school_management/pages/Teacher%20dashboard/Onboard_Screen/view/onboardscreen.dart';
import 'package:school_management/pages/Teacher%20dashboard/Teacher%20Profile%20Page/view/profileScreen.dart';
import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/view/sign_in_page.dart';
import 'package:school_management/pages/Teacher%20dashboard/splashscreen/view/splashscreen.dart';

import '../pages/Parent DashBoard/ParentMain/controller/parent_bindings.dart';
import '../pages/Parent DashBoard/ParentMain/view/parentscreen.dart';
import '../pages/School Dashboard/Admin Announcement/controller/announce_binding.dart';
import '../pages/School Dashboard/School Fees/view/schoolfeesmain.dart';
import '../pages/School Dashboard/SchoolAdmin Profile/view/schoolAdminProfile.dart';
import '../pages/School Dashboard/home screen/controller/adminbindings.dart';
import '../pages/School Dashboard/home screen/view/schooladminHome.dart';
import '../pages/Teacher dashboard/Assignment Page/view/assignmentScreen.dart';
import '../pages/Teacher dashboard/DashBoard/controller/teacher_binding.dart';
import '../pages/Teacher dashboard/DashBoard/view/teacher_dashboard.dart';
import '../pages/Teacher dashboard/Teacher Announcement/controller/teacher_announce_binding.dart';
import '../pages/Teacher dashboard/Teacher Events/view/createEvents.dart';
import '../pages/Teacher dashboard/SIgn-In Page/binding/registrationbinding.dart';
import '../pages/Teacher dashboard/SIgn-In Page/view/registration.dart';
import '../pages/Teacher dashboard/Teacher Manage Results/views/teacher_results_main_page.dart';

class TeacherRoutes {
  static const splashScreen = "/splashscreen";
  static const homeScreen = '/homescreen';
  static const onBoardScreen = '/onboard';
  static const authScreen = '/authscreen';
  static const registerScreen1 = '/registerScreen1';
  static const signinScreen = "/signinscreen";
  static const assignmentScreen = "/assignment";
  static const forgetPage = "/forgetpage";
  static const profilePage = "/profilepage";
  static const chatpage = "/chatpage";
  static const forgotPassword = "/forgotpassword";
  static const createEventScreen = "/createEventScreen";
  static const resultsPage = "/resultScreen";
}

class ParentRoutes {
  static const splashScreen = "/splashscreen";
  static const homeScreen = '/parenthomescreen';
  static const timeTable = '/onboard';
  static const authScreen = '/authscreen';
  static const registerScreen = "/register";
  static const loginPage = "/loginpage";
  static const forgetPage = "/forgetpage";
  static const profilePage = "/profiepage";
  static const settingsPage = "/settingspage";
  static const forgotPassword = "/forgotpassword";
}

class SchoolRoutes {
  static const splashScreen = "/splashscreen";
  static const homeScreen = '/schooladminhomescreen';
  static const onBoardScreen = '/onboard';
  static const authScreen = '/authscreen';
  static const registerScreen = "/register";
  static const loginPage = "/loginpage";
  static const forgetPage = "/forgetpage";
  static const profilePage = "/schoolAdminprofile";
  static const settingsPage = "/settingspage";
  static const forgotPassword = "/forgotpassword";
  static const schoolfees = "/schoolfees";
  static const teacherHome = "/teacherHome";
}

class Pages {
  static const splashScreen = TeacherRoutes.splashScreen;
  static final routes = [
    // Teacher's Routes
    GetPage(name: TeacherRoutes.splashScreen, page: () => const SplashScreen()),
    GetPage(
        name: TeacherRoutes.registerScreen1,
        page: () => RegistrationScreen(
              type: "Teacher",
            ),
        binding: Registrationbinding()),
    GetPage(
        name: TeacherRoutes.homeScreen,
        page: () => TeacherDashBoard(),
        bindings: [
          TeacherBinding(),
          StudentBindings(),
          TeacherAnnouncementBinding()
        ]),
    GetPage(
        name: TeacherRoutes.onBoardScreen, page: () => const OnBoardScreen()),
    GetPage(name: TeacherRoutes.authScreen, page: () => const AuthPage()),
    GetPage(name: TeacherRoutes.signinScreen, page: () => SignInPage()),
    GetPage(
        name: TeacherRoutes.assignmentScreen,
        page: () => const AssignmentScreen()),
    GetPage(
        name: TeacherRoutes.profilePage, page: () => TeacherProfileScreen()),

    GetPage(name: TeacherRoutes.chatpage, page: () => const ChatScreen()),
    GetPage(
        name: TeacherRoutes.resultsPage, page: () => TeacherResultsMainPage()),

    // Parent's Routes
    GetPage(
        name: ParentRoutes.homeScreen,
        page: () => ParentHomePage(),
        binding: ParentsBindings()),

    // School admin routes
    GetPage(
        name: SchoolRoutes.homeScreen,
        page: () => SchoolAdminHomeScreen(),
        bindings: [
          AdminBindings(),
          AdminAnnouncementBinding(),
          StudentBindings()
        ]),
    GetPage(name: SchoolRoutes.schoolfees, page: () => SchoolFeesMainScreen()),
    GetPage(
        name: SchoolRoutes.profilePage, page: () => SchoolAdminProfileScreen())
  ];
}
