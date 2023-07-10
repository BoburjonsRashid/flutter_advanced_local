// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

// EmpResponse welcomeFromJson(String str) =>
//     EmpResponse.fromJson(json.decode(str));
//
// String welcomeToJson(EmpResponse data) => json.encode(data.toJson());

class EmpResponse {
  String? status;
  List<Employee>? data;
  String? message;

  EmpResponse({
    this.status,
    this.data,
    this.message,
  });

  factory EmpResponse.fromJson(Map<String, dynamic> json) => EmpResponse(
        status: json["status"],
        data:
            List<Employee>.from(json["data"].map((x) => Employee.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Employee {
  int? id;
  String? employeeName;
  int? employeeSalary;
  int? employeeAge;
  String? profileImage;

  Employee({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
    required this.profileImage,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        employeeName: json["employee_name"],
        employeeSalary: json["employee_salary"],
        employeeAge: json["employee_age"],
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employee_name": employeeName,
        "employee_salary": employeeSalary,
        "employee_age": employeeAge,
        "profile_image": profileImage,
      };
}
