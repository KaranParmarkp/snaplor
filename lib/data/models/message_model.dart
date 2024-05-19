// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'dart:convert';

List<MessageModel> messageModelFromJson(String str) => List<MessageModel>.from(json.decode(str).map((x) => MessageModel.fromJson(x)));

String messageModelToJson(List<MessageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessageModel {
  final String? id;
  final String? chatId;
  final String? recipientId;
  final String? senderId;
  final String? message;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
   bool? isSeen;

  MessageModel({
    this.id,
    this.chatId,
    this.recipientId,
    this.senderId,
    this.message,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.isSeen
  });

  MessageModel copyWith({
    String? id,
    String? chatId,
    String? recipientId,
    String? senderId,
    String? message,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    bool? isSeen
  }) =>
      MessageModel(
        id: id ?? this.id,
        chatId: chatId ?? this.chatId,
        recipientId: recipientId ?? this.recipientId,
        senderId: senderId ?? this.senderId,
        message: message ?? this.message,
        isDeleted: isDeleted ?? this.isDeleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        isSeen: isSeen ?? this.isSeen
      );

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    id: json["_id"],
    chatId: json["chat_id"],
    recipientId: json["recipient_id"],
    senderId: json["sender_id"],
    message: json["message"],
    isDeleted: json["is_deleted"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    v: json["__v"],
    isSeen: json["is_seen"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "chat_id": chatId,
    "recipient_id": recipientId,
    "sender_id": senderId,
    "message": message,
    "is_deleted": isDeleted,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
