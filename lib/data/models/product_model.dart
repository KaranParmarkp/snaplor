// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  final String? id;
  final String? productName;
  final String? subtitle;
  final int? pricePerRatti;
  final int? discountPricePerRatti;
  final String? description;
  final String? productCategory;
  final String? productSubCategory;
  final List<String>? otherImages;
  final String? label;
  final bool? isFeatured;
  final bool? status;
  final List<Weight>? weights;
  final String? quality;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? thumbnailImage;
  final String? videoUrl;

  ProductModel({
    this.id,
    this.productName,
    this.subtitle,
    this.pricePerRatti,
    this.discountPricePerRatti,
    this.description,
    this.productCategory,
    this.productSubCategory,
    this.otherImages,
    this.label,
    this.isFeatured,
    this.status,
    this.weights,
    this.quality,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.thumbnailImage,
    this.videoUrl,
  });

  ProductModel copyWith({
    String? id,
    String? productName,
    String? subtitle,
    int? pricePerRatti,
    int? discountPricePerRatti,
    String? description,
    String? productCategory,
    String? productSubCategory,
    List<String>? otherImages,
    String? label,
    bool? isFeatured,
    bool? status,
    List<Weight>? weights,
    String? quality,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    String? thumbnailImage,
    String? videoUrl,
  }) =>
      ProductModel(
        id: id ?? this.id,
        productName: productName ?? this.productName,
        subtitle: subtitle ?? this.subtitle,
        pricePerRatti: pricePerRatti ?? this.pricePerRatti,
        discountPricePerRatti: discountPricePerRatti ?? this.discountPricePerRatti,
        description: description ?? this.description,
        productCategory: productCategory ?? this.productCategory,
        productSubCategory: productSubCategory ?? this.productSubCategory,
        otherImages: otherImages ?? this.otherImages,
        label: label ?? this.label,
        isFeatured: isFeatured ?? this.isFeatured,
        status: status ?? this.status,
        weights: weights ?? this.weights,
        quality: quality ?? this.quality,
        isDeleted: isDeleted ?? this.isDeleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        thumbnailImage: thumbnailImage ?? this.thumbnailImage,
        videoUrl: videoUrl ?? this.videoUrl,
      );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["_id"],
    productName: json["product_name"],
    subtitle: json["subtitle"],
    pricePerRatti: json["price_per_ratti"],
    discountPricePerRatti: json["discount_price_per_ratti"],
    description: json["description"],
    productCategory: json["product_category"],
    productSubCategory: json["product_sub_category"],
    otherImages: json["other_images"] == null ? [] : List<String>.from(json["other_images"]!.map((x) => x)),
    label: json["label"],
    isFeatured: json["is_featured"],
    status: json["status"],
    weights: json["weights"] == null ? [] : List<Weight>.from(json["weights"]!.map((x) => Weight.fromJson(x))),
    quality: json["quality"],
    isDeleted: json["is_deleted"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    thumbnailImage: json["thumbnail_image"],
    videoUrl: json["video_url"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "product_name": productName,
    "subtitle": subtitle,
    "price_per_ratti": pricePerRatti,
    "discount_price_per_ratti": discountPricePerRatti,
    "description": description,
    "product_category": productCategory,
    "product_sub_category": productSubCategory,
    "other_images": otherImages == null ? [] : List<dynamic>.from(otherImages!.map((x) => x)),
    "label": label,
    "is_featured": isFeatured,
    "status": status,
    "weights": weights == null ? [] : List<dynamic>.from(weights!.map((x) => x.toJson())),
    "quality": quality,
    "is_deleted": isDeleted,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "thumbnail_image": thumbnailImage,
    "video_url": videoUrl,
  };
}

class Weight {
  final String? value;
  final double? price;
  final String? id;

  Weight({
    this.value,
    this.price,
    this.id,
  });

  Weight copyWith({
    String? value,
    double? price,
    String? id,
  }) =>
      Weight(
        value: value ?? this.value,
        price: price ?? this.price,
        id: id ?? this.id,
      );

  factory Weight.fromJson(Map<String, dynamic> json) => Weight(
    value: json["value"],
    price: json["price"]?.toDouble(),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "price": price,
    "_id": id,
  };
}
