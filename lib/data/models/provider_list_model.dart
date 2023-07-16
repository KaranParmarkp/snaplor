import 'package:jyotishee/app/utils/utils.dart';

class ProviderListModel {
  String accountStatus;
  bool isChecked;
  String? accountStatusAt;
  dynamic accountStatusBy;
  String? addressLat;
  String? addressLine1;
  String? addressLine2;
  String? addressLong;
  double? rating;
  String? cityId;
  String? cityName;
  String? countryId;
  String? countryName;
  String? createdAt;
  int? createdBy;
  String? deleteFlag;
  String? deletedAt;
  String? deletedBy;
  String email;
  String? emailVerifiedAt;
  String? emailVerifiedCode;
  String firstName;
  String? hospitalDetailId;
  dynamic hospitalId;
  int id;
  String? ip;
  String? lastLogin;
  String lastName;
  String? loginOtp;
  String? loginOtpStatus;
  String middleName;
  String mobile;
  String? mobileVerified;
  String? netspendAccNo;
  String? netspendAccStatus;
  String? netspendEnrollDatetime;
  String? notificationEmail;
  String? notificationText;
  String? objectId;
  String? paymentGateway;
  String? profile;
  String profileImage;
  int price;
  int providerBidCounts;
  int providerBidCountsOfCompleted;
  int providerBidCountsOfLateCallOff;
  int providerBidCountsOfNoCallNoShow;
  List<ProviderDepartmentObject>? providerDepartmentObjects;
  ProviderDetailObject? providerDetailObject;
  List<ProviderDocumentObject>? providerDocumentObjects;
  List<ProviderProfessionalLicenseObject>? providerProfessionalLicenseObjects;
  String? referralBy;
  String? referralCode;
  String? referralType;
  String? regionId;
  String? regionName;
  int? role;
  int? stateId;
  String? stateName;
  String? suspendReason;
  double totalRating;
  String? zipcode;
  bool isShowMessage;
  bool isShowDelete;

  ProviderListModel(
      {required this.accountStatus,
      this.isChecked = false,
      this.accountStatusAt,
      this.accountStatusBy,
      this.addressLat,
      this.addressLine1,
      this.addressLine2,
      this.addressLong,
      this.rating = 0.0,
      this.cityId,
      this.cityName,
      this.countryId,
      this.countryName,
       this.createdAt,
      this.createdBy,
       this.deleteFlag,
      this.deletedAt,
      this.deletedBy,
      required this.email,
      this.emailVerifiedAt,
      this.emailVerifiedCode,
      required this.firstName,
      this.hospitalDetailId,
      this.hospitalId,
      required this.id,
      this.ip,
      this.lastLogin,
      required this.lastName,
      this.loginOtp,
       this.loginOtpStatus,
      required this.middleName,
      required this.mobile,
      required this.mobileVerified,
      this.netspendAccNo,
      this.netspendAccStatus,
      this.netspendEnrollDatetime,
      this.notificationEmail,
      this.notificationText,
      this.objectId,
      required this.paymentGateway,
      this.profile,
      required this.profileImage,
      required this.price,
      required this.providerBidCounts,
      required this.providerBidCountsOfCompleted,
      required this.providerBidCountsOfLateCallOff,
      required this.providerBidCountsOfNoCallNoShow,
      this.providerDepartmentObjects,
      required this.providerDetailObject,
      this.providerDocumentObjects,
      this.providerProfessionalLicenseObjects,
      this.referralBy,
       this.referralCode,
      this.referralType,
      this.regionId,
      this.regionName,
      this.role,
      this.stateId,
      this.stateName,
      this.suspendReason,
      this.totalRating = 0.0,
      this.zipcode,
      this.isShowMessage = false,
      this.isShowDelete = false});

  factory ProviderListModel.fromJson(Map<String, dynamic> json) {
    return ProviderListModel(
      accountStatus: "se",//json['account_status'] ?? "",
      isChecked: json['isChecked'] ?? false,
      accountStatusAt: json['account_status_at'] ?? "",
      accountStatusBy: json['account_status_by'] ?? "",
      addressLat: json['address_lat'],
      addressLine1: json['address_line_1'],
      addressLine2: json['address_line_2'],
      addressLong: json['address_long'],
      rating: json['avg_rating'] != null
          ? double.parse(json['avg_rating'].toString())
          : 0.0,
      cityId: json['city_id'],
      cityName: json['city_name'],
      countryId: json['country_id'],
      countryName: json['country_name'],
      createdAt: json['created_at'],
      createdBy: json['created_by'],
      deleteFlag: json['delete_flag'],
      deletedAt: json['deleted_at'],
      deletedBy: json['deleted_by'],
      email: json['email'] ?? "",
      emailVerifiedAt: json['email_verified_at'],
      emailVerifiedCode: json['email_verified_code'],
      firstName: json['first_name'] ?? "",
      hospitalDetailId: json['hospital_detail_id'],
      hospitalId: json['hospital_id'],
      id: json['id'],
      ip: json['ip'],
      lastLogin: json['last_login'],
      lastName: json['last_name'] ?? "",
      loginOtp: json['login_otp'],
      loginOtpStatus: json['login_otp_status'],
      middleName: json['middle_name'] ?? "",
      mobile: json['mobile'] ?? "",
      mobileVerified: json['mobile_verified'],
      netspendAccNo: json['netspend_acc_no'],
      netspendAccStatus: json['netspend_acc_status'],
      netspendEnrollDatetime: json['netspend_enroll_datetime'],
      notificationEmail: json['notification_email'],
      notificationText: json['notification_text'],
      objectId: json['object_id'],
      paymentGateway: json['payment_gateway'],
      profile: json['profile'] ?? "",
      profileImage: json['profile_url'] ?? "",
      price: json['price'] ?? 0,
      providerBidCounts: json['provider_bid_counts'] ?? 0,
      providerBidCountsOfCompleted:
          json['provider_bid_counts_of_completed'] ?? 0,
      providerBidCountsOfLateCallOff:
          json['provider_bid_counts_of_late_call_off'] ?? 0,
      providerBidCountsOfNoCallNoShow:
          json['provider_bid_counts_of_no_call_no_show'] ?? 0,
      providerDepartmentObjects:
          (json['provider_department_objects'] as List<dynamic>?)
              ?.map((e) => ProviderDepartmentObject.fromJson(e))
              .toList(),
      providerDetailObject: json['provider_detail_object']!=null ? ProviderDetailObject.fromJson(json['provider_detail_object']) : null,
      providerDocumentObjects:
          (json['provider_document_objects'] as List<dynamic>?)
              ?.map((e) => ProviderDocumentObject.fromJson(e))
              .toList(),
      providerProfessionalLicenseObjects:
          (json['provider_professional_license_objects'] as List<dynamic>?)
              ?.map((e) => ProviderProfessionalLicenseObject.fromJson(e))
              .toList(),
      referralBy: json['referral_by'],
      referralCode: json['referral_code'],
      referralType: json['referral_type'],
      regionId: json['region_id'],
      regionName: json['region_name'],
      role: json['role'],
      stateId: json['state_id'],
      stateName: json['state_name'],
      suspendReason: json['suspend_reason'],
      totalRating: json['total_rating'] != null
          ? double.parse(json['total_rating'].toString())
          : 0.0,
      zipcode: json['zipcode'],
      isShowMessage: json['isShowMessage'] ?? false,
      isShowDelete: json['isShowDelete'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_status'] = this.accountStatus;
    data['isChecked'] = this.isChecked;
    data['account_status_at'] = this.accountStatusAt;
    data['account_status_by'] = this.accountStatusBy;
    data['address_lat'] = this.addressLat;
    data['address_line_1'] = this.addressLine1;
    data['address_line_2'] = this.addressLine2;
    data['address_long'] = this.addressLong;
    data['avg_rating'] = this.rating;
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['country_id'] = this.countryId;
    data['country_name'] = this.countryName;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['delete_flag'] = this.deleteFlag;
    data['deleted_at'] = this.deletedAt;
    data['deleted_by'] = this.deletedBy;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['email_verified_code'] = this.emailVerifiedCode;
    data['first_name'] = this.firstName;
    data['hospital_detail_id'] = this.hospitalDetailId;
    data['hospital_id'] = this.hospitalId;
    data['id'] = this.id;
    data['ip'] = this.ip;
    data['last_login'] = this.lastLogin;
    data['last_name'] = this.lastName;
    data['login_otp'] = this.loginOtp;
    data['login_otp_status'] = this.loginOtpStatus;
    data['middle_name'] = this.middleName ;
    data['mobile'] = this.mobile;
    data['mobile_verified'] = this.mobileVerified;
    data['netspend_acc_no'] = this.netspendAccNo;
    data['netspend_acc_status'] = this.netspendAccStatus;
    data['netspend_enroll_datetime'] = this.netspendEnrollDatetime;
    data['notification_email'] = this.notificationEmail;
    data['notification_text'] = this.notificationText;
    data['object_id'] = this.objectId;
    data['payment_gateway'] = this.paymentGateway;
    data['profile'] = this.profile;
    data['profile_url'] = this.profileImage;
    data['price'] = this.price;
    data['provider_bid_counts'] = this.providerBidCounts ?? 0;
    data['provider_bid_counts_of_completed'] =
        this.providerBidCountsOfCompleted;
    data['provider_bid_counts_of_late_call_off'] =
        this.providerBidCountsOfLateCallOff;
    data['provider_bid_counts_of_no_call_no_show'] =
        this.providerBidCountsOfNoCallNoShow;
    data['provider_department_objects'] =
        this.providerDepartmentObjects?.map((e) => e.toJson()).toList();
    //data['provider_detail_object'] = this.providerDetailObject.toJson();
    data['provider_document_objects'] =
        this.providerDocumentObjects?.map((e) => e.toJson()).toList();
    data['provider_professional_license_objects'] = this
        .providerProfessionalLicenseObjects
        ?.map((e) => e.toJson())
        .toList();
    data['referral_by'] = this.referralBy;
    data['referral_code'] = this.referralCode;
    data['referral_type'] = this.referralType;
    data['region_id'] = this.regionId;
    data['region_name'] = this.regionName;
    data['role'] = this.role;
    data['state_id'] = this.stateId;
    data['state_name'] = this.stateName;
    data['suspend_reason'] = this.suspendReason;
    data['total_rating'] = this.totalRating;
    data['zipcode'] = this.zipcode;
    data['isShowMessage'] = this.isShowMessage;
    data['isShowDelete'] = this.isShowDelete;
    return data;
  }

  String fullName() => firstName + " " + middleName + " " + lastName;
}

class ProviderDepartmentObject {
  String? departmentId;
  String? departmentName;
  String? parentId;

  ProviderDepartmentObject(
      {this.departmentId, this.departmentName, this.parentId});

  factory ProviderDepartmentObject.fromJson(Map<String, dynamic> json) {
    return ProviderDepartmentObject(
      departmentId: json['department_id'],
      departmentName: json['department_name'],
      parentId: json['parent_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department_id'] = this.departmentId;
    data['department_name'] = this.departmentName;
    data['parent_id'] = this.parentId;
    return data;
  }
}

/*class ProviderDetailObject {
  String? medicalDegree;
  String? medicalSchool;
  String? medicalTraining;

  ProviderDetailObject({this.medicalDegree, this.medicalSchool, this.medicalTraining});

  factory ProviderDetailObject.fromJson(Map<String, dynamic> json) {
    return ProviderDetailObject(
      medicalDegree: json['medical_degree'],
      medicalSchool: json['medical_school'],
      medicalTraining: json['medical_training'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medical_degree'] = this.medicalDegree;
    data['medical_school'] = this.medicalSchool;
    data['medical_training'] = this.medicalTraining;
    return data;
  }
}*/
class ProviderDetailObject {
  String? accountHolderName;
  String? accountNumber;
  String? accountType;
  String? adverseActionLetter;
  String? backgroundStatus;
  String? capsFormUrl;
  String? departmentExperience;
  String? dob;
  String? driverLicenseBackCopy;
  String? driverLicenseBackCopyUrl;
  String? driverLicenseCopy;
  String? driverLicenseCopyUrl;
  String? extraCerificate;
  String? governmentIssuedId;
  int? id;
  int? industryFk;
  String? licenseExpiryDate;
  String? licenseStanding;
  String? licenseStateId;
  String? licenseStateName;
  String? onBoardingStatus;
  String? onboardStatusAt;
  String? otherLicenseType;
  String? professionalLicenseCopy;
  String? professionalLicenseCopyUrl;
  String? professionalLicenseNumber;
  int? professionalLicenseSpeciality;
  int? professionalLicenseTypeId;
  String? professionalTitleFk;
  String? reliabilityStatus;
  String? resumeCopy;
  String? resumeCopyUrl;
  String? routingNumber;
  int? servicesFk;
  String? signtureCopy;
  String? signtureCopyUrl;
  String? shiftType;
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

  ProviderDetailObject({
    this.accountHolderName,
    this.accountNumber,
     this.accountType,
    this.adverseActionLetter,
    this.backgroundStatus,
     this.capsFormUrl,
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
    this.shiftType,
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

  factory ProviderDetailObject.fromJson(Map<String, dynamic> json) {
    return ProviderDetailObject(
      accountHolderName: json['account_holder_name'],
      accountNumber: json['account_number'],
      accountType: json['account_type'],
      adverseActionLetter: json['adverse_action_letter'],
      backgroundStatus: json['background_status'],
      capsFormUrl: json['caps_form_url'],
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
      shiftType: json['speciality_name'],
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

class ProviderDocumentObject {
  String? documentType;
  String? documentUrl;

  ProviderDocumentObject({this.documentType, this.documentUrl});

  factory ProviderDocumentObject.fromJson(Map<String, dynamic> json) {
    return ProviderDocumentObject(
      documentType: json['document_type'],
      documentUrl: json['document_url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['document_type'] = this.documentType;
    data['document_url'] = this.documentUrl;
    return data;
  }
}

class ProviderProfessionalLicenseObject {
  String? licenseNumber;
  String? licenseState;

  ProviderProfessionalLicenseObject({this.licenseNumber, this.licenseState});

  factory ProviderProfessionalLicenseObject.fromJson(
      Map<String, dynamic> json) {
    return ProviderProfessionalLicenseObject(
      licenseNumber: json['license_number'],
      licenseState: json['license_state'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['license_number'] = this.licenseNumber;
    data['license_state'] = this.licenseState;
    return data;
  }
}
