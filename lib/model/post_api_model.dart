// To parse this JSON data, do
//
//     final userSingUp = userSingUpFromJson(jsonString);

import 'dart:convert';

UserSingUp userSingUpFromJson(String str) => UserSingUp.fromJson(json.decode(str));

String userSingUpToJson(UserSingUp data) => json.encode(data.toJson());

class UserSingUp {
  int? status;
  String? message;
  Data? data;
  List<dynamic>? validationMessage;
  dynamic errorMessage;

  UserSingUp({
    this.status,
    this.message,
    this.data,
    this.validationMessage,
    this.errorMessage,
  });

  factory UserSingUp.fromJson(Map<String, dynamic> json) => UserSingUp(
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
  bool? isValidRegistration;
  int? customerId;
  dynamic adminComment;
  bool? active;
  int? affiliateId;
  dynamic billingAddress;
  dynamic cannotLoginUntilDateUtc;
  DateTime? createdOnUtc;
  String? customerGuid;
  bool? deleted;
  String? email;
  dynamic emailToRevalidate;
  int? failedLoginAttempts;
  bool? hasShoppingCartItems;
  bool? isSystemAccount;
  bool? isTaxExempt;
  DateTime? lastActivityDateUtc;
  dynamic lastIpAddress;
  dynamic lastLoginDateUtc;
  int? registeredInStoreId;
  bool? requireReLogin;
  dynamic shippingAddress;
  dynamic systemName;
  String? username;
  int? vendorId;
  String? message;

  Data({
    this.isValidRegistration,
    this.customerId,
    this.adminComment,
    this.active,
    this.affiliateId,
    this.billingAddress,
    this.cannotLoginUntilDateUtc,
    this.createdOnUtc,
    this.customerGuid,
    this.deleted,
    this.email,
    this.emailToRevalidate,
    this.failedLoginAttempts,
    this.hasShoppingCartItems,
    this.isSystemAccount,
    this.isTaxExempt,
    this.lastActivityDateUtc,
    this.lastIpAddress,
    this.lastLoginDateUtc,
    this.registeredInStoreId,
    this.requireReLogin,
    this.shippingAddress,
    this.systemName,
    this.username,
    this.vendorId,
    this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    isValidRegistration: json["IsValidRegistration"],
    customerId: json["CustomerId"],
    adminComment: json["AdminComment"],
    active: json["Active"],
    affiliateId: json["AffiliateId"],
    billingAddress: json["BillingAddress"],
    cannotLoginUntilDateUtc: json["CannotLoginUntilDateUtc"],
    createdOnUtc: json["CreatedOnUtc"] == null ? null : DateTime.parse(json["CreatedOnUtc"]),
    customerGuid: json["CustomerGuid"],
    deleted: json["Deleted"],
    email: json["Email"],
    emailToRevalidate: json["EmailToRevalidate"],
    failedLoginAttempts: json["FailedLoginAttempts"],
    hasShoppingCartItems: json["HasShoppingCartItems"],
    isSystemAccount: json["IsSystemAccount"],
    isTaxExempt: json["IsTaxExempt"],
    lastActivityDateUtc: json["LastActivityDateUtc"] == null ? null : DateTime.parse(json["LastActivityDateUtc"]),
    lastIpAddress: json["LastIpAddress"],
    lastLoginDateUtc: json["LastLoginDateUtc"],
    registeredInStoreId: json["RegisteredInStoreId"],
    requireReLogin: json["RequireReLogin"],
    shippingAddress: json["ShippingAddress"],
    systemName: json["SystemName"],
    username: json["Username"],
    vendorId: json["VendorId"],
    message: json["Message"],
  );

  Map<String, dynamic> toJson() => {
    "IsValidRegistration": isValidRegistration,
    "CustomerId": customerId,
    "AdminComment": adminComment,
    "Active": active,
    "AffiliateId": affiliateId,
    "BillingAddress": billingAddress,
    "CannotLoginUntilDateUtc": cannotLoginUntilDateUtc,
    "CreatedOnUtc": createdOnUtc?.toIso8601String(),
    "CustomerGuid": customerGuid,
    "Deleted": deleted,
    "Email": email,
    "EmailToRevalidate": emailToRevalidate,
    "FailedLoginAttempts": failedLoginAttempts,
    "HasShoppingCartItems": hasShoppingCartItems,
    "IsSystemAccount": isSystemAccount,
    "IsTaxExempt": isTaxExempt,
    "LastActivityDateUtc": lastActivityDateUtc?.toIso8601String(),
    "LastIpAddress": lastIpAddress,
    "LastLoginDateUtc": lastLoginDateUtc,
    "RegisteredInStoreId": registeredInStoreId,
    "RequireReLogin": requireReLogin,
    "ShippingAddress": shippingAddress,
    "SystemName": systemName,
    "Username": username,
    "VendorId": vendorId,
    "Message": message,
  };
}
