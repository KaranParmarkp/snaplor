// To parse this JSON data, do
//
//     final socialPostModel = socialPostModelFromJson(jsonString);

import 'dart:convert';

import '../../app/utils/utils.dart';
import 'models.dart';

List<SocialPostModel> socialPostModelFromJson(String str) => List<SocialPostModel>.from(json.decode(str).map((x) => SocialPostModel.fromJson(x)));

String socialPostModelToJson(List<SocialPostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SocialPostModel {
   String? id;
   User? user;
   String? content;
   bool? isHidden;
   bool? isPinned;
   int? totalComment;
   int? totalLikes;
   int? totalShare;
   int? totalRepost;
   bool? isDeleted;
   DateTime? createdAt;
   DateTime? updatedAt;
   int? v;
   String? imageUrl;
   String? videoUrl;
   PostType? type;
   bool? isLiked;
   SocialPostModel? originalPost;
  SocialPostModel({
    this.id,
    this.user,
    this.content,
    this.isHidden,
    this.isPinned,
    this.totalComment,
    this.totalLikes,
    this.totalShare,
    this.totalRepost,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.imageUrl,
    this.videoUrl,
    this.type,
    this.isLiked,
    this.originalPost
  });

  SocialPostModel copyWith({
    String? id,
    User? user,
    String? content,
    bool? isHidden,
    bool? isPinned,
    int? totalComment,
    int? totalLikes,
    int? totalShare,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    String? imageUrl,
    String? videoUrl,
    PostType? type,
    bool? isLiked,
    SocialPostModel? originalPost
  }) =>
      SocialPostModel(
        id: id ?? this.id,
        user: user ?? this.user,
        content: content ?? this.content,
        isHidden: isHidden ?? this.isHidden,
        isPinned: isPinned ?? this.isPinned,
        totalComment: totalComment ?? this.totalComment,
        totalLikes: totalLikes ?? this.totalLikes,
        totalShare: totalShare ?? this.totalShare,
        isDeleted: isDeleted ?? this.isDeleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        imageUrl: imageUrl ?? this.imageUrl,
        videoUrl: videoUrl ?? this.videoUrl,
        type: type ?? this.type,
        isLiked: isLiked?? this.isLiked,
      originalPost: originalPost ?? this.originalPost
      );

  factory SocialPostModel.fromJson(Map<String, dynamic> json) => SocialPostModel(
    id: json["_id"],
    user: json["user_id"] == null ? null : User.fromJson(json["user_id"]),
    content: json["content"],
    isHidden: json["is_hidden"],
    isPinned: json["is_pinned"],
    totalComment: json["total_comment"],
    totalLikes: json["total_likes"],
    totalShare: json["total_share"],
    totalRepost: json["total_repost"],
    isDeleted: json["is_deleted"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    v: json["__v"],
    imageUrl: json["image_url"],
    videoUrl: json["video_url"],
    isLiked: json["isLiked"],
    originalPost: json["original_post"]!=null && json["original_post"] is Map ? SocialPostModel.fromJson(json["original_post"]):null,
    type: json["video_url"]!=null && json["video_url"]!="" ? PostType.video : json["image_url"] !=null && json["image_url"]!=""? PostType.image : PostType.text,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user?.toJson(),
    "content": content,
    "is_hidden": isHidden,
    "is_pinned": isPinned,
    "total_comment": totalComment,
    "total_likes": totalLikes,
    "total_share": totalShare,
    "is_deleted": isDeleted,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "__v": v,
    "image_url": imageUrl,
    "video_url": videoUrl,
  };
}


