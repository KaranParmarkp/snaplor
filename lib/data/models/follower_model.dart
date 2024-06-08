import 'package:jyotishee/data/models/generic_user_model.dart';

class FollowerModel {
  String id;
  //String followingId;
  GenericUserModel user;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  FollowerModel({
    required this.id,
  //  required this.followingId,
    required this.user,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory FollowerModel.fromJson(Map<String, dynamic> json) => FollowerModel(
    id: json["_id"],
    //followingId: json["following_id"] ?? json["follower_id"],
    user: GenericUserModel.fromJson(json["follower_id"] is Map<String,dynamic>?json["follower_id"] : json["following_id"]),
    isDeleted: json["is_deleted"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    //"following_id": followingId,
    "follower_id": user.toJson(),
    "is_deleted": isDeleted,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "__v": v,
  };
}