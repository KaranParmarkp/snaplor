// To parse this JSON data, do
//
//     final reviewModel = reviewModelFromJson(jsonString);

import 'dart:convert';

List<ReviewModel> reviewModelFromJson(String str) => List<ReviewModel>.from(json.decode(str).map((x) => ReviewModel.fromJson(x)));

String reviewModelToJson(List<ReviewModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReviewModel {
  final String? id;
  final String? astrologerId;
  final User? user;
  final String? orderId;
  final int? rating;
  final String? message;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final AstrologerResponse? astrologerResponse;

  ReviewModel({
    this.id,
    this.astrologerId,
    this.user,
    this.orderId,
    this.rating,
    this.message,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.astrologerResponse,
  });

  ReviewModel copyWith({
    String? id,
    String? astrologerId,
    User? user,
    String? orderId,
    int? rating,
    String? message,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    AstrologerResponse? astrologerResponse,
  }) =>
      ReviewModel(
        id: id ?? this.id,
        astrologerId: astrologerId ?? this.astrologerId,
        user: user ?? this.user,
        orderId: orderId ?? this.orderId,
        rating: rating ?? this.rating,
        message: message ?? this.message,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        astrologerResponse: astrologerResponse ?? this.astrologerResponse,
      );

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    id: json["_id"],
    astrologerId: json["astrologer_id"],
    user: json["user"] == null ? User(name: "",id: "") : User.fromJson(json["user"]),
    orderId: json["order_id"],
    rating: json["rating"],
    message: json["message"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    v: json["__v"],
    astrologerResponse: json["astrologer_response"] == null ? null : AstrologerResponse.fromJson(json["astrologer_response"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "astrologer_id": astrologerId,
    "user": user?.toJson(),
    "order_id": orderId,
    "rating": rating,
    "message": message,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "__v": v,
    "astrologer_response": astrologerResponse?.toJson(),
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

class User {
  final String? id;
  final String? name;
  final String? userName;
  final String? image;
  final bool? isVerified;
  final dynamic order;
  final dynamic experience;
  final dynamic role;

  User({
    this.id,
    this.name,
    this.userName,
    this.image,
    this.isVerified,
    this.order,
    this.experience,
    this.role
  });

  User copyWith({
    String? id,
    String? name,
    String? userName,
    String? image,
    bool? isVerified,
    dynamic order,
    dynamic experience,
    dynamic role
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        userName: userName ?? this.userName,
        image: image ?? this.image,
        isVerified: isVerified ?? this.isVerified,
        order: order ?? this.order,
        experience: experience ?? this.experience,
        role: role ?? this.role,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] ?? json["_id"],
    name: json["first_name"] !=null ?  (json["first_name"] ?? ""+json["last_name"] ?? "") : "",
    image: json["image"] ?? json["profile_image"],
    order: json["order"] ?? "",
    experience: json["experience"] ?? "",
    isVerified: json["is_verified"],
    role: json["role"],
    userName: json["user_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}
