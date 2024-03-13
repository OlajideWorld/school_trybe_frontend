class TeacherModel {
  String createdBy;
  String firstname;
  String schoolName;
  String schoolBanner;
  String image;
  String password;
  String email;
  String lastName;
  String phoneNumber;
  int nin;
  String maritalStatus;
  String gender;
  String stateOfOrigin;
  String className;
  String classSection;
  String subjectRole;
  String nationality;
  String address;
  int type;
  String id;
  String token;

  TeacherModel({
    required this.createdBy,
    required this.firstname,
    required this.schoolName,
    required this.schoolBanner,
    required this.image,
    required this.password,
    required this.email,
    required this.lastName,
    required this.phoneNumber,
    required this.nin,
    required this.maritalStatus,
    required this.gender,
    required this.stateOfOrigin,
    required this.className,
    required this.classSection,
    required this.subjectRole,
    required this.nationality,
    required this.address,
    required this.type,
    required this.id,
    required this.token,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) => TeacherModel(
        createdBy: json["createdBy"],
        firstname: json["firstname"],
        schoolName: json["schoolName"],
        schoolBanner: json["schoolBanner"],
        image: json["image"],
        password: json["password"],
        email: json["email"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        nin: json["nin"],
        maritalStatus: json["maritalStatus"],
        gender: json["gender"],
        stateOfOrigin: json["stateOfOrigin"],
        className: json["className"],
        classSection: json["classSection"],
        subjectRole: json["subjectRole"],
        nationality: json["nationality"],
        address: json["address"],
        type: json["type"],
        id: json["_id"],
        token: json["token"],
      );
}
