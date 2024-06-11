import 'package:jyotishee/data/models/models.dart';

import 'generic_user_model.dart';

class NotificationDataModel {
  String id;
  GenericUserModel actorId;
  Target target;
  bool seen;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  String title;

  NotificationDataModel({
    required this.id,
    required this.actorId,
    required this.seen,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.target,
  });

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) => NotificationDataModel(
    id: json["_id"],
    actorId: GenericUserModel.fromJson(json["actor_id"]),
    target: Target.fromJson(json["target"]),
    seen: json["seen"],
    isDeleted: json["is_deleted"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    title: json["title"],
  );


}

class Target{
  String id;
  String entity;

  Target({required this.id, required this.entity});
  factory Target.fromJson(Map<String, dynamic> json) => Target(
    id: json["id"],
    entity: json["entity"],
  );
}