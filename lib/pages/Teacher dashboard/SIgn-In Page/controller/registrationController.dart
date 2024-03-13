import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/models/school_model.dart';
import 'package:school_management/models/signIn_response.dart';
import 'package:school_management/models/teacher_model.dart';
import 'package:school_management/models/usermodel.dart';

import '../../../../models/parent_model.dart';
import '../../../../models/student_model.dart';
import '../../../../services/api_calls.dart';

enum SchoolSize { hundred, fiveHundred, oneThousand }

class RegistrationController extends GetxController {
  static RegistrationController instance = Get.find();

  // Teachers and Parents parameter
  final TextEditingController name = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController emailAddress = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController nin = TextEditingController();
  final TextEditingController origin = TextEditingController();
  final TextEditingController nationality = TextEditingController();
  final TextEditingController subjectRole = TextEditingController();

  RxString teacherImage = "".obs;

// Parents parameter
  final TextEditingController occupation = TextEditingController();
  RxList<StudentModel> studentList = <StudentModel>[].obs;
  RxList<StudentModel> studentListFromIds = <StudentModel>[].obs;
  RxList<String> selectedStudentIds = <String>[].obs;
  RxBool isSelected = false.obs;
  Rx<ParentsModel> parentModel = ParentsModel(
          createdBy: "",
          firstname: "",
          schoolName: "",
          schoolBanner: "",
          image: "",
          password: "",
          email: "",
          lastName: "",
          phoneNumber: "",
          nin: 12345,
          maritalStatus: "",
          gender: "",
          stateOfOrigin: "",
          childrenId: [],
          nationality: "",
          occupation: "",
          address: "",
          type: 3,
          id: "",
          token: "")
      .obs;

  RxString parentImage = "".obs;

  Rx<UserCredentials> userCredentials = UserCredentials(
          id: "",
          firstname: "",
          password: "",
          lastname: "",
          email: "",
          position: "",
          phoneNumber: "",
          country: "",
          address: "",
          notification: true,
          image: "",
          token: "")
      .obs;

  RxList<SchoolModel> getSchoolResponse = <SchoolModel>[].obs;

  Rx<TeacherModel> teachermodel = TeacherModel(
          createdBy: "",
          firstname: "",
          schoolName: "",
          schoolBanner: "",
          image: "",
          password: "",
          email: "",
          lastName: "",
          phoneNumber: "",
          nin: 1234567,
          maritalStatus: "",
          gender: "",
          stateOfOrigin: "",
          className: "",
          classSection: "",
          subjectRole: "",
          nationality: "",
          address: "",
          type: 2,
          id: "",
          token: "")
      .obs;

  Rx<SchoolModel> schoolModel = SchoolModel(
          createdBy: "",
          image: "",
          schoolName: "",
          email: "",
          phoneNumber: "",
          address: "",
          country: "",
          totalStudentRange: "",
          schoolType: [],
          id: "")
      .obs;

  RxString uploadedImage = "".obs;
  RxString schoolName = "".obs;
  RxList schoolType = [].obs;
  RxString schoolsize2 = "1-100".obs;
  RxBool isLoading = false.obs;
  Rx<SchoolSize> schoolSize = SchoolSize.hundred.obs;
  RxString phoneNumber = "".obs;
  RxString country = "Nigeria".obs;
  File? image;
  File? studentImage;
  File? profileImage;

  File? schoolLogo;

// Teachers
  RxInt type = 1.obs;
  RxString teacherAdminId = "".obs;
  RxString parentAdminId = "".obs;

  RxString teacherSchool = "".obs;
  RxString teacherSchoolImage = "".obs;

  RxString classSelection = 'Sss Two'.obs;
  RxString classSection = "A".obs;
  RxString subjectAssigned = "Mathematics".obs;
  RxString password = "".obs;
  RxString maritalStatus = "Single".obs;
  RxString teachergender = "Male".obs;

  fetchAllStudentsProfile() async {
    studentList.value =
        await ApiCalls().getStudentProfile("", "", "", parentAdminId.value);
  }

  fetchStudentswithIdList(Map<String, dynamic> data) async {
    studentListFromIds.value = await ApiCalls().getStudentWithIdList(data);
  }

  fetchAdminDetails(String id) async {
    userCredentials.value = await ApiCalls().getAdminDetailsUpdate(id);
  }

  fetchTeachersDetails(String id) async {
    teachermodel.value = await ApiCalls().getTeacheretailsUpdate(id);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  final cloudinary = Cloudinary.signedConfig(
    apiKey: "835465682576292",
    apiSecret: "8PE5JLnAugyOstV3EPuE7xrmcbQ",
    cloudName: "dm4eqhtyx",
  );
}
