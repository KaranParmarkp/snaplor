// To parse this JSON data, do
//
//     final waitlistModel = waitlistModelFromJson(jsonString);

import 'dart:convert';

import 'models.dart';

List<WaitListModel> waitlistModelFromJson(String str) => List<WaitListModel>.from(json.decode(str).map((x) => WaitListModel.fromJson(x)));

String waitlistModelToJson(List<WaitListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WaitListModel {
  final User? user;
  final User? astrologer;
  final IntakeForm? intakeForm;
  final String? id;
  final String? status;
  final bool? isFree;
  final List<dynamic>? statusHistory;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? pricePerMinute;

  WaitListModel({
    this.user,
    this.astrologer,
    this.intakeForm,
    this.id,
    this.status,
    this.isFree,
    this.statusHistory,
    this.createdAt,
    this.updatedAt,
    this.v,this.pricePerMinute
  });

  WaitListModel copyWith({
    User? user,
    User? astrologer,
    IntakeForm? intakeForm,
    String? id,
    String? status,
    bool? isFree,
    List<dynamic>? statusHistory,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      WaitListModel(
        user: user ?? this.user,
        astrologer: astrologer ?? this.astrologer,
        intakeForm: intakeForm ?? this.intakeForm,
        id: id ?? this.id,
        status: status ?? this.status,
        isFree: isFree ?? this.isFree,
        statusHistory: statusHistory ?? this.statusHistory,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory WaitListModel.fromJson(Map<String, dynamic> json) => WaitListModel(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    astrologer: json["astrologer"] == null ? null : User.fromJson(json["astrologer"]),
    intakeForm: json["intake_form"] == null ? null : IntakeForm.fromJson(json["intake_form"]),
    id: json["_id"],
    status: json["status"],
    isFree: json["is_free"],
    statusHistory: json["status_history"] == null ? [] : List<dynamic>.from(json["status_history"]!.map((x) => x)),
    createdAt: json["createdAt"] == null ? json["created_at"] == null ? null : DateTime.parse(json["created_at"]): DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    pricePerMinute: json["price_per_minute"],
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "astrologer": astrologer?.toJson(),
    "intake_form": intakeForm?.toJson(),
    "_id": id,
    "status": status,
    "is_free": isFree,
    "status_history": statusHistory == null ? [] : List<dynamic>.from(statusHistory!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}


class IntakeForm {
  final String? name;
  final String? gender;
  final String? mobileNo;
  final DateTime? dateOfBirth;
  final String? timeOfBirth;
  final String? birthPlace;
  final String? occupation;
  final String? topicOfConcern;

  IntakeForm({
    this.name,
    this.gender,
    this.mobileNo,
    this.dateOfBirth,
    this.timeOfBirth,
    this.birthPlace,
    this.occupation,
    this.topicOfConcern,
  });

  IntakeForm copyWith({
    String? name,
    String? gender,
    String? mobileNo,
    DateTime? dateOfBirth,
    String? timeOfBirth,
    String? birthPlace,
    String? occupation,
    String? topicOfConcern,
  }) =>
      IntakeForm(
        name: name ?? this.name,
        gender: gender ?? this.gender,
        mobileNo: mobileNo ?? this.mobileNo,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        timeOfBirth: timeOfBirth ?? this.timeOfBirth,
        birthPlace: birthPlace ?? this.birthPlace,
        occupation: occupation ?? this.occupation,
        topicOfConcern: topicOfConcern ?? this.topicOfConcern,
      );

  factory IntakeForm.fromJson(Map<String, dynamic> json) => IntakeForm(
    name: json["name"],
    gender: json["gender"],
    mobileNo: json["mobile_no"],
    dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
    timeOfBirth: json["time_of_birth"],
    birthPlace: json["birth_place"],
    occupation: json["occupation"],
    topicOfConcern: json["topic_of_concern"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "gender": gender,
    "mobile_no": mobileNo,
    "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
    "time_of_birth": timeOfBirth,
    "birth_place": birthPlace,
    "occupation": occupation,
    "topic_of_concern": topicOfConcern,
  };
}
