// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

List<OrderModel> orderModelFromJson(String str) => List<OrderModel>.from(json.decode(str).map((x) => OrderModel.fromJson(x)));

String orderModelToJson(List<OrderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderModel {
  final String? id;
  final Astrologer? user;
  final Astrologer? astrologer;
  final String? status;
  final String? orderSource;
  final dynamic duration;
  final int? subtotalAmount;
  final int? totalPaid;
  final int? totalShipping;
  final int? totalShippingDiscount;
  final int? totalDiscount;
  final String? callRequestId;
  final int? astrologerAmount;
  final int? adminAmount;
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

  OrderModel({
    this.id,
    this.user,
    this.astrologer,
    this.status,
    this.orderSource,
    this.duration,
    this.subtotalAmount,
    this.totalPaid,
    this.totalShipping,
    this.totalShippingDiscount,
    this.totalDiscount,
    this.callRequestId,
    this.astrologerAmount,
    this.adminAmount,
    this.paymentStatus,
    this.isExchange,
    this.isCod,
    this.isRefunded,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,this.pricePerMinute,this.intakeForm
  });

  OrderModel copyWith({
    String? id,
    Astrologer? user,
    Astrologer? astrologer,
    String? status,
    String? orderSource,
    dynamic duration,
    int? subtotalAmount,
    int? totalPaid,
    int? totalShipping,
    int? totalShippingDiscount,
    int? totalDiscount,
    String? callRequestId,
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
  }) =>
      OrderModel(
        id: id ?? this.id,
        user: user ?? this.user,
        astrologer: astrologer ?? this.astrologer,
        status: status ?? this.status,
        orderSource: orderSource ?? this.orderSource,
        duration: duration ?? this.duration,
        subtotalAmount: subtotalAmount ?? this.subtotalAmount,
        totalPaid: totalPaid ?? this.totalPaid,
        totalShipping: totalShipping ?? this.totalShipping,
        totalShippingDiscount: totalShippingDiscount ?? this.totalShippingDiscount,
        totalDiscount: totalDiscount ?? this.totalDiscount,
        callRequestId: callRequestId ?? this.callRequestId,
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
          intakeForm : intakeForm ?? this.intakeForm
      );

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json["_id"],
    user: json["user"] == null ? null : Astrologer.fromJson(json["user"]),
    astrologer: json["astrologer"] == null ? null : Astrologer.fromJson(json["astrologer"]),
    status: json["status"],
    orderSource: json["order_source"],
    duration: json["duration"],
    subtotalAmount: json["subtotal_amount"],
    totalPaid: json["total_paid"],
    totalShipping: json["total_shipping"],
    totalShippingDiscount: json["total_shipping_discount"],
    totalDiscount: json["total_discount"],
    callRequestId: json["call_request_id"],
    astrologerAmount: json["astrologer_amount"],
    adminAmount: json["admin_amount"],
    paymentStatus: json["payment_status"],
    isExchange: json["is_exchange"],
    isCod: json["is_cod"],
    pricePerMinute: json["price_per_minute"],
    isRefunded: json["is_refunded"],
    products: json["products"] == null ? [] : List<dynamic>.from(json["products"]!.map((x) => x)),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    v: json["__v"],
    intakeForm: json["intake_form"] == null ? null : IntakeForm.fromJson(json["intake_form"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user?.toJson(),
    "astrologer": astrologer?.toJson(),
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
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x)),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Astrologer {
  final String? id;
  final String? name;
  final String? gender;

  Astrologer({
    this.id,
    this.name,
    this.gender,
  });

  Astrologer copyWith({
    String? id,
    String? name,
    String? gender,
  }) =>
      Astrologer(
        id: id ?? this.id,
        name: name ?? this.name,
        gender: gender ?? this.gender,
      );

  factory Astrologer.fromJson(Map<String, dynamic> json) => Astrologer(
    id: json["id"],
    name: json["name"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
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
