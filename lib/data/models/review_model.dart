// To parse this JSON data, do
//
//     final reviewModel = reviewModelFromJson(jsonString);

import 'dart:convert';

import 'generic_user_model.dart';

List<ReviewModel> reviewModelFromJson(String str) => List<ReviewModel>.from(json.decode(str).map((x) => ReviewModel.fromJson(x)));

String reviewModelToJson(List<ReviewModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReviewModel {
  final String? id;
  final GenericUserModel? astrologerId;
  final GenericUserModel? user;
  final OrderId? orderId;
  final int? rating;
  final String? message;
  final DateTime? createdAt;
  final AstrologerResponse? astrologerResponse;
  bool? isFieldOpen;
  final String? refCode;
  ReviewModel({
    this.id,
    this.astrologerId,
    this.user,
    this.orderId,
    this.rating,
    this.message,
    this.createdAt,
    this.astrologerResponse,
    this.isFieldOpen=false,
    this.refCode
  });

  ReviewModel copyWith({
    String? id,
    GenericUserModel? astrologerId,
    GenericUserModel? user,
    OrderId? orderId,
    int? rating,
    String? message,
    DateTime? createdAt,
    AstrologerResponse? astrologerResponse
  }) =>
      ReviewModel(
        id: id ?? this.id,
        astrologerId: astrologerId ?? this.astrologerId,
        user: user ?? this.user,
        orderId: orderId ?? this.orderId,
        rating: rating ?? this.rating,
        message: message ?? this.message,
        createdAt: createdAt ?? this.createdAt,
        astrologerResponse: astrologerResponse??this.astrologerResponse
      );

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    id: json["_id"],
    astrologerId: json["astrologer_id"] == null ? GenericUserModel(name: "",id: "") : GenericUserModel.fromJson(json["astrologer_id"]),
    user: json["user_id"] == null ? GenericUserModel(name: "",id: "") : GenericUserModel.fromJson(json["user_id"]),
    orderId: OrderId.fromJson(json["order_id"]),
    rating: json["rating"],
    message: json["message"],
    refCode: json["reference_code"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    astrologerResponse: json["response"] == null ? null : AstrologerResponse.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "astrologer_id": astrologerId,
    "user": user?.toJson(),
    "order_id": orderId,
    "rating": rating,
    "message": message,
    "created_at": createdAt?.toIso8601String(),
  };
}

class AstrologerResponse {
  final String? name;
  final String? message;
  final DateTime? date;

  AstrologerResponse({
    this.name,
    this.message,
    this.date,
  });

  AstrologerResponse copyWith({
    String? name,
    String? message,
    DateTime? date,
  }) =>
      AstrologerResponse(
        name: name ?? this.name,
        message: message ?? this.message,
        date: date ?? this.date,
      );

  factory AstrologerResponse.fromJson(Map<String, dynamic> json) => AstrologerResponse(
    name: json["name"],
    message: json["message"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "message": message,
    "date": date?.toIso8601String(),
  };
}


class OrderId {
  String id;
  String orderSource;
  String refCode;

  OrderId({
    required this.id,
    required this.orderSource,
    required this.refCode,
  });

  factory OrderId.fromJson(Map<String, dynamic> json) => OrderId(
    id: json["_id"],
    orderSource: json["order_source"],
    refCode: json["reference_code"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "order_source": orderSource,
  };
}