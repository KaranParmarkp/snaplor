class PostShiftModel {
  List<Category>? categories;
  List<CredentialDocument>? credentialDocuments;
  List<DepartmentExperience>? departmentExperiences;
  List<EmrRequirement>? emrRequirements;
  FacilityDetailPostShift facilityDetail;
  FacilityMargin facilityMargin;
  List<Group>? groups;
  List<Keyword>? keywords;
  List<Location>? locations;
  List<ProfessionalTitle>? professionalTitles;
  List<Speciality>? specialities;
  List<SupervisorUserDetail>? supervisorUserDetail;

  PostShiftModel({
    this.categories,
    this.credentialDocuments,
    this.departmentExperiences,
    this.emrRequirements,
    required this.facilityDetail,
    required this.facilityMargin,
    this.groups,
    this.keywords,
    this.locations,
    this.professionalTitles,
    this.specialities,
    this.supervisorUserDetail,
  });

  factory PostShiftModel.fromJson(Map<String, dynamic> json) {
    return PostShiftModel(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      credentialDocuments: (json['credential_documents'] as List<dynamic>)
          .map((e) => CredentialDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
      departmentExperiences: (json['department_experiences'] as List<dynamic>?)
          ?.map((e) => DepartmentExperience.fromJson(e as Map<String, dynamic>))
          .toList(),
      emrRequirements: (json['emr_requirements'] as List<dynamic>?)
          ?.map((e) => EmrRequirement.fromJson(e as Map<String, dynamic>))
          .toList(),
      facilityDetail:
      FacilityDetailPostShift.fromJson(json['facility_detail'] as Map<String, dynamic>),
      facilityMargin:
      FacilityMargin.fromJson(json['facility_margin'] as Map<String, dynamic>),
      groups: (json['groups'] as List<dynamic>?)
          ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
      keywords: (json['keywords'] as List<dynamic>?)
          ?.map((e) => Keyword.fromJson(e as Map<String, dynamic>))
          .toList(),
      locations: (json['locations'] as List<dynamic>?)
          ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
      professionalTitles: (json['professional_titles'] as List<dynamic>?)
          ?.map((e) => ProfessionalTitle.fromJson(e as Map<String, dynamic>))
          .toList(),
      specialities: (json['specialities'] as List<dynamic>?)
          ?.map((e) => Speciality.fromJson(e as Map<String, dynamic>))
          .toList(),
      supervisorUserDetail: (json['supervisor_user_detail'] as List<dynamic>?)
          ?.map((e) => SupervisorUserDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Category {
  int? id;
  String? value;

  Category({this.id, this.value});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      value: json['value'],
    );
  }
}

class CredentialDocument {
  int id;
  String value;
  bool isSelected;

  CredentialDocument({required this.id, required this.value, this.isSelected = false});

  factory CredentialDocument.fromJson(Map<String, dynamic> json) {
    return CredentialDocument(
      id: json['id'] as int,
      value: json['value'],
      isSelected: json['isSelected'] as bool? ?? false,
    );
  }
}

class DepartmentExperience {
  int id;
  String value;

  DepartmentExperience({required this.id, required this.value});

  factory DepartmentExperience.fromJson(Map<String, dynamic> json) {
    return DepartmentExperience(
      id: json['id'] as int,
      value: json['value'],
    );
  }
}

class EmrRequirement {
  int id;
  String value;

  EmrRequirement({required this.id, required this.value});

  factory EmrRequirement.fromJson(Map<String, dynamic> json) {
    return EmrRequirement(
      id: json['id'] as int,
      value: json['value'],
    );
  }
}

class FacilityDetailPostShift {
  String? abotUsOther;
  String? aboutUs;
  String? address;
  String? addressLine2;
  String? assignTo;
  String? cityName;
  String? companyLogo;
  String? companyLogoUrl;
  String? companyPhoto;
  String? companyPhotoUrl;
  String? contactPersonName;
  String? email;
  int? facilityType;
  String? fax;
  int? hospitalUserFk;
  int id;
  String? invoiceType;
  String? lang;
  String? lat;
  String? legalCompanyName;
  String? phone;
  String? rating;
  String? stateName;

  FacilityDetailPostShift({
     this.abotUsOther,
     this.aboutUs,
     this.address,
     this.addressLine2,
     this.assignTo,
     this.cityName,
     this.companyLogo,
     this.companyLogoUrl,
     this.companyPhoto,
     this.companyPhotoUrl,
     this.contactPersonName,
     this.email,
     this.facilityType,
     this.fax,
     this.hospitalUserFk,
     required this.id,
     this.invoiceType,
     this.lang,
     this.lat,
     this.legalCompanyName,
     this.phone,
     this.rating,
     this.stateName,
  });

  factory FacilityDetailPostShift.fromJson(Map<String, dynamic> json) {
    return FacilityDetailPostShift(
      abotUsOther: json['abot_us_other'],
      aboutUs: json['about_us'],
      address: json['address'],
      addressLine2: json['address_line_2'],
      assignTo: json['assign_to'],
      cityName: json['city_name'],
      companyLogo: json['company_logo'],
      companyLogoUrl: json['company_logo_url'],
      companyPhoto: json['company_photo'],
      companyPhotoUrl: json['company_photo_url'],
      contactPersonName: json['contact_person_name'],
      email: json['email'],
      facilityType: json['facility_type'] as int,
      fax: json['fax'],
      hospitalUserFk: json['hospital_user_fk'] as int,
      id: json['id'] as int,
      invoiceType: json['invoice_type'],
      lang: json['lang'],
      lat: json['lat'],
      legalCompanyName: json['legal_company_name'],
      phone: json['phone'],
      rating: json['rating'],
      stateName: json['state_name'],
    );
  }
}

class FacilityMargin {
  int id;
  String type;
  String value;

  FacilityMargin({required this.id, required this.type, required this.value});

  factory FacilityMargin.fromJson(Map<String, dynamic> json) {
    return FacilityMargin(
      id: json['id'] as int,
      type: json['type'],
      value: json['value'],
    );
  }
}

class Group {
  int id;
  String name;

  Group({required this.id, required this.name});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'] as int,
      name: json['name'],
    );
  }
}

class Keyword {
  int id;
  String value;

  Keyword({required this.id, required this.value});

  factory Keyword.fromJson(Map<String, dynamic> json) {
    return Keyword(
      id: json['id'] as int,
      value: json['value'],
    );
  }
}

class Location {
  int id;
  String name;

  Location({required this.id, required this.name});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'] as int,
      name: json['name'],
    );
  }
}

class ProfessionalTitle {
  int id;
  String value;

  ProfessionalTitle({required this.id, required this.value});

  factory ProfessionalTitle.fromJson(Map<String, dynamic> json) {
    return ProfessionalTitle(
      id: json['id'] as int,
      value: json['value'],
    );
  }
}

class Speciality {
  int id;
  int industryId;
  String name;

  Speciality({required this.id, required this.industryId, required this.name});

  factory Speciality.fromJson(Map<String, dynamic> json) {
    return Speciality(
      id: json['id'] as int,
      industryId: json['industry_id'] as int,
      name: json['name'],
    );
  }
}

class SupervisorUserDetail {
  String? accountStatus;
  String? accountStatusAt;
  String? accountStatusBy;
  String? addressLat;
  String? addressLine1;
  String? addressLine2;
  String? addressLong;
  String? cityId;
  String? cityName;
  String? countryId;
  String? countryName;
  String? email;
  String? emailVerifiedAt;
  String? emailVerifiedCode;
  String? firstName;
  String? hospitalDetailId;
  int? hospitalId;
  int? id;
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
  String? profile;
  String? profileUrl;
  String? referralBy;
  String? referralCode;
  String? referralType;
  String? regionId;
  String? regionName;
  String? role;
  String? stateId;
  String? stateName;
  String? suspendReason;

  SupervisorUserDetail({
     this.accountStatus,
     this.accountStatusAt,
     this.accountStatusBy,
     this.addressLat,
    this.addressLine1,
     this.addressLine2,
     this.addressLong,
     this.cityId,
    this.cityName,
     this.countryId,
     this.countryName,
     this.email,
     this.emailVerifiedAt,
     this.emailVerifiedCode,
     this.firstName,
     this.hospitalDetailId,
    this.hospitalId,
     this.id,
     this.ip,
     this.lastLogin,
     this.lastName,
     this.loginOtp,
     this.loginOtpStatus,
     this.middleName,
     this.mobile,
     this.mobileVerified,
     this.netspendAccNo,
     this.netspendAccStatus,
     this.netspendEnrollDatetime,
     this.notificationEmail,
     this.notificationText,
     this.objectId,
     this.paymentGateway,
     this.profile,
    this.profileUrl,
     this.referralBy,
    this.referralCode,
     this.referralType,
     this.regionId,
     this.regionName,
     this.role,
     this.stateId,
    this.stateName,
     this.suspendReason,
  });

  factory SupervisorUserDetail.fromJson(Map<String, dynamic> json) {
    return SupervisorUserDetail(
      accountStatus: json['account_status'],
      accountStatusAt: json['account_status_at'],
      accountStatusBy: json['account_status_by'],
      addressLat: json['address_lat'],
      addressLine1: json['address_line_1'],
      addressLine2: json['address_line_2'],
      addressLong: json['address_long'],
      cityId: json['city_id'],
      cityName: json['city_name'],
      countryId: json['country_id'],
      countryName: json['country_name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      emailVerifiedCode: json['email_verified_code'],
      firstName: json['first_name'],
      hospitalDetailId: json['hospital_detail_id'],
      hospitalId: json['hospital_id'],
      id: json['id'],
      ip: json['ip'],
      lastLogin: json['last_login'],
      lastName: json['last_name'],
      loginOtp: json['login_otp'],
      loginOtpStatus: json['login_otp_status'],
      middleName: json['middle_name'],
      mobile: json['mobile'],
      mobileVerified: json['mobile_verified'],
      netspendAccNo: json['netspend_acc_no'],
      netspendAccStatus: json['netspend_acc_status'],
      netspendEnrollDatetime: json['netspend_enroll_datetime'],
      notificationEmail: json['notification_email'],
      notificationText: json['notification_text'],
      objectId: json['object_id'],
      paymentGateway: json['payment_gateway'],
      profile: json['profile'],
      profileUrl: json['profile_url'],
      referralBy: json['referral_by'],
      referralCode: json['referral_code'],
      referralType: json['referral_type'],
      regionId: json['region_id'],
      regionName: json['region_name'],
      role: json['role'],
      stateId: json['state_id'],
      stateName: json['state_name'],
      suspendReason: json['suspend_reason'],
    );
  }
}
