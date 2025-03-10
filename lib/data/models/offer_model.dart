// To parse this JSON data, do
//
//     final offerModel = offerModelFromJson(jsonString);

import 'dart:convert';

OfferModel offerModelFromJson(String str) => OfferModel.fromJson(json.decode(str));

String offerModelToJson(OfferModel data) => json.encode(data.toJson());

class OfferModel {
  final String? id;
  final String? name;
  final String? code;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? userType;
  final String? offerType;
  final int? discountPercentage;
  final bool? isDeleted;
  final bool? isActive;
  final int? v;
  final int? myShare;
  final int? adminShare;
  final int? customerShare;
  final String? description;

  OfferModel({
    this.id,
    this.name,
    this.code,
    this.startDate,
    this.endDate,
    this.userType,
    this.offerType,
    this.discountPercentage,
    this.isDeleted,
    this.isActive,
    this.v,
    this.adminShare,this.myShare,this.customerShare,this.description
  });

  OfferModel copyWith({
    String? id,
    String? name,
    String? code,
    DateTime? startDate,
    DateTime? endDate,
    String? userType,
    String? offerType,
    int? discountPercentage,
    bool? isDeleted,
    bool? isActive,
    int? v,
     int? myShare,
     int? jyotisheeShare,
     int? customerShare,

  }) =>
      OfferModel(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        userType: userType ?? this.userType,
        offerType: offerType ?? this.offerType,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        isDeleted: isDeleted ?? this.isDeleted,
        isActive: isActive ?? this.isActive,
        v: v ?? this.v,
        adminShare: jyotisheeShare ?? this.adminShare,
        customerShare: customerShare ?? this.customerShare,
        myShare: myShare ?? this.myShare,
      );

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
    id: json["_id"],
    name: json["name"],
    code: json["code"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    userType: json["user_type"],
    offerType: json["offer_type"],
    discountPercentage: json["discount_percentage"],
    isDeleted: json["is_deleted"],
    isActive: json["is_activate"],
    v: json["__v"],
    customerShare: (json["my_share"] ?? 0) + (json["jyotishee_share"] ?? 0),
    myShare: json["my_share"],
    adminShare: json["admin_share"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "code": code,
    "start_date": startDate?.toIso8601String(),
    "end_date": endDate?.toIso8601String(),
    "user_type": userType,
    "offer_type": offerType,
    "discount_percentage": discountPercentage,
    "is_deleted": isDeleted,
    "is_active": isActive,
    "__v": v,
  };
}
