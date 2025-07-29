import 'dart:convert';

List<Login> loginFromJson(String str) =>
    List<Login>.from(json.decode(str).map((x) => Login.fromJson(x)));

String loginToJson(List<Login> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Login {
  String employeeCode;
  String employeeName;
  String reportingTo;
  String reportingName;
  String emailId;
  String mobileNo;
  String zone;
  int iat;
  int exp;

  Login({
    required this.employeeCode,
    required this.employeeName,
    required this.reportingTo,
    required this.reportingName,
    required this.emailId,
    required this.mobileNo,
    required this.zone,
    required this.iat,
    required this.exp,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    employeeCode: json["employeeCode"],
    employeeName: json["employeeName"],
    reportingTo: json["reportingTo"],
    reportingName: json["reportingName"],
    emailId: json["emailID"],
    mobileNo: json["mobileNo"],
    zone: json["zone"],
    iat: json["iat"],
    exp: json["exp"],
  );

  Map<String, dynamic> toJson() => {
    "employeeCode": employeeCode,
    "employeeName": employeeName,
    "reportingTo": reportingTo,
    "reportingName": reportingName,
    "emailID": emailId,
    "mobileNo": mobileNo,
    "zone": zone,
    "iat": iat,
    "exp": exp,
  };
}
