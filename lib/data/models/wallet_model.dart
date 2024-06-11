// To parse this JSON data, do
//
//     final walletModel = walletModelFromJson(jsonString);

import 'dart:convert';

import 'package:jyotishee/app/utils/enums.dart';

import 'generic_user_model.dart';
import 'models.dart';

List<WalletModel> walletModelFromJson(String str) => List<WalletModel>.from(json.decode(str).map((x) => WalletModel.fromJson(x)));

String walletModelToJson(List<WalletModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WalletModel {
  final String? id;
  final String? astrologerId;
  final int? prevAmount;
  final int? newAmount;
  final TransactionType? transactionType;
  final String? orderId;
  final int? amount;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? payoutId;
  final GenericUserModel? user;

  WalletModel({
    this.id,
    this.astrologerId,
    this.prevAmount,
    this.newAmount,
    this.transactionType,
    this.orderId,
    this.amount,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.payoutId,
    this.user
  });

  WalletModel copyWith({
    String? id,
    String? astrologerId,
    int? prevAmount,
    int? newAmount,
    TransactionType? transactionType,
    String? orderId,
    int? amount,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    String? payoutId,
    GenericUserModel? user
  }) =>
      WalletModel(
        id: id ?? this.id,
        astrologerId: astrologerId ?? this.astrologerId,
        prevAmount: prevAmount ?? this.prevAmount,
        newAmount: newAmount ?? this.newAmount,
        transactionType: transactionType ?? this.transactionType,
        orderId: orderId ?? this.orderId,
        amount: amount ?? this.amount,
        isDeleted: isDeleted ?? this.isDeleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        payoutId: payoutId ?? this.payoutId,
        user: user ?? this.user
      );

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
    id: json["_id"],
    astrologerId: json["astrologer_id"],
    prevAmount: json["prev_amount"],
    newAmount: json["new_amount"],
    transactionType: json["transaction_type"]=="add" ? TransactionType.add : TransactionType.subtract,
    orderId: json["order_id"],
    amount: json["amount"],
    isDeleted: json["is_deleted"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    v: json["__v"],
    payoutId: json["payout_id"],
    user: GenericUserModel.fromJson( json["user_id"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "astrologer_id": astrologerId,
    "prev_amount": prevAmount,
    "new_amount": newAmount,
    "transaction_type": transactionType,
    "order_id": orderId,
    "amount": amount,
    "is_deleted": isDeleted,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "__v": v,
    "payout_id": payoutId,
  };
}
