// ignore_for_file: file_names

import 'package:school_management/pages/Teacher%20dashboard/SIgn-In%20Page/controller/registrationController.dart';

RegistrationController regController = RegistrationController.instance;

class SelectionClass {
  List<Map> classList = [
    {"image": regController.schoolModel.value.image, "name": "Sss Three"},
    {"image": regController.schoolModel.value.image, "name": "Sss Two"},
    {"image": regController.schoolModel.value.image, "name": "Sss One"},
    {"image": regController.schoolModel.value.image, "name": "Jss Three"},
    {"image": regController.schoolModel.value.image, "name": "Jss Two"},
    {"image": regController.schoolModel.value.image, "name": "Jss One"}
  ];

  List eventType = ["All Events", "Events created by me"];

  List termsUsed = ["First term", "Second term", "Third term"];

  List classSection = ["A", "B", "C", "D"];

  List bloodGroup = ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];

  List selectTerm = ["First Term", "Second Term", "Third Term"];

  List studentClass = [
    "Jss One",
    "Jss Two",
    "Jss Three",
    "Sss One",
    "Sss Two",
    "Sss Three"
  ];

  List studentSchoolingtype = ["Day Student", "Boarder"];

  List subjectAssigned = [
    "Mathematics",
    "Biology",
    "English",
    "Chemistry",
    "Physics"
  ];

  List maritalStatus = ["Single", "Married", "Divorced"];

  List gender = ["Male", "Female"];
}
