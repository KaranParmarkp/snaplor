
class ProviderDetailModel {
  String? accountStatus;
  String? addressLat;
  String? addressLine1;
  String? addressLine2;
  String? addressLong;
  dynamic avgRating;
  String? cityName;
  String? countryId;
  String? countryName;
  String? createdAt;
  String? createdBy;
  String? deleteFlag;
  String? deletedAt;
  String? deletedBy;
  String? email;
  String? emailVerifiedAt;
  String? emailVerifiedCode;
  String firstName;
  String? hospitalDetailId;
  String? hospitalId;
  int id;
  String? ip;
  String? lastLogin;
  String? lastName;
  String? loginOtp;
  String? loginOtpStatus;
  String? middleName;
  String? mobile;
  String? mobileVerified;
  String? netspendAccNo;
  String? netspendAccStatus;
  String? netspendEnrollDatetime;
  String? notificationEmail;
  String? notificationText;
  String? objectId;
  String? paymentGateway;
  String profile;
  String profileUrl;
  int providerBidCounts;
  int providerBidCountsOfCompleted;
  int providerBidCountsOfLateCallOff;
  int providerBidCountsOfNoCallNoShow;
  List<ProviderDepartment>? providerDepartmentObjects;
  ProviderDetail providerDetailObject;
  List<ProviderDocument>? providerDocumentObjects;
  List<ProviderProfessionalLicense>? providerProfessionalLicense;
  String? referralBy;
  String referralCode;
  String? referralType;
  String? regionId;
  String? regionName;
  dynamic role;
  dynamic stateId;
  String? stateName;
  String? suspendReason;
  dynamic totalRating;
  dynamic updatedAt;
  dynamic updatedBy;
  dynamic verifyAt;
  String? verifyOtp;
  dynamic verifyStatus;
  dynamic welcomeFlag;
  dynamic zipcode;

  ProviderDetailModel({
    required this.accountStatus,
    this.addressLat,
    required this.addressLine1,
    required this.addressLine2,
    this.addressLong,
    required this.avgRating,
    required this.cityName,
    this.countryId,
    this.countryName,
    required this.createdAt,
    this.createdBy,
    required this.deleteFlag,
    this.deletedAt,
    this.deletedBy,
    this.email,
    this.emailVerifiedAt,
    this.emailVerifiedCode,
    required this.firstName,
    this.hospitalDetailId,
    this.hospitalId,
    required this.id,
    required this.ip,
    required this.lastLogin,
    required this.lastName,
    this.loginOtp,
    required this.loginOtpStatus,
    this.middleName,
    this.mobile,
    required this.mobileVerified,
    required this.netspendAccNo,
    required this.netspendAccStatus,
    this.netspendEnrollDatetime,
    required this.notificationEmail,
    required this.notificationText,
    this.objectId,
    required this.paymentGateway,
    required this.profile,
    required this.profileUrl,
    required this.providerBidCounts,
    required this.providerBidCountsOfCompleted,
    required this.providerBidCountsOfLateCallOff,
    required this.providerBidCountsOfNoCallNoShow,
    this.providerDepartmentObjects,
    required this.providerDetailObject,
    this.providerDocumentObjects,
    this.providerProfessionalLicense,
    this.referralBy,
    required this.referralCode,
    this.referralType,
    this.regionId,
    this.regionName,
    required this.role,
    required this.stateId,
    this.stateName,
    this.suspendReason,
    required this.totalRating,
    required this.updatedAt,
    required this.updatedBy,
    required this.verifyAt,
    this.verifyOtp,
    required this.verifyStatus,
    required this.welcomeFlag,
    required this.zipcode,
  });

  factory ProviderDetailModel.fromJson(Map<String, dynamic> json) {
    return ProviderDetailModel(
      accountStatus: json['account_status'] ,
      addressLat: json['address_lat'] ,
      addressLine1: json['address_line_1'] ,
      addressLine2: json['address_line_2'] ,
      addressLong: json['address_long'] ,
      avgRating: json['avg_rating'] ,
      cityName: json['city_name'] ,
      countryId: json['country_id'] ,
      countryName: json['country_name'] ,
      createdAt: json['created_at'] ,
      createdBy: json['created_by'] ,
      deleteFlag: json['delete_flag'] ,
      deletedAt: json['deleted_at'] ,
      deletedBy: json['deleted_by'] ,
      email: json['email'] ,
      emailVerifiedAt: json['email_verified_at'] ,
      emailVerifiedCode: json['email_verified_code'] ,
      firstName: json['first_name'] ,
      hospitalDetailId: json['hospital_detail_id'] ,
      hospitalId: json['hospital_id'] ,
      id: json['id'] ,
      ip: json['ip'] ,
      lastLogin: json['last_login'] ,
      lastName: json['last_name'] ,
      loginOtp: json['login_otp'] ,
      loginOtpStatus: json['login_otp_status'] ,
      middleName: json['middle_name'] ,
      mobile: json['mobile'] ,
      mobileVerified: json['mobile_verified'] ,
      netspendAccNo: json['netspend_acc_no'] ,
      netspendAccStatus: json['netspend_acc_status'] ,
      netspendEnrollDatetime: json['netspend_enroll_datetime'] ,
      notificationEmail: json['notification_email'] ,
      notificationText: json['notification_text'] ,
      objectId: json['object_id'] ,
      paymentGateway: json['payment_gateway'] ,
      profile: json['profile'] ,
      profileUrl: json['profile_url'] ,
      providerBidCounts: json['provider_bid_counts'] ?? 0 ,
      providerBidCountsOfCompleted: json['provider_bid_counts_of_completed'] ?? 0,
      providerBidCountsOfLateCallOff: json['provider_bid_counts_of_late_call_off'] ?? 0 ,
      providerBidCountsOfNoCallNoShow: json['provider_bid_counts_of_no_call_no_show'] ?? 0,
      providerDepartmentObjects: (json['provider_department_objects'] as List<dynamic>?)
          ?.map((e) => ProviderDepartment.fromJson(e as Map<String, dynamic>))
          .toList(),
      providerDetailObject: ProviderDetail.fromJson(json['provider_detail_object'] as Map<String, dynamic>),
      providerDocumentObjects: (json['provider_document_objects'] as List<dynamic>?)
          ?.map((e) => ProviderDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
      providerProfessionalLicense: (json['provider_professional_license_objects'] as List<dynamic>?)
          ?.map((e) => ProviderProfessionalLicense.fromJson(e as Map<String, dynamic>))
          .toList(),
      referralBy: json['referral_by'] ,
      referralCode: json['referral_code'] ,
      referralType: json['referral_type'] ,
      regionId: json['region_id'] ,
      regionName: json['region_name'] ,
      role: json['role'] ,
      stateId: json['state_id'] ,
      stateName: json['state_name'] ,
      suspendReason: json['suspend_reason'] ,
      totalRating: json['total_rating'] ,
      updatedAt: json['updated_at'] ,
      updatedBy: json['updated_by'] ,
      verifyAt: json['verify_at'] ,
      verifyOtp: json['verify_otp'] ,
      verifyStatus: json['verify_status'] ,
      welcomeFlag: json['welcome_flag'] ,
      zipcode: json['zipcode'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'account_status': accountStatus,
      'address_lat': addressLat,
      'address_line_1': addressLine1,
      'address_line_2': addressLine2,
      'address_long': addressLong,
      'avg_rating': avgRating,
      'city_name': cityName,
      'country_id': countryId,
      'country_name': countryName,
      'created_at': createdAt,
      'created_by': createdBy,
      'delete_flag': deleteFlag,
      'deleted_at': deletedAt,
      'deleted_by': deletedBy,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'email_verified_code': emailVerifiedCode,
      'first_name': firstName,
      'hospital_detail_id': hospitalDetailId,
      'hospital_id': hospitalId,
      'id': id,
      'ip': ip,
      'last_login': lastLogin,
      'last_name': lastName,
      'login_otp': loginOtp,
      'login_otp_status': loginOtpStatus,
      'middle_name': middleName,
      'mobile': mobile,
      'mobile_verified': mobileVerified,
      'netspend_acc_no': netspendAccNo,
      'netspend_acc_status': netspendAccStatus,
      'netspend_enroll_datetime': netspendEnrollDatetime,
      'notification_email': notificationEmail,
      'notification_text': notificationText,
      'object_id': objectId,
      'payment_gateway': paymentGateway,
      'profile': profile,
      'profile_url': profileUrl,
      'provider_bid_counts': providerBidCounts,
      'provider_bid_counts_of_completed': providerBidCountsOfCompleted,
      'provider_bid_counts_of_late_call_off': providerBidCountsOfLateCallOff,
      'provider_bid_counts_of_no_call_no_show': providerBidCountsOfNoCallNoShow,
      'provider_department_objects': providerDepartmentObjects?.map((e) => e.toJson()).toList(),
      //'provider_detail_object': providerDetailObject.toJson(),
      //'provider_document_objects': providerDocumentObjects?.map((e) => e.toJson()).toList(),
      //'provider_professional_license_objects': providerProfessionalLicenseObjects?.map((e) => e.toJson()).toList(),
      'referral_by': referralBy,
      'referral_code': referralCode,
      'referral_type': referralType,
      'region_id': regionId,
      'region_name': regionName,
      'role': role,
      'state_id': stateId,
      'state_name': stateName,
      'suspend_reason': suspendReason,
      'total_rating': totalRating,
      'updated_at': updatedAt,
      'updated_by': updatedBy,
      'verify_at': verifyAt,
      'verify_otp': verifyOtp,
      'verify_status': verifyStatus,
      'welcome_flag': welcomeFlag,
      'zipcode': zipcode,
    };
  }
}
class ProviderDepartment {
  String createdAt;
  int createdBy;
  String deleteFlag;
  String? deletedAt;
  String? deletedBy;
  String? departmentId;
  String? departmentMonth;
  String? departmentYear;
  int id;
  int nurseId;
  int professionalId;
  String professionalName;
  String updatedAt;
  String? updatedBy;

  ProviderDepartment({
    required this.createdAt,
    required this.createdBy,
    required this.deleteFlag,
    this.deletedAt,
    this.deletedBy,
    this.departmentId,
    this.departmentMonth,
    this.departmentYear,
    required this.id,
    required this.nurseId,
    required this.professionalId,
    required this.professionalName,
    required this.updatedAt,
    this.updatedBy,
  });

  factory ProviderDepartment.fromJson(Map<String, dynamic> json) {
    return ProviderDepartment(
      createdAt: json['created_at'] ,
      createdBy: json['created_by'] ,
      deleteFlag: json['delete_flag'] ,
      deletedAt: json['deleted_at'] ,
      deletedBy: json['deleted_by'] ,
      departmentId: json['department_id'] ,
      departmentMonth: json['department_month'] ,
      departmentYear: json['department_year'] ,
      id: json['id'] ,
      nurseId: json['nurse_id'] ,
      professionalId: json['professional_id'] ,
      professionalName: json['professional_name'] ,
      updatedAt: json['updated_at'] ,
      updatedBy: json['updated_by'] ,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['created_at'] = createdAt;
    data['created_by'] = createdBy;
    data['delete_flag'] = deleteFlag;
    data['deleted_at'] = deletedAt;
    data['deleted_by'] = deletedBy;
    data['department_id'] = departmentId;
    data['department_month'] = departmentMonth ?? "0";
    data['department_year'] = departmentYear ?? "0";
    data['id'] = id;
    data['nurse_id'] = nurseId;
    data['professional_id'] = professionalId;
    data['professional_name'] = professionalName;
    data['updated_at'] = updatedAt;
    data['updated_by'] = updatedBy;
    return data;
  }
}
class ProviderDetail {
  dynamic accountHolderName;
  dynamic accountNumber;
  dynamic accountType;
  dynamic? adverseActionLetter;
  dynamic backgroundStatus;
  dynamic capsFormUrl;
  dynamic createdAt;
  dynamic? createdBy;
  dynamic deleteFlag;
  dynamic? deletedAt;
  dynamic? deletedBy;
  dynamic? departmentExperience;
  dynamic dob;
  dynamic driverLicenseBackCopy;
  dynamic driverLicenseBackCopyUrl;
  dynamic driverLicenseCopy;
  dynamic driverLicenseCopyUrl;
  dynamic? extraCerificate;
  dynamic? governmentIssuedId;
  int? id;
  int? industryFk;
  dynamic licenseExpiryDate;
  dynamic licenseStanding;
  dynamic? licenseStateId;
  dynamic licenseStateName;
  dynamic onBoardingStatus;
  dynamic onboardStatusAt;
  dynamic otherLicenseType;
  dynamic professionalLicenseCopy;
  dynamic professionalLicenseCopyUrl;
  dynamic professionalLicenseNumber;
  dynamic professionalLicenseSpeciality;
  dynamic professionalLicenseTypeId;
  dynamic? professionalTitleFk;
  dynamic reliabilityStatus;
  dynamic resumeCopy;
  dynamic resumeCopyUrl;
  dynamic routingNumber;
  int? servicesFk;
  dynamic signtureCopy;
  dynamic signtureCopyUrl;
  dynamic specialityName;
  dynamic ssnConsentDate;
  dynamic ssnConsentFormUrl;
  dynamic ssnConsentSignature;
  dynamic ssnNumber;
  dynamic? suspendDays;
  dynamic suspendEdate;
  dynamic suspendSdate;
  dynamic suspendType;
  dynamic taxpayerCopy;
  dynamic taxpayerCopyUrl;
  dynamic updatedAt;
  dynamic updatedBy;
  dynamic userFk;

  ProviderDetail({
     this.accountHolderName,
     this.accountNumber,
     this.accountType,
    this.adverseActionLetter,
     this.backgroundStatus,
     this.capsFormUrl,
     this.createdAt,
    this.createdBy,
     this.deleteFlag,
    this.deletedAt,
    this.deletedBy,
    this.departmentExperience,
     this.dob,
     this.driverLicenseBackCopy,
     this.driverLicenseBackCopyUrl,
     this.driverLicenseCopy,
     this.driverLicenseCopyUrl,
    this.extraCerificate,
    this.governmentIssuedId,
     this.id,
     this.industryFk,
     this.licenseExpiryDate,
     this.licenseStanding,
    this.licenseStateId,
     this.licenseStateName,
     this.onBoardingStatus,
     this.onboardStatusAt,
     this.otherLicenseType,
     this.professionalLicenseCopy,
     this.professionalLicenseCopyUrl,
     this.professionalLicenseNumber,
     this.professionalLicenseSpeciality,
     this.professionalLicenseTypeId,
    this.professionalTitleFk,
     this.reliabilityStatus,
     this.resumeCopy,
     this.resumeCopyUrl,
     this.routingNumber,
     this.servicesFk,
     this.signtureCopy,
     this.signtureCopyUrl,
     this.specialityName,
     this.ssnConsentDate,
     this.ssnConsentFormUrl,
     this.ssnConsentSignature,
     this.ssnNumber,
    this.suspendDays,
     this.suspendEdate,
     this.suspendSdate,
     this.suspendType,
     this.taxpayerCopy,
     this.taxpayerCopyUrl,
     this.updatedAt,
     this.updatedBy,
     this.userFk,
  });

  factory ProviderDetail.fromJson(Map<String, dynamic> json) {
    return ProviderDetail(
      accountHolderName: json['account_holder_name'] ?? "",
      accountNumber: json['account_number'] ?? "" ,
      accountType: json['account_type'] ,
      adverseActionLetter: json['adverse_action_letter'] ,
      backgroundStatus: json['background_status'] ,
      capsFormUrl: json['caps_form_url'] ,
      createdAt: json['created_at'] ,
      createdBy: json['created_by'] ,
      deleteFlag: json['delete_flag'] ,
      deletedAt: json['deleted_at'] ,
      deletedBy: json['deleted_by'] ,
      departmentExperience: json['department_experience'] ,
      dob: json['dob'] ,
      driverLicenseBackCopy: json['driver_license_back_copy'] ?? "" ,
      driverLicenseBackCopyUrl: json['driver_license_back_copy_url']??"" ,
      driverLicenseCopy: json['driver_license_copy'] ?? "",
      driverLicenseCopyUrl: json['driver_license_copy_url'] ?? "",
      extraCerificate: json['extra_cerificate'] ?? "",
      governmentIssuedId: json['government_issued_id'] ?? "",
      id: json['id'] ,
      industryFk: json['industry_fk'] ,
      licenseExpiryDate: json['license_expiry_date'] ?? "" ,
      licenseStanding: json['license_standing'] ,
      licenseStateId: json['license_state_id'] ,
      licenseStateName: json['license_state_name'] ?? "" ,
      onBoardingStatus: json['on_boarding_status'] ,
      onboardStatusAt: json['onboard_status_at'] ,
      otherLicenseType: json['other_license_type'] ?? "" ,
      professionalLicenseCopy: json['professional_license_copy'] ?? "" ,
      professionalLicenseCopyUrl: json['professional_license_copy_url'] ?? "" ,
      professionalLicenseNumber: json['professional_license_number'] ?? "" ,
      professionalLicenseSpeciality: json['professional_license_speciality'] ?? "" ,
      professionalLicenseTypeId: json['professional_license_type_id'] ?? "" ,
      professionalTitleFk: json['professional_title_fk'] ?? "" ,
      reliabilityStatus: json['reliability_status'] ?? "" ,
      resumeCopy: json['resume_copy'] ?? "" ,
      resumeCopyUrl: json['resume_copy_url'] ?? "" ,
      routingNumber: json['routing_number'] ?? "" ,
      servicesFk: json['services_fk'] ?? "" ,
      signtureCopy: json['signture_copy'] ?? "" ,
      signtureCopyUrl: json['signture_copy_url'] ?? "" ,
      specialityName: json['speciality_name'] ?? "" ,
      ssnConsentDate: json['ssn_consent_date'] ?? "" ,
      ssnConsentFormUrl: json['ssn_consent_form_url'] ?? "" ,
      ssnConsentSignature: json['ssn_consent_signature'] ?? "" ,
      ssnNumber: json['ssn_number'] ?? "" ,
      suspendDays: json['suspend_days'] ?? "" ,
      suspendEdate: json['suspend_edate'] ?? "" ,
      suspendSdate: json['suspend_sdate'] ?? "" ,
      suspendType: json['suspend_type'] ?? "" ,
      taxpayerCopy: json['taxpayer_copy'] ?? "" ,
      taxpayerCopyUrl: json['taxpayer_copy_url'] ?? "" ,
      updatedAt: json['updated_at'] ?? "" ,
      updatedBy: json['updated_by'] ?? "" ,
      userFk: json['user_fk'] ?? "" ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'account_holder_name': accountHolderName,
      'account_number': accountNumber,
      'account_type': accountType,
      'adverse_action_letter': adverseActionLetter,
      'background_status': backgroundStatus,
      'caps_form_url': capsFormUrl,
      'created_at': createdAt,
      'created_by': createdBy,
      'delete_flag': deleteFlag,
      'deleted_at': deletedAt,
      'deleted_by': deletedBy,
      'department_experience': departmentExperience,
      'dob': dob,
      'driver_license_back_copy': driverLicenseBackCopy,
      'driver_license_back_copy_url': driverLicenseBackCopyUrl,
      'driver_license_copy': driverLicenseCopy,
      'driver_license_copy_url': driverLicenseCopyUrl,
      'extra_cerificate': extraCerificate,
      'government_issued_id': governmentIssuedId,
      'id': id,
      'industry_fk': industryFk,
      'license_expiry_date': licenseExpiryDate,
      'license_standing': licenseStanding,
      'license_state_id': licenseStateId,
      'license_state_name': licenseStateName,
      'on_boarding_status': onBoardingStatus,
      'onboard_status_at': onboardStatusAt,
      'other_license_type': otherLicenseType,
      'professional_license_copy': professionalLicenseCopy,
      'professional_license_copy_url': professionalLicenseCopyUrl,
      'professional_license_number': professionalLicenseNumber,
      'professional_license_speciality': professionalLicenseSpeciality,
      'professional_license_type_id': professionalLicenseTypeId,
      'professional_title_fk': professionalTitleFk,
      'reliability_status': reliabilityStatus,
      'resume_copy': resumeCopy,
      'resume_copy_url': resumeCopyUrl,
      'routing_number': routingNumber,
      'services_fk': servicesFk,
      'signture_copy': signtureCopy,
      'signture_copy_url': signtureCopyUrl,
      'speciality_name': specialityName,
      'ssn_consent_date': ssnConsentDate,
      'ssn_consent_form_url': ssnConsentFormUrl,
      'ssn_consent_signature': ssnConsentSignature,
      'ssn_number': ssnNumber,
      'suspend_days': suspendDays,
      'suspend_edate': suspendEdate,
      'suspend_sdate': suspendSdate,
      'suspend_type': suspendType,
      'taxpayer_copy': taxpayerCopy,
      'taxpayer_copy_url': taxpayerCopyUrl,
      'updated_at': updatedAt,
      'updated_by': updatedBy,
      'user_fk': userFk,
    };
  }
}
class ProviderDocument {
  int? approveDenyBy;
  String? createdAt;
  dynamic? createdBy;
  String? deletedAt;
  String? deletedBy;
  String? description;
  int documentId;
  int documentTypeId;
  String documentTypeName;
  String? expireDate;
  int id;
  String? issueBy;
  String? issueDate;
  String name;
  int providerUserId;
  String? reason;
  String status;
  String? updatedAt;
  String? updatedBy;
  String url;

  ProviderDocument({
    this.approveDenyBy,
     this.createdAt,
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

  factory ProviderDocument.fromJson(Map<String, dynamic> json) {
    return ProviderDocument(
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
class ProviderProfessionalLicense {
  String attachment;
  String attachmentUrl;
  String? country;
  String createdAt;
  int createdBy;
  String? deletedAt;
  String? deletedBy;
  String deletedFlag;
  String expireDate;
  int id;
  String licenseBy;
  String licenseDate;
  String licenseStanding;
  int licenseTypeId;
  String licenseTypeName;
  String? note;
  String number;
  int stateId;
  String updatedAt;
  dynamic updatedBy;
  int userId;

  ProviderProfessionalLicense({
    required this.attachment,
    required this.attachmentUrl,
    this.country,
    required this.createdAt,
    required this.createdBy,
    this.deletedAt,
    this.deletedBy,
    required this.deletedFlag,
    required this.expireDate,
    required this.id,
    required this.licenseBy,
    required this.licenseDate,
    required this.licenseStanding,
    required this.licenseTypeId,
    required this.licenseTypeName,
    this.note,
    required this.number,
    required this.stateId,
    required this.updatedAt,
    this.updatedBy,
    required this.userId,
  });

  factory ProviderProfessionalLicense.fromJson(Map<String, dynamic> json) {
    return ProviderProfessionalLicense(
      attachment: json['attachment'],
      attachmentUrl: json['attachment_url'],
      country: json['country'],
      createdAt: json['created_at'],
      createdBy: json['created_by'],
      deletedAt: json['deleted_at'],
      deletedBy: json['deleted_by'],
      deletedFlag: json['deleted_flag'],
      expireDate: json['expire_date'],
      id: json['id'],
      licenseBy: json['license_by'],
      licenseDate: json['license_date'],
      licenseStanding: json['license_standing'],
      licenseTypeId: json['license_type_id'],
      licenseTypeName: json['license_type_name'],
      note: json['note'],
      number: json['number'],
      stateId: json['state_id'],
      updatedAt: json['updated_at'],
      updatedBy: json['updated_by'],
      userId: json['user_id'],
    );
  }
}
class ResumeModel {
  String? id;
  String? speciality;
  String? years;
  String? month;
  String? resumeUrl;
  String? resume;

  ResumeModel({this.id,this.month,this.resume,this.resumeUrl,this.speciality,this.years});
}