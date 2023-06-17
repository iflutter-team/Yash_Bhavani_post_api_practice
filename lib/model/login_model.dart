// To parse this JSON data, do
//
//     final userLogin = userLoginFromJson(jsonString);

import 'dart:convert';

UserLogin userLoginFromJson(String str) => UserLogin.fromJson(json.decode(str));

String userLoginToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {
  int? status;
  String? message;
  Data? data;
  List<dynamic>? validationMessage;
  dynamic errorMessage;

  UserLogin({
    this.status,
    this.message,
    this.data,
    this.validationMessage,
    this.errorMessage,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
    status: json["Status"],
    message: json["Message"],
    data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
    validationMessage: json["ValidationMessage"] == null ? [] : List<dynamic>.from(json["ValidationMessage"]!.map((x) => x)),
    errorMessage: json["ErrorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
    "Data": data?.toJson(),
    "ValidationMessage": validationMessage == null ? [] : List<dynamic>.from(validationMessage!.map((x) => x)),
    "ErrorMessage": errorMessage,
  };
}

class Data {
  String? customerGuid;
  String? userName;
  String? emailId;
  String? message;
  bool? isValid;
  bool? rememberMe;
  int? customerId;

  Data({
    this.customerGuid,
    this.userName,
    this.emailId,
    this.message,
    this.isValid,
    this.rememberMe,
    this.customerId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    customerGuid: json["CustomerGuid"],
    userName: json["UserName"],
    emailId: json["EmailId"],
    message: json["Message"],
    isValid: json["IsValid"],
    rememberMe: json["RememberMe"],
    customerId: json["CustomerId"],
  );

  Map<String, dynamic> toJson() => {
    "CustomerGuid": customerGuid,
    "UserName": userName,
    "EmailId": emailId,
    "Message": message,
    "IsValid": isValid,
    "RememberMe": rememberMe,
    "CustomerId": customerId,
  };
}
