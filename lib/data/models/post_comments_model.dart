// To parse this JSON data, do
//
//     final postCommenstModel = postCommenstModelFromJson(jsonString);

import 'dart:convert';

import 'package:jyotishee/data/models/generic_user_model.dart';

import 'models.dart';

List<PostCommentModel> postCommenstModelFromJson(String str) => List<PostCommentModel>.from(json.decode(str).map((x) => PostCommentModel.fromJson(x)));

String postCommenstModelToJson(List<PostCommentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostCommentModel {
  final String? id;
  final String? postId;
  final GenericUserModel? user;
  final String? comment;
  final bool? isHidden;
  final bool? isPinned;
  final int? totalLikes;
  final int? totalReplies;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  bool showReplyMore;
  PostCommentModel({
    this.id,
    this.postId,
    this.user,
    this.comment,
    this.isHidden,
    this.isPinned,
    this.totalLikes,
    this.totalReplies,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.showReplyMore=false
  });

  PostCommentModel copyWith({
    String? id,
    String? postId,
    GenericUserModel? user,
    String? comment,
    bool? isHidden,
    bool? isPinned,
    int? totalLikes,
    int? totalReplies,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    bool? showReplyMore

  }) =>
      PostCommentModel(
        id: id ?? this.id,
        postId: postId ?? this.postId,
        user: user ?? this.user,
        comment: comment ?? this.comment,
        isHidden: isHidden ?? this.isHidden,
        isPinned: isPinned ?? this.isPinned,
        totalLikes: totalLikes ?? this.totalLikes,
        totalReplies: totalReplies ?? this.totalReplies,
        isDeleted: isDeleted ?? this.isDeleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        showReplyMore: showReplyMore ?? this.showReplyMore,
      );

  factory PostCommentModel.fromJson(Map<String, dynamic> json) => PostCommentModel(
    id: json["_id"],
    postId: json["post_id"],
    user: json["user_id"] == null ? GenericUserModel() : GenericUserModel.fromJson(json["user_id"]),
    comment: json["comment"] ?? json["reply"],
    isHidden: json["is_hidden"],
    isPinned: json["is_pinned"],
    totalLikes: json["total_likes"],
    totalReplies: json["total_replies"],
    isDeleted: json["is_deleted"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    v: json["__v"],
    showReplyMore: false
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "post_id": postId,
    "user": user?.toJson(),
    "comment": comment,
    "is_hidden": isHidden,
    "is_pinned": isPinned,
    "total_likes": totalLikes,
    "total_replies": totalReplies,
    "is_deleted": isDeleted,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "__v": v,
  };
}


