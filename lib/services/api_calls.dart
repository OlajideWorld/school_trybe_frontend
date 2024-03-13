import 'package:school_management/services/api_services.dart';
import 'package:school_management/services/parent_api_services.dart';
import 'package:school_management/services/teacher_api_services.dart';

class ApiCalls {
  signIn(Map<String, dynamic> data) async {
    final req = await ApiServices().signIn(data, "auth/signin");
    return req;
  }

  getAdminDetailsUpdate(String id) async {
    final req = await ApiServices()
        .getAdminDetails(id, "auth/sch_admin/get_admin_details");

    return req;
  }

  createSchool(Map<String, dynamic> data) async {
    final req =
        await ApiServices().createSchoool(data, "auth/sch_admin/create_school");
    return req;
  }

  changePassword(Map<String, dynamic> data) async {
    final req = await ApiServices()
        .changePassword(data, "auth/sch_admin/change_password");
    return req;
  }

  login(Map<String, dynamic> data) async {
    final req = await ApiServices().login(data, "auth/login");
    return req;
  }

  getSchoolDetails(String id) async {
    final req =
        await ApiServices().getSchoolDetails("auth/sch_admin/get_school", id);
    return req;
  }

  updateAdminProfile(Map<String, dynamic> data, String id, String email) async {
    final req = ApiServices()
        .updateAdminProfile(data, id, email, "auth/sch_admin/update_admin");

    return req;
  }

// Events
  getEvents() async {
    final req = await ApiServices().getEvents("auth/sch_admin/get_events");
    return req;
  }

  createEvents(Map<String, dynamic> data) async {
    final req = await ApiServices()
        .createEvents(data, "auth/sch_admin/create_event", "Event");
    return req;
  }

  deleteEvent(String id) async {
    final req = await ApiServices().deleteEventsAndAnnouncement(
        id, "auth/sch_admin/delete_event", "Events Deleted Successfully");

    return req;
  }

// Announcement
  getAnnouncement(String id) async {
    final req = await ApiServices()
        .getAnnouncemnet("auth/sch_admin/get_announcement", id);
    return req;
  }

  createAnnouncement(Map<String, dynamic> data) async {
    final req = await ApiServices().createEvents(
        data, "auth/sch_admin/create_announcement", "Announcement");
    return req;
  }

  deleteAnnouncement(String id) async {
    final req = await ApiServices().deleteEventsAndAnnouncement(
        id,
        "auth/sch_admin/delete_announcement",
        "Announcement Deleted Successfully");

    return req;
  }

// Student Profile
  createStudent(Map<String, dynamic> data) async {
    final req = await ApiServices()
        .createStudentProfile(data, "auth/sch_admin/create_student");
    return req;
  }

  getStudentProfile(String classAssigned, String classSection, String gender,
      String createdBy) async {
    final req = await ApiServices().getStudentProfile(createdBy, classAssigned,
        classSection, gender, "auth/sch_admin/get_students/query");
    return req;
  }

// Results
  createResults(Map<String, dynamic> data) async {
    final req = await ApiServices()
        .createEvents(data, "auth/sch_admin/create_results", "Results");
    return req;
  }

  getStudentResults(String id) async {
    final req =
        await ApiServices().getStudentResults(id, "auth/sch_admin/get_results");

    return req;
  }

// Create Dues
  createSchoolDues(Map<String, dynamic> data) async {
    final req = await ApiServices()
        .createEvents(data, "auth/sch_admin/create_dues", "School Dues");
    return req;
  }

  getSchoolDues() async {
    final req = await ApiServices().getSchoolDues("auth/sch_admin/get_dues");
    return req;
  }

  // Teachers List
  getAllTeachers(String id) async {
    final req =
        await ApiServices().getAllTeachers("auth/sch_admin/get_teachers", id);
    return req;
  }

//
//
//

  // Teachers APi Route
  //
  //

// Create Complaints

  createComplaints(Map<String, dynamic> data) async {
    final req = await TeacherApiServices().teacherCreateEvents(
        data, "auth/teacher/create_complaints", "Complaints");

    return req;
  }

// Create Events
  teacherCreateEvents(Map<String, dynamic> data) async {
    final req = await TeacherApiServices()
        .teacherCreateEvents(data, "auth/teacher/create_event", "Event");
    return req;
  }

  fetchTeacherEvents(String id) async {
    final req = await TeacherApiServices()
        .fetchTeacherEvents("auth/sch_admin/get_events", id);
    return req;
  }

// Create Announcement
  createTeacherAnnouncement(Map<String, dynamic> data) async {
    final req = await TeacherApiServices().teacherCreateEvents(
        data, "auth/teacher/create_announcment", "Announcement");

    return req;
  }

  // Get Student
  getTeacherStudentProfile(String classAssigned, String classSection,
      String gender, String createdBy) async {
    final req = await TeacherApiServices().getTeacherStudentProfile(
        createdBy,
        classAssigned,
        classSection,
        gender,
        "auth/sch_admin/get_students/query");
    return req;
  }

  teacherCreateStudent(Map<String, dynamic> data) async {
    final req = await ApiServices()
        .createStudentProfile(data, "auth/teacher/create_student");
    return req;
  }

  //update teachers data

  updateTeacher(Map<String, dynamic> data, String adminId) async {
    final req = await TeacherApiServices()
        .updateTeacher(data, "auth/teacher/update_teacher", adminId);
    return req;
  }

  getTeacheretailsUpdate(String id) async {
    final req = await TeacherApiServices()
        .getTeacherDetails(id, "auth/teacher/get_teacher_details");

    return req;
  }

  createTeacherRoute(
      Map<String, dynamic> data, String admin, String type) async {
    final req = await TeacherApiServices()
        .createTeacherRoute(data, "auth/teacher/sign_in", admin, type);

    return req;
  }

  updateTeacherPassword(
      Map<String, dynamic> data, String id, String adminId) async {
    final req = await TeacherApiServices().updateTeacherPassword(
        data, "auth/teacher/update_password", id, adminId);
    return req;
  }

  // Get Results
  teacherGetStudentResults(String id) async {
    final req =
        await ApiServices().getStudentResults(id, "auth/teacher/get_results");

    return req;
  }

  teacherCreateResults(Map<String, dynamic> data) async {
    final req = await ApiServices()
        .createEvents(data, "auth/teacher/create_results", "Results");
    return req;
  }

  //
  //
  // Parents Route
  //
  //

  parentSignUp(Map<String, dynamic> data, String id) async {
    final req = await ParentsApiServices()
        .parentsSignin(data, id, "auth/parent/sign_up");

    return req;
  }

  parentUpdatePassword(
      Map<String, dynamic> data, String id, String adminId) async {
    final req = await ParentsApiServices()
        .updateParentPassword(data, "auth/parent/update_password", id, adminId);
    return req;
  }

  getStudentWithIdList(Map<String, dynamic> data) async {
    final req = await ApiServices()
        .getStudentwithIdList(data, "auth/parent/get_student_Id");
    return req;
  }

  parentGetResults(String id) async {
    final req = await ParentsApiServices()
        .getParentStudentResults(id, "auth/parent/get_results");

    return req;
  }

  parentsGetAnnouncemnet() async {}

  parentsGetTeachers() async {}

  // forgetpassword(Map<String, String> data) async {
  //   final req =
  //       await ApiServices().postRequest(data, "auth/forgot-password/jwt");
  //   return req;
  // }

  // changePassword(Map<String, String> data) async {
  //   final req =
  //       await ApiServices().getRequest(data, "auth/change-password/:jwt");
  //   return req;
  // }

  // verifyMe(Map<String, String> data) async {
  //   final req = await ApiServices().getRequest(data, "auth/verify-me/:jwt");
  //   return req;
  // }
}
