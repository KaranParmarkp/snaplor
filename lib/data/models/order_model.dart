// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

import 'package:jyotishee/data/models/generic_user_model.dart';

List<OrderModel> orderModelFromJson(String str) =>
    List<OrderModel>.from(json.decode(str).map((x) => OrderModel.fromJson(x)));

String orderModelToJson(List<OrderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderModel {
  final String? id;
  final GenericUserModel? user;
  final AstrologerOffer? astrologerOffer;
  final String? status;
  final String? orderSource;
  final dynamic duration;
  final int? subtotalAmount;
  final int? totalPaid;
  final int? totalShipping;
  final int? totalShippingDiscount;
  final int? totalDiscount;
  final ChatRequestId? callRequestId;
  final ChatRequestId? chatRequestId;
  final dynamic astrologerAmount;
  final dynamic adminAmount;
  final String? paymentStatus;
  final bool? isExchange;
  final bool? isCod;
  final bool? isRefunded;
  final List<dynamic>? products;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? pricePerMinute;
  final IntakeForm? intakeForm;
  final ReviewOrder? reviewOrder;
  final bool? askedReview;
  final String? voiceCallUrl;
  final String? refCode;

  OrderModel(
      {this.id,
      this.user,
      this.astrologerOffer,
      this.status,
      this.orderSource,
      this.duration,
      this.subtotalAmount,
      this.totalPaid,
      this.totalShipping,
      this.totalShippingDiscount,
      this.totalDiscount,
      this.callRequestId,
      this.chatRequestId,
      this.astrologerAmount,
      this.adminAmount,
      this.paymentStatus,
      this.isExchange,
      this.isCod,
      this.isRefunded,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.pricePerMinute,
      this.intakeForm,
      this.reviewOrder,
      this.voiceCallUrl,
      this.askedReview,
      this.refCode});

  OrderModel copyWith(
          {String? id,
          GenericUserModel? user,
          AstrologerOffer? astrologer,
          String? status,
          String? orderSource,
          dynamic duration,
          int? subtotalAmount,
          int? totalPaid,
          int? totalShipping,
          int? totalShippingDiscount,
          int? totalDiscount,
          ChatRequestId? callRequestId,
          ChatRequestId? chatRequestId,
          int? astrologerAmount,
          int? adminAmount,
          String? paymentStatus,
          bool? isExchange,
          bool? isCod,
          bool? isRefunded,
          List<dynamic>? products,
          DateTime? createdAt,
          DateTime? updatedAt,
          int? v,
          IntakeForm? intakeForm,
          ReviewOrder? reviewOrder,
          String? voiceCallUrl,
          bool? askedReview,
          String? refCode}) =>
      OrderModel(
          id: id ?? this.id,
          user: user ?? this.user,
          astrologerOffer: astrologer ?? this.astrologerOffer,
          status: status ?? this.status,
          orderSource: orderSource ?? this.orderSource,
          duration: duration ?? this.duration,
          subtotalAmount: subtotalAmount ?? this.subtotalAmount,
          totalPaid: totalPaid ?? this.totalPaid,
          totalShipping: totalShipping ?? this.totalShipping,
          totalShippingDiscount:
              totalShippingDiscount ?? this.totalShippingDiscount,
          totalDiscount: totalDiscount ?? this.totalDiscount,
          callRequestId: callRequestId ?? this.callRequestId,
          chatRequestId: chatRequestId ?? this.chatRequestId,
          astrologerAmount: astrologerAmount ?? this.astrologerAmount,
          adminAmount: adminAmount ?? this.adminAmount,
          paymentStatus: paymentStatus ?? this.paymentStatus,
          isExchange: isExchange ?? this.isExchange,
          isCod: isCod ?? this.isCod,
          isRefunded: isRefunded ?? this.isRefunded,
          products: products ?? this.products,
          createdAt: createdAt ?? this.createdAt,
          updatedAt: updatedAt ?? this.updatedAt,
          v: v ?? this.v,
          intakeForm: intakeForm ?? this.intakeForm,
          reviewOrder: reviewOrder ?? this.reviewOrder,
          voiceCallUrl: voiceCallUrl ?? this.voiceCallUrl,
          askedReview: askedReview ?? this.askedReview,
          refCode: refCode ?? this.refCode);

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["_id"],
        user: json["user_id"] == null
            ? null
            : GenericUserModel.fromJson(json["user_id"]),
        astrologerOffer: json["astrologer_offer_id"] == null
            ? null
            : AstrologerOffer.fromJson(json["astrologer_offer_id"]),
        status: json["status"],
        orderSource: json["order_source"],
        duration: json["duration"],
        subtotalAmount: json["subtotal_amount"],
        totalPaid: json["total_paid"],
        totalShipping: json["total_shipping"],
        totalShippingDiscount: json["total_shipping_discount"],
        totalDiscount: json["total_discount"],
        chatRequestId: json["chat_request_id"] != null
            ? ChatRequestId.fromJson(json["chat_request_id"])
            : null,
        callRequestId: json["call_request_id"] != null
            ? ChatRequestId.fromJson(json["call_request_id"])
            : null,
        astrologerAmount: json["astrologer_amount"],
        adminAmount: json["admin_amount"],
        paymentStatus: json["payment_status"],
        isExchange: json["is_exchange"],
        isCod: json["is_cod"],
        pricePerMinute: json["price_per_minute"],
        isRefunded: json["is_refunded"],
        products: json["products"] == null
            ? []
            : List<dynamic>.from(json["products"]!.map((x) => x)),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        v: json["__v"],
        intakeForm: json["chat_request_id"] != null
            ? IntakeForm.fromJson(json["chat_request_id"]["intake_form"])
            : IntakeForm.fromJson(json["call_request_id"]["intake_form"]),
        reviewOrder: json["review"] == null
            ? null
            : ReviewOrder.fromJson(json["review"]),
        voiceCallUrl: json["recording_url"],
        askedReview: json["asked_review"],
        refCode: json["reference_code"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user?.toJson(),
        "astrologer": astrologerOffer?.toJson(),
        "status": status,
        "order_source": orderSource,
        "duration": duration,
        "subtotal_amount": subtotalAmount,
        "total_paid": totalPaid,
        "total_shipping": totalShipping,
        "total_shipping_discount": totalShippingDiscount,
        "total_discount": totalDiscount,
        "call_request_id": callRequestId,
        "astrologer_amount": astrologerAmount,
        "admin_amount": adminAmount,
        "payment_status": paymentStatus,
        "is_exchange": isExchange,
        "is_cod": isCod,
        "is_refunded": isRefunded,
        "products":
            products == null ? [] : List<dynamic>.from(products!.map((x) => x)),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class AstrologerOffer {
  final String? id;
  String? name;
  String? description;
  dynamic discountPercentage;

  AstrologerOffer({
    this.id,
    this.name,
    this.description,
    this.discountPercentage,
  });

  AstrologerOffer copyWith({
    String? id,
    String? name,
    String? description,
    dynamic discountPercentage,
  }) =>
      AstrologerOffer(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        discountPercentage: discountPercentage ?? this.discountPercentage,
      );

  factory AstrologerOffer.fromJson(Map<String, dynamic> json) =>
      AstrologerOffer(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        discountPercentage: json["discount_percentage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class ChatRequestId {
  final String? id;
  final IntakeForm? intakeForm;

  ChatRequestId({this.id, this.intakeForm});

  factory ChatRequestId.fromJson(Map<String, dynamic> json) => ChatRequestId(
        id: json["_id"],
        intakeForm: IntakeForm.fromJson(json["intake_form"]),
      );
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

  factory IntakeForm.fromJson(Map<String, dynamic> json) => IntakeForm(
        name: json["name"],
        gender: json["gender"],
        mobileNo: json["mobile_no"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        timeOfBirth: json["time_of_birth"],
        birthPlace: json["birth_place"],
        occupation: json["occupation"],
        topicOfConcern: json["topic_of_concern"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "mobile_no": mobileNo,
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "time_of_birth": timeOfBirth,
        "birth_place": birthPlace,
        "occupation": occupation,
        "topic_of_concern": topicOfConcern,
      };
}

class ReviewOrder {
  String? id;
  String? orderId;
  int? rating;
  String? message;

  ReviewOrder({this.id, this.orderId, this.rating, this.message});

  factory ReviewOrder.fromJson(Map<String, dynamic> json) => ReviewOrder(
        id: json["_id"],
        orderId: json["order_id"],
        rating: json["rating"],
        message: json["message"],
      );
}
