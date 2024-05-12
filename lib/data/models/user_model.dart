
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String id;
  final String? userName;
  final String? firstName;
  final String? lastName;
  final String? accessToken;
  final String? name;
  final String? email;
  final String? countryCode;
  final String? phone;
  final DateTime? dateOfBirth;
  final String? status;
  final String? role;
  final bool? isVerified;
  final String? gender;
  final List<String>? thumbnailImages;
  final int? experience;
  final List<String> specialization;
  final List<String> skills;
  final List<String> languages;
  final Address? address;
  final String? description;
  final BankInfo? bankInfo;
  final Kyc? kyc;
  final int? adminCommission;
  final bool? isAvailableForChat;
  final bool? isAvailableForCall;
  final int? chatPrice;
  final int? callPrice;
  final bool? isActive;
  final int? totalChatMinutes;
  final int? totalCallMinutes;
  final int? totalChatOrders;
  final int? totalCallOrders;
  final int? todayChatOrders;
  final int? todayCallOrders;
  final int? todayTotalEarnings;
  final dynamic lifeTimeEarnings;
  final dynamic balanceAmount;
  final bool? isDeleted;
  final bool? isFirstLogin;
  final int? adminShare;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? profileImage;
  final String? videoUrl;
  final int? totalFollowers;
  final int? totalFollowing;
  final int? totalPost;
  UserModel({
    required this.id,
    this.accessToken,
    this.userName,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.countryCode,
    this.phone,
    this.dateOfBirth,
    this.status,
    this.role,
    this.isVerified,
    this.gender,
    this.thumbnailImages,
    this.experience,
    required this.specialization,
    required this.skills,
    required this.languages,
    this.address,
    this.description,
    this.bankInfo,
    this.kyc,
    this.adminCommission,
    this.isAvailableForChat,
    this.isAvailableForCall,
    this.chatPrice,
    this.callPrice,
    this.isActive,
    this.totalChatMinutes,
    this.totalCallMinutes,
    this.totalChatOrders,
     this.todayChatOrders,
    this.totalCallOrders,
    this.todayCallOrders,
    this.todayTotalEarnings,
    this.lifeTimeEarnings,
    this.balanceAmount,
    this.isDeleted,
    this.isFirstLogin,
    this.adminShare,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.profileImage,
    this.videoUrl,
    this.totalFollowers,
    this.totalFollowing,
    this.totalPost
  });
  UserModel copyWith({
    String? id,
    String? userName,
    String? accessToken,
    String? name,
    String? firstName,
    String? lastName,
    String? email,
    String? countryCode,
    String? phone,
    DateTime? dateOfBirth,
    String? status,
    String? role,
    bool? isVerified,
    String? gender,
    List<String>? thumbnailImages,
    int? experience,
    List<String>? specialization,
    List<String>? skills,
    List<String>? languages,
    Address? address,
    String? description,
    BankInfo? bankInfo,
    Kyc? kyc,
    int? adminCommission,
    bool? isAvailableForChat,
    bool? isAvailableForCall,
    int? chatPrice,
    int? callPrice,
    bool? isActive,
    int? totalChatMinutes,
    int? totalCallMinutes,
    int? totalChatOrders,
    int? totalCallOrders,
    double? balanceAmount,
    int? todayChatOrders,
    int? todayCallOrders,
    int? todayTotalEarnings,
    double? lifeTimeEarnings,

    bool? isDeleted,
    bool? isFirstLogin,
    int? adminShare,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    String? profileImage,
    String? videoUrl,
    int? totalFollowers,
    int? totalFollowing,
    int? totalPost
  }) =>
      UserModel(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        accessToken: accessToken ?? this.accessToken,
        name: name ?? this.name,
        email: email ?? this.email,
        countryCode: countryCode ?? this.countryCode,
        phone: phone ?? this.phone,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        status: status ?? this.status,
        role: role ?? this.role,
        isVerified: isVerified ?? this.isVerified,
        gender: gender ?? this.gender,
        thumbnailImages: thumbnailImages ?? this.thumbnailImages,
        experience: experience ?? this.experience,
        specialization: specialization ?? this.specialization,
        skills: skills ?? this.skills,
        languages: languages ?? this.languages,
        address: address ?? this.address,
        description: description ?? this.description,
        bankInfo: bankInfo ?? this.bankInfo,
        kyc: kyc ?? this.kyc,
        adminCommission: adminCommission ?? this.adminCommission,
        isAvailableForChat: isAvailableForChat ?? this.isAvailableForChat,
        isAvailableForCall: isAvailableForCall ?? this.isAvailableForCall,
        chatPrice: chatPrice ?? this.chatPrice,
        callPrice: callPrice ?? this.callPrice,
        isActive: isActive ?? this.isActive,
        totalChatMinutes: totalChatMinutes ?? this.totalChatMinutes,
        totalCallMinutes: totalCallMinutes ?? this.totalCallMinutes,
        totalChatOrders: totalChatOrders ?? this.totalChatOrders,
        totalCallOrders: totalCallOrders ?? this.totalCallOrders,
        todayCallOrders: todayCallOrders ?? this.todayCallOrders,
        todayChatOrders: todayChatOrders ?? this.todayChatOrders,
        todayTotalEarnings: todayTotalEarnings ?? this.todayTotalEarnings,
        balanceAmount: balanceAmount ?? this.balanceAmount,
        lifeTimeEarnings: lifeTimeEarnings ?? this.lifeTimeEarnings,
        isDeleted: isDeleted ?? this.isDeleted,
        isFirstLogin: isFirstLogin ?? this.isFirstLogin,
        adminShare: adminShare ?? this.adminShare,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        profileImage: profileImage ?? this.profileImage,
        videoUrl: videoUrl ?? this.videoUrl,
        totalFollowers: totalFollowers ?? this.totalFollowers,
        totalFollowing: totalFollowing ?? this.totalFollowing,
        totalPost: totalPost ?? this.totalPost,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json.containsKey('user_id') ? json["user_id"]["_id"] :json["_id"] ,
    userName: json.containsKey('user_id') ? json["user_id"]["user_name"] :"",
    accessToken: json["token"],
    name: json.containsKey('user_id') ? ((json["user_id"]["first_name"] ?? "") + " "+(json["user_id"]["last_name"] ?? "" )) :json["name"],
    firstName: json.containsKey('user_id') ? json["user_id"]["first_name"] : "",
    lastName: json.containsKey('user_id') ? json["user_id"]["last_name"] :"",
    email: json.containsKey('user_id') ? json["user_id"]["email"] : json["email"],
    countryCode: json.containsKey('user_id') ? json["user_id"]["country_code"] : "",
    phone:json.containsKey('user_id') ? json["user_id"]["phone"] : json["phone"],
    dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
    status: json["status"],
    role: json["role"],
    isVerified: json["is_verified"],
    gender: json["gender"],
    thumbnailImages: json["thumbnail_images"] == null ? [] : List<String>.from(json["thumbnail_images"]!.map((x) => x)),
    experience: json["experience"],
    specialization: json["specialization"] == null ? [] : List<String>.from(json["specialization"]!.map((x) => x)),
    skills: json["skills"] == null ? [] : List<String>.from(json["skills"]!.map((x) => x)),
    languages: json["languages"] == null ? [] : List<String>.from(json["languages"]!.map((x) => x)),
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    description: json["description"],
    bankInfo: json["bank_info"] == null ? null : BankInfo.fromJson(json["bank_info"]),
    kyc: json["kyc"] == null ? null : Kyc.fromJson(json["kyc"]),
    adminCommission: json["admin_commission"],
    isAvailableForChat: json["is_available_for_chat"],
    isAvailableForCall: json["is_available_for_call"],
    chatPrice: json["chat_price"],
    callPrice: json["call_price"],
    isActive: json["is_active"],
    totalChatMinutes: json["total_chat_minutes"] ?? 0,
    totalCallMinutes: json["total_call_minutes"] ?? 0,
    totalChatOrders: json["total_chat_orders"] ?? 0,
    totalCallOrders: json["total_call_orders"] ?? 0,
    todayChatOrders: json["today_chat_order"] ?? 0,
    todayCallOrders: json["today_call_order"] ?? 0,
    lifeTimeEarnings: json["life_time_earning"],
    todayTotalEarnings: json["today_total_earning"]!=null &&  json["today_total_earning"] is int ?json["today_total_earning"]   : 0,
    balanceAmount: json["balance_amount"],
    isDeleted: json["is_deleted"],
    isFirstLogin: json["is_first_login"],
    adminShare: json["admin_share"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    v: json["__v"],
    profileImage: json.containsKey('user_id') ? json["user_id"]["profile_image"] : "",
    videoUrl: json["video_url"],
    totalFollowers: json["total_followers"] ?? 0,
    totalFollowing: json["total_following"] ?? 0,
    totalPost: json["total_posts"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "token" :accessToken,
    "user_name": userName,
    "name": name,
    "email": email,
    "first_name":firstName,
    "last_name":lastName,
    "country_code": countryCode,
    "phone": phone,
    "date_of_birth": dateOfBirth?.toIso8601String(),
    "status": status,
    "role": role,
    "is_verified": isVerified,
    "gender": gender,
    "thumbnail_images": thumbnailImages == null ? [] : List<dynamic>.from(thumbnailImages!.map((x) => x)),
    "experience": experience,
    "specialization":  List<dynamic>.from(specialization.map((x) => x)),
    "skills":List<dynamic>.from(skills.map((x) => x)),
    "languages": List<dynamic>.from(languages.map((x) => x)),
    "address": address?.toJson(),
    "description": description,
    "bank_info": bankInfo?.toJson(),
    "kyc": kyc?.toJson(),
    "admin_commission": adminCommission,
    "is_available_for_chat": isAvailableForChat,
    "is_available_for_call": isAvailableForCall,
    "chat_price": chatPrice,
    "call_price": callPrice,
    "is_active": isActive,
    "total_chat_minutes": totalChatMinutes,
    "total_call_minutes": totalCallMinutes,
    "total_chat_orders": totalChatOrders,
    "total_call_orders": totalCallOrders,
    "balance_amount": balanceAmount,
    "is_deleted": isDeleted,
    "is_first_login": isFirstLogin,
    "admin_share": adminShare,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "__v": v,
    "profile_image": profileImage,
    "video_url": videoUrl,
    "total_posts" : totalPost,
    "total_following":totalFollowing,
    "total_followers":totalFollowers
  };
  Map<String, dynamic> toJsonUpdateProfile() => {
    //"name": name,
    //"experience": experience,
    //"specialization": List<dynamic>.from(specialization.map((x) => x)),
    //"skills":  List<dynamic>.from(skills.map((x) => x)),
    //"languages": List<dynamic>.from(languages.map((x) => x)),
    //"address": address?.toJson(),
    //"description": description,
    //"bank_info": bankInfo?.toJson(),
    //"kyc": kyc?.toJson(),
    "is_available_for_chat": isAvailableForChat,
    "is_available_for_call": isAvailableForCall,
    "chat_price": chatPrice,
    "call_price": callPrice,
    //"is_active": isActive,
    //"profile_image": profileImage,
    //"video_url": videoUrl,
  };
}

class Address {
  final String? locality;
  final String? city;
  final String? state;
  final String? pinCode;

  Address({
    this.locality,
    this.city,
    this.state,
    this.pinCode,
  });
  Address copyWith({
    String? locality,
    String? city,
    String? state,
    String? pinCode,
  })=> Address(
    city: city ?? this.city,
    locality: city ?? this.locality,
    state: city ?? this.state,
    pinCode: city ?? this.pinCode,
  );

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    locality: json["locality"],
    city: json["city"],
    state: json["state"],
    pinCode: json["pin_code"],
  );

  Map<String, dynamic> toJson() => {
    "locality": locality,
    "city": city,
    "state": state,
    "pin_code": pinCode,
  };
}

class BankInfo {
  final String? bankName;
  final String? accountNumber;
  final String? ifscCode;
  final String? bankDocumentImage;
  final String? id;

  BankInfo({
    this.bankName,
    this.accountNumber,
    this.ifscCode,
    this.bankDocumentImage,
    this.id,
  });

  factory BankInfo.fromJson(Map<String, dynamic> json) => BankInfo(
    bankName: json["bank_name"],
    accountNumber: json["account_number"],
    ifscCode: json["ifsc_code"],
    bankDocumentImage: json["bank_document_image"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "bank_name": bankName,
    "account_number": accountNumber,
    "ifsc_code": ifscCode,
    "bank_document_image": bankDocumentImage,
    "_id": id,
  };
}

class Kyc {
  final String? aadhaarNumber;
  final List<AadhaarImage>? aadhaarImages;
  final String? panCardNumber;
  final String? panCardImage;
  final String? id;

  Kyc({
    this.aadhaarNumber,
    this.aadhaarImages,
    this.panCardNumber,
    this.panCardImage,
    this.id,
  });

  factory Kyc.fromJson(Map<String, dynamic> json) => Kyc(
    aadhaarNumber: json["aadhaar_number"],
    aadhaarImages: json["aadhaar_images"] == null ? [] : List<AadhaarImage>.from(json["aadhaar_images"]!.map((x) => AadhaarImage.fromJson(x))),
    panCardNumber: json["pan_card_number"],
    panCardImage: json["pan_card_image"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "aadhaar_number": aadhaarNumber,
    "aadhaar_images": aadhaarImages == null ? [] : List<dynamic>.from(aadhaarImages!.map((x) => x.toJson())),
    "pan_card_number": panCardNumber,
    "pan_card_image": panCardImage,
    "_id": id,
  };
}

class AadhaarImage {
  final String? documentSide;
  final String? documentUrl;
  final String? id;

  AadhaarImage({
    this.documentSide,
    this.documentUrl,
    this.id,
  });

  factory AadhaarImage.fromJson(Map<String, dynamic> json) => AadhaarImage(
    documentSide: json["document_side"],
    documentUrl: json["document_url"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "document_side": documentSide,
    "document_url": documentUrl,
    "_id": id,
  };
}
