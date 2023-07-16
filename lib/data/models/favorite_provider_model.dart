class FavoriteProviderModel {
  int groupId;
  int id;
  ProviderObj providerObj;

  FavoriteProviderModel({
    required this.groupId,
    required this.id,
    required this.providerObj,
  });

  factory FavoriteProviderModel.fromJson(Map<String, dynamic> json) {
    return FavoriteProviderModel(
      groupId: json['group_id'],
      id: json['id'],
      providerObj: ProviderObj.fromJson(json['provider_obj']),
    );
  }
}

class ProviderObj {
  String accountStatus;
  String? addressLat;
  String addressLine1;
  String? addressLong;
  double avgRating;
  String email;
  String firstName;
  int id;
  String lastName;
  String middleName;
  String mobile;
  String? objectId;
  String paymentGateway;
  String? profile;
  String profileUrl;
  ProviderDetailObjectFavorite providerDetailObject;
  List<ProviderDocumentObjectFavorite>? providerDocumentObjects;
  dynamic totalRating;

  ProviderObj({
    required this.accountStatus,
    this.addressLat,
    required this.addressLine1,
    this.addressLong,
    required this.avgRating,
    required this.email,
    required this.firstName,
    required this.id,
    required this.lastName,
    required this.middleName,
    required this.mobile,
    this.objectId,
    required this.paymentGateway,
    this.profile,
    required this.profileUrl,
    required this.providerDetailObject,
    this.providerDocumentObjects,
    required this.totalRating,
  });

  factory ProviderObj.fromJson(Map<String, dynamic> json) {
    return ProviderObj(
      accountStatus: json['account_status'],
      addressLat: json['address_lat'],
      addressLine1: json['address_line_1'],
      addressLong: json['address_long'],
      avgRating: json['avg_rating'],
      email: json['email'],
      firstName: json['first_name'],
      id: json['id'],
      lastName: json['last_name'],
      middleName: json['middle_name'] ?? "",
      mobile: json['mobile'],
      objectId: json['object_id'],
      paymentGateway: json['payment_gateway'],
      profile: json['profile'],
      profileUrl: json['profile_url'],
      providerDetailObject: ProviderDetailObjectFavorite.fromJson(json['provider_detail_object']),
      providerDocumentObjects: json['provider_document_objects'] != null
          ? (json['provider_document_objects'] as List<dynamic>)
          .map((item) => ProviderDocumentObjectFavorite.fromJson(item))
          .toList()
          : null,
      totalRating: json['total_rating'],
    );
  }
}

class ProviderDetailObjectFavorite {
  String? accountHolderName;
  String? accountNumber;
  String? accountType;
  String? adverseActionLetter;
  String? backgroundStatus;
  String? capsFormUrl;
  String? createdAt;
  int? createdBy;
  String? deleteFlag;
  String? deletedAt;
  String? deletedBy;
  String? departmentExperience;
  String? dob;
  String? driverLicenseBackCopy;
  String? driverLicenseBackCopyUrl;
  String? driverLicenseCopy;
  String? driverLicenseCopyUrl;
  String? extraCerificate;
  String? governmentIssuedId;
  int id;
  int? industryFk;
  String? licenseExpiryDate;
  String licenseStanding;
  String? licenseStateId;
  String? licenseStateName;
  String? onBoardingStatus;
  String? onboardStatusAt;
  String? otherLicenseType;
  String? professionalLicenseCopy;
  String? professionalLicenseCopyUrl;
  String? professionalLicenseNumber;
  int? professionalLicenseSpeciality;
  dynamic professionalLicenseTypeId;
  String? professionalTitleFk;
  String? reliabilityStatus;
  String? resumeCopy;
  String? resumeCopyUrl;
  String? routingNumber;
  int? servicesFk;
  String? signtureCopy;
  String? signtureCopyUrl;
  String? specialityName;
  String? ssnConsentDate;
  String? ssnConsentFormUrl;
  String? ssnConsentSignature;
  String? ssnNumber;
  String? suspendDays;
  String? suspendEdate;
  String? suspendSdate;
  String? suspendType;
  String? taxpayerCopy;
  String? taxpayerCopyUrl;
  String? updatedAt;
  int? updatedBy;
  int? userFk;

  ProviderDetailObjectFavorite({
    this.accountHolderName,
    this.accountNumber,
    this.accountType,
    this.adverseActionLetter,
    this.backgroundStatus,
    required this.capsFormUrl,
    required this.createdAt,
    this.createdBy,
    required this.deleteFlag,
    this.deletedAt,
    this.deletedBy,
    this.departmentExperience,
    required this.dob,
    this.driverLicenseBackCopy,
    this.driverLicenseBackCopyUrl,
    this.driverLicenseCopy,
    this.driverLicenseCopyUrl,
    this.extraCerificate,
    this.governmentIssuedId,
    required this.id,
    required this.industryFk,
    this.licenseExpiryDate,
    required this.licenseStanding,
    this.licenseStateId,
    this.licenseStateName,
    required this.onBoardingStatus,
    this.onboardStatusAt,
    this.otherLicenseType,
    this.professionalLicenseCopy,
    this.professionalLicenseCopyUrl,
    this.professionalLicenseNumber,
    this.professionalLicenseSpeciality,
    this.professionalLicenseTypeId,
    this.professionalTitleFk,
    required this.reliabilityStatus,
    required this.resumeCopy,
    required this.resumeCopyUrl,
    required this.routingNumber,
    required this.servicesFk,
    required this.signtureCopy,
    required this.signtureCopyUrl,
    this.specialityName,
    this.ssnConsentDate,
    this.ssnConsentFormUrl,
    this.ssnConsentSignature,
    required this.ssnNumber,
    this.suspendDays,
    this.suspendEdate,
    this.suspendSdate,
    this.suspendType,
    required this.taxpayerCopy,
    required this.taxpayerCopyUrl,
    required this.updatedAt,
    required this.updatedBy,
    required this.userFk,
  });

  factory ProviderDetailObjectFavorite.fromJson(Map<String, dynamic> json) {
    return ProviderDetailObjectFavorite(
      accountHolderName: json['account_holder_name'],
      accountNumber: json['account_number'],
      accountType: json['account_type'],
      adverseActionLetter: json['adverse_action_letter'],
      backgroundStatus: json['background_status'],
      capsFormUrl: json['caps_form_url'],
      createdAt: json['created_at'],
      createdBy: json['created_by'],
      deleteFlag: json['delete_flag'],
      deletedAt: json['deleted_at'],
      deletedBy: json['deleted_by'],
      departmentExperience: json['department_experience'],
      dob: json['dob'],
      driverLicenseBackCopy: json['driver_license_back_copy'],
      driverLicenseBackCopyUrl: json['driver_license_back_copy_url'],
      driverLicenseCopy: json['driver_license_copy'],
      driverLicenseCopyUrl: json['driver_license_copy_url'],
      extraCerificate: json['extra_cerificate'],
      governmentIssuedId: json['government_issued_id'],
      id: json['id'],
      industryFk: json['industry_fk'],
      licenseExpiryDate: json['license_expiry_date'],
      licenseStanding: json['license_standing'],
      licenseStateId: json['license_state_id'],
      licenseStateName: json['license_state_name'],
      onBoardingStatus: json['on_boarding_status'],
      onboardStatusAt: json['onboard_status_at'],
      otherLicenseType: json['other_license_type'],
      professionalLicenseCopy: json['professional_license_copy'],
      professionalLicenseCopyUrl: json['professional_license_copy_url'],
      professionalLicenseNumber: json['professional_license_number'],
      professionalLicenseSpeciality: json['professional_license_speciality'],
      professionalLicenseTypeId: json['professional_license_type_id'],
      professionalTitleFk: json['professional_title_fk'],
      reliabilityStatus: json['reliability_status'],
      resumeCopy: json['resume_copy'],
      resumeCopyUrl: json['resume_copy_url'],
      routingNumber: json['routing_number'],
      servicesFk: json['services_fk'],
      signtureCopy: json['signture_copy'],
      signtureCopyUrl: json['signture_copy_url'],
      specialityName: json['speciality_name'],
      ssnConsentDate: json['ssn_consent_date'],
      ssnConsentFormUrl: json['ssn_consent_form_url'],
      ssnConsentSignature: json['ssn_consent_signature'],
      ssnNumber: json['ssn_number'],
      suspendDays: json['suspend_days'],
      suspendEdate: json['suspend_edate'],
      suspendSdate: json['suspend_sdate'],
      suspendType: json['suspend_type'],
      taxpayerCopy: json['taxpayer_copy'],
      taxpayerCopyUrl: json['taxpayer_copy_url'],
      updatedAt: json['updated_at'],
      updatedBy: json['updated_by'],
      userFk: json['user_fk'],
    );
  }
}

class ProviderDocumentObjectFavorite {
  dynamic approveDenyBy;
  String? createdAt;
  int? createdBy;
  String? deletedAt;
  String? deletedBy;
  String? description;
  int? documentId;
  int? documentTypeId;
  String? documentTypeName;
  String? expireDate;
  int? id;
  String? issueBy;
  String? issueDate;
  String? name;
  int? providerUserId;
  String? reason;
  String? status;
  String? updatedAt;
  String? updatedBy;
  String? url;

  ProviderDocumentObjectFavorite({
    this.approveDenyBy,
    required this.createdAt,
    required this.createdBy,
    this.deletedAt,
    this.deletedBy,
    this.description,
    required this.documentId,
    required this.documentTypeId,
    required this.documentTypeName,
    this.expireDate,
    required this.id,
    this.issueBy,
    this.issueDate,
    required this.name,
    required this.providerUserId,
    this.reason,
    required this.status,
    required this.updatedAt,
    this.updatedBy,
    required this.url,
  });

  factory ProviderDocumentObjectFavorite.fromJson(Map<String, dynamic> json) {
    return ProviderDocumentObjectFavorite(
      approveDenyBy: json['approve_deny_by'],
      createdAt: json['created_at'],
      createdBy: json['created_by'],
      deletedAt: json['deleted_at'],
      deletedBy: json['deleted_by'],
      description: json['description'],
      documentId: json['document_id'],
      documentTypeId: json['document_type_id'],
      documentTypeName: json['document_type_name'],
      expireDate: json['expire_date'],
      id: json['id'],
      issueBy: json['issue_by'],
      issueDate: json['issue_date'],
      name: json['name'],
      providerUserId: json['provider_user_id'],
      reason: json['reason'],
      status: json['status'],
      updatedAt: json['updated_at'],
      updatedBy: json['updated_by'],
      url: json['url'],
    );
  }
}
