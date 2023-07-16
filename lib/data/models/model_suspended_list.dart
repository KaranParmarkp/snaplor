class ModelSuspendedList {
  final int? id;
  final ProviderObject? providerObj;
  final String? suspendType;
  final int? userId;

  ModelSuspendedList({
    this.id,
    this.providerObj,
    this.suspendType,
    this.userId,
  });

  factory ModelSuspendedList.fromJson(Map<String, dynamic> json) {
    return ModelSuspendedList(
      id: json['id'] as int?,
      providerObj: ProviderObject.fromJson(json['provider_object']),
      suspendType: json['suspend_type'] as String?,
      userId: json['user_id'] as int?,
    );
  }
}

class ProviderObject {
  final int? id;
  final String? accountStatus;
  final double? ratting;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final String? mobile;
  final String? profile;
  final String? profileUrl;
  final double? totalRating;
  final ProviderDetailObjectSuspend? providerDetailObject;

  ProviderObject({
    this.id,
    this.accountStatus,
    this.ratting,
    this.email,
    this.firstName,
    this.lastName,
    this.middleName,
    this.mobile,
    this.profile,
    this.profileUrl,
    this.totalRating,
    this.providerDetailObject,
  });

  factory ProviderObject.fromJson(Map<String, dynamic> json) {
    return ProviderObject(
      id: json['id'] as int?,
      accountStatus: json['account_status'] as String?,
      ratting: json['avg_rating'] !=null ? double.parse(json['avg_rating'].toString()) : 0.0 ,
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      middleName: json['middle_name'] ?? "",
      mobile: json['mobile'] as String?,
      profile: json['profile'] as String?,
      profileUrl: json['profile_url'] as String?,
      totalRating: json['total_rating'] !=null ? double.parse(json['total_rating'].toString()) : 0.0,
      providerDetailObject:
      ProviderDetailObjectSuspend.fromJson(json['provider_detail_object']),
    );
  }
}

class ProviderDetailObjectSuspend {
  final String? shiftType;

  ProviderDetailObjectSuspend({
    this.shiftType,
  });

  factory ProviderDetailObjectSuspend.fromJson(Map<String, dynamic> json) {
    return ProviderDetailObjectSuspend(
      shiftType: json['speciality_name'] as String?,
    );
  }
}
