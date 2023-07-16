class ModelShiftCalenderList {
  int? acceptedCount;
  int? id;
  String? shiftKeyword;
  String? title;
  String? scheduleType;
  int? categoryFk;
  int? hospitalUserFk;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  String? timezoneStartTime;
  String? timezoneEndTime;
  String? timezone;
  String? facility;
  dynamic speciality;
  String? facilityTemplate;
  String? description;
  String? professionalNumber;
  String? bonus;
  String? originalBonus;
  String? bonusValue;
  String? status;
  dynamic hourlyRate;
  String? nurseRate;
  dynamic originalMaximumBillAmount;
  dynamic maximumBillAmount;
  dynamic oriiginalEstimatedPrice;
  dynamic estimatedPrice;
  dynamic comissionType;
  dynamic comissionValue;
  dynamic jobConfirmation;
  dynamic setFavorite;
  dynamic groupId;
  dynamic locationId;
  int? parentJobId;
  String? recurring;
  String? recurringType;
  String? recurringEndDate;
  String? supervisorPrimary;
  String? supervisorSecondary;
  String? unpaidBreak;
  String? unpaidBreakTime;
  String? availableNotificationStatus;
  String? showingShiftTo;
  String? callOffMsg;
  String? specialityName;
  int? filled;
  int? pendingBidsCount;
  LocationObj? locationObj;
  List<BidProviderObjects>? providerList;
  List<BidObject>? bidObjects;
  List<NoteObject> noteObjects;
  List<RequiredDepartmentObject> requiredDepartmentObjects;
  List<RequiredDocumentObjects>? requiredDocumentObjects;
  List<RequiredProfessionalLicenseObjects>? requiredProfessionalLicenseObjects;
  TemplateObj? templateObj;

  ModelShiftCalenderList({
    required this.acceptedCount,
    this.id,
    this.shiftKeyword,
    this.title,
    this.scheduleType,
    this.categoryFk = 0,
    this.hospitalUserFk = 0,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.timezoneStartTime,
    this.timezoneEndTime,
    this.timezone,
    this.facility,
    this.speciality,
    this.facilityTemplate,
    this.description,
    this.professionalNumber,
    this.bonus,
    this.originalBonus,
    this.bonusValue,
    this.status,
    this.hourlyRate = 0,
    this.nurseRate,
    this.originalMaximumBillAmount,
    this.maximumBillAmount = '',
    this.oriiginalEstimatedPrice = '',
    this.estimatedPrice = '',
    this.comissionType = '',
    this.comissionValue = '',
    this.jobConfirmation = '',
    this.setFavorite = '',
    this.groupId = '',
    this.locationId = '',
    this.parentJobId,
    this.recurring = '',
    this.recurringType = '',
    this.recurringEndDate = '',
    this.supervisorPrimary = '',
    this.supervisorSecondary = '',
    this.unpaidBreak = '',
    this.unpaidBreakTime = '',
    this.availableNotificationStatus,
    this.showingShiftTo,
    this.callOffMsg,
    this.specialityName,
    this.filled = 0,
    this.pendingBidsCount = 0,
    this.locationObj,
    this.providerList = const [],
    this.bidObjects = const [],
    this.noteObjects = const [],
    this.requiredDepartmentObjects = const [],
    this.requiredDocumentObjects,
    this.requiredProfessionalLicenseObjects = const [],
    required this.templateObj,
  });

  ModelShiftCalenderList.fromJson(Map<String, dynamic> json)
      : acceptedCount = json['accepted_count'],
        id = json['id'],
        shiftKeyword = json['shift_keyword'],
        title = json['title'],
        scheduleType = json['schedule_type'],
        categoryFk = json['category_fk'],
        hospitalUserFk = json['hospital_user_fk'],
        startDate = json['start_date'],
        endDate = json['end_date'],
        startTime = json['start_time'],
        endTime = json['end_time'],
        timezoneStartTime = json['timezone_start_time'],
        timezoneEndTime = json['timezone_end_time'],
        timezone = json['timezone'],
        facility = json['facility'],
        speciality = json['speciality'],
        facilityTemplate = json['facility_template'],
        description = json['description'],
        professionalNumber = json['professional_number'],
        bonus = json['bonus'],
        originalBonus = json['original_bonus'],
        bonusValue = json['bonus_value'],
        status = json['status'],
        hourlyRate = json['hourly_rate'],
        nurseRate = json['nurse_rate'],
        originalMaximumBillAmount = json['original_maximum_bill_amount'],
        maximumBillAmount = json['maximum_bill_amount'],
        oriiginalEstimatedPrice = json['oriiginal_estimated_price'],
        estimatedPrice = json['estimated_price'],
        comissionType = json['comission_type'],
        comissionValue = json['comission_value'],
        jobConfirmation = json['job_confirmation'],
        setFavorite = json['set_favorite'],
        groupId = json['group_id'],
        locationId = json['location_id'],
        parentJobId = json['parent_job_id'],
        recurring = json['recurring'],
        recurringType = json['recurring_type'],
        recurringEndDate = json['recurring_end_date'],
        supervisorPrimary = json['supervisor_primary'],
        supervisorSecondary = json['supervisor_secondary'],
        unpaidBreak = json['unpaid_break'],
        unpaidBreakTime = json['unpaid_break_time'],
        availableNotificationStatus = json['available_notification_status'],
        showingShiftTo = json['showing_shift_to'],
        callOffMsg = json['call_off_msg'],
        specialityName = json['speciality_name'],
        filled = json['filled'],
        pendingBidsCount = json['pending_count'],
        locationObj = json['location_obj'] != null
            ? LocationObj.fromJson(json['location_obj'])
            : null,
        providerList = json['bid_provider_objects'] != null
            ? (json['bid_provider_objects'] as List)
                .map((e) => BidProviderObjects.fromJson(e))
                .toList()
            : [],
        bidObjects = json['bid_objects'] != null
            ? (json['bid_objects'] as List)
                .map((e) => BidObject.fromJson(e))
                .toList()
            : [],
        noteObjects = json['note_objects'] != null
            ? (json['note_objects'] as List)
                .map((e) => NoteObject.fromJson(e))
                .toList()
            : [],
        requiredDepartmentObjects = json['required_department_objects'] != null
            ? (json['required_department_objects'] as List)
                .map((e) => RequiredDepartmentObject.fromJson(e))
                .toList()
            : [],
        requiredDocumentObjects = json['required_document_objects'] != null
            ? (json['required_document_objects'] as List)
                .map((e) => RequiredDocumentObjects.fromJson(e))
                .toList()
            : null,
        requiredProfessionalLicenseObjects =
            json['required_professional_license_objects'] != null
                ? (json['required_professional_license_objects'] as List)
                    .map((e) => RequiredProfessionalLicenseObjects.fromJson(e))
                    .toList()
                : [],
        templateObj = json['template_obj'] != null
            ? TemplateObj.fromJson(json['template_obj'])
            : null;
}

class LocationObj {
  int? id;
  int? hospitalUserId;
  String? name;
  String? nickname;
  int? facilityType;
  String? address;
  String? zipcode;
  String? address2;
  String? cityName;
  String? stateName;
  String? streetName;
  String? description;
  String? phone;
  String? email;
  String? contactPersonName;
  String? additionalInstruction;
  String? image;
  String? imageUrl;
  String? lat;
  String? long;
  int? accountId;
  String? timezone;

  LocationObj({
    this.id,
    this.hospitalUserId,
    this.name,
    this.nickname,
    this.facilityType,
    this.address,
    this.zipcode,
    this.address2,
    this.cityName,
    this.stateName,
    this.streetName,
    this.description,
    this.phone,
    this.email,
    this.contactPersonName,
    this.additionalInstruction,
    this.image,
    this.imageUrl,
    this.lat,
    this.long,
    this.accountId,
    this.timezone,
  });

  factory LocationObj.fromJson(Map<String, dynamic> json) {
    return LocationObj(
      id: json['id'],
      hospitalUserId: json['hospital_user_id'],
      name: json['name'],
      nickname: json['nickname'],
      facilityType: json['facility_type'],
      address: json['address'],
      zipcode: json['zipcode'],
      address2: json['address2'],
      cityName: json['city_name'],
      stateName: json['state_name'],
      streetName: json['street_name'],
      description: json['description'],
      phone: json['phone'],
      email: json['email'],
      contactPersonName: json['contact_person_name'],
      additionalInstruction: json['additional_instruction'],
      image: json['image'],
      imageUrl: json['image_url'],
      lat: json['lat'],
      long: json['long'],
      accountId: json['account_id'],
      timezone: json['timezone'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['hospital_user_id'] = this.hospitalUserId;
    data['name'] = this.name;
    data['nickname'] = this.nickname;
    data['facility_type'] = this.facilityType;
    data['address'] = this.address;
    data['zipcode'] = this.zipcode;
    data['address2'] = this.address2;
    data['city_name'] = this.cityName;
    data['state_name'] = this.stateName;
    data['street_name'] = this.streetName;
    data['description'] = this.description;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['contact_person_name'] = this.contactPersonName;
    data['additional_instruction'] = this.additionalInstruction;
    data['image'] = this.image;
    data['image_url'] = this.imageUrl;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['account_id'] = this.accountId;
    data['timezone'] = this.timezone;
    return data;
  }
}

class NoteObject {
  int id;
  int jobId;
  String note;

  NoteObject({
    required this.id,
    required this.jobId,
    required this.note,
  });

  factory NoteObject.fromJson(Map<String, dynamic> json) {
    return NoteObject(
      id: json['id'],
      jobId: json['job_id'],
      note: json['note'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['job_id'] = this.jobId;
    data['note'] = this.note;
    return data;
  }
}

class BidProviderObjects {
  dynamic accountStatus;
  String? accountStatusAt;
  dynamic accountStatusBy;
  dynamic addressLat;
  dynamic addressLine1;
  String? addressLine2;
  dynamic addressLong;
  dynamic avgRating;
  String? cityId;
  dynamic cityName;
  String? countryId;
  String? countryName;
  dynamic dob;
  dynamic email;
  String? emailVerifiedAt;
  String? emailVerifiedCode;
  dynamic firstName;
  String? hospitalDetailId;
  String? hospitalId;
  int id;
  dynamic ip;
  dynamic lastLogin;
  dynamic lastName;
  String? loginOtp;
  dynamic loginOtpStatus;
  String? middleName;
  dynamic mobile;
  dynamic mobileVerified;
  String? netspendAccNo;
  String? netspendAccStatus;
  String? netspendEnrollDatetime;
  dynamic notificationEmail;
  dynamic notificationText;
  String? objectId;
  dynamic paymentGateway;
  dynamic profile;
  dynamic profileUrl;
  String? referralBy;
  dynamic referralType;
  String? regionId;
  String? regionName;
  dynamic role;
  dynamic servicesFk;
  dynamic specialityName;
  dynamic ssnNumber;
  dynamic stateId;
  String? stateName;
  String? suspendReason;
  dynamic totalRating;

  BidProviderObjects({
    required this.accountStatus,
    this.accountStatusAt,
    this.accountStatusBy,
    required this.addressLat,
    required this.addressLine1,
    this.addressLine2,
    required this.addressLong,
    required this.avgRating,
    this.cityId,
    required this.cityName,
    this.countryId,
    this.countryName,
    required this.dob,
    required this.email,
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
    required this.mobile,
    required this.mobileVerified,
    this.netspendAccNo,
    this.netspendAccStatus,
    this.netspendEnrollDatetime,
    required this.notificationEmail,
    required this.notificationText,
    this.objectId,
    required this.paymentGateway,
    required this.profile,
    required this.profileUrl,
    this.referralBy,
    required this.referralType,
    this.regionId,
    this.regionName,
    required this.role,
    required this.servicesFk,
    required this.specialityName,
    required this.ssnNumber,
    required this.stateId,
    this.stateName,
    this.suspendReason,
    required this.totalRating,
  });

  factory BidProviderObjects.fromJson(Map<String, dynamic> json) {
    return BidProviderObjects(
      accountStatus: json['account_status'],
      accountStatusAt: json['account_status_at'],
      accountStatusBy: json['account_status_by'],
      addressLat: json['address_lat'],
      addressLine1: json['address_line_1'],
      addressLine2: json['address_line_2'],
      addressLong: json['address_long'],
      avgRating: json['avg_rating'],
      cityId: json['city_id'],
      cityName: json['city_name'],
      countryId: json['country_id'],
      countryName: json['country_name'],
      dob: json['dob'],
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
      referralType: json['referral_type'],
      regionId: json['region_id'],
      regionName: json['region_name'],
      role: json['role'],
      servicesFk: json['services_fk'],
      specialityName: json['speciality_name'],
      ssnNumber: json['ssn_number'],
      stateId: json['state_id'],
      stateName: json['state_name'],
      suspendReason: json['suspend_reason'],
      totalRating: json['total_rating'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['account_status'] = this.accountStatus;
    data['account_status_at'] = this.accountStatusAt;
    data['account_status_by'] = this.accountStatusBy;
    data['address_lat'] = this.addressLat;
    data['address_line_1'] = this.addressLine1;
    data['address_line_2'] = this.addressLine2;
    data['address_long'] = this.addressLong;
    data['avg_rating'] = this.avgRating;
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['country_id'] = this.countryId;
    data['country_name'] = this.countryName;
    data['dob'] = this.dob;
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
    data['middle_name'] = this.middleName;
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
    data['profile_url'] = this.profileUrl;
    data['referral_by'] = this.referralBy;
    data['referral_type'] = this.referralType;
    data['region_id'] = this.regionId;
    data['region_name'] = this.regionName;
    data['role'] = this.role;
    data['services_fk'] = this.servicesFk;
    data['speciality_name'] = this.specialityName;
    data['ssn_number'] = this.ssnNumber;
    data['state_id'] = this.stateId;
    data['state_name'] = this.stateName;
    data['suspend_reason'] = this.suspendReason;
    data['total_rating'] = this.totalRating;
    return data;
  }
}

class BidObject {
  dynamic apiVersion;
  dynamic bilRate;
  dynamic clockIn;
  dynamic clockInLat;
  dynamic clockInLong;
  dynamic clockOut;
  dynamic clockOutLat;
  dynamic clockOutLong;
  dynamic confirmationStatus;
  int id;
  int jobFk;
  String? lateCallOff;
  String? manualBidAttachment;
  String? manualBidAttachmentUrl;
  String? manualBidReason;
  int nurseUserFk;
  dynamic price;
  String? reason;
  dynamic status;
  dynamic statusDatetime;
  dynamic timesheetApproveBy;
  dynamic timesheetRejectBy;
  dynamic timesheetStatus;
  dynamic trackStatus;

  BidObject({
    this.apiVersion,
    required this.bilRate,
    this.clockIn,
    this.clockInLat,
    this.clockInLong,
    this.clockOut,
    this.clockOutLat,
    this.clockOutLong,
    required this.confirmationStatus,
    required this.id,
    required this.jobFk,
    this.lateCallOff,
    this.manualBidAttachment,
    this.manualBidAttachmentUrl,
    this.manualBidReason,
    required this.nurseUserFk,
    required this.price,
    this.reason,
    required this.status,
    required this.statusDatetime,
    this.timesheetApproveBy,
    this.timesheetRejectBy,
    this.timesheetStatus,
    required this.trackStatus,
  });

  factory BidObject.fromJson(Map<String, dynamic> json) {
    return BidObject(
      apiVersion: json['api_version'],
      bilRate: json['bil_rate'],
      clockIn: json['clock_in'],
      clockInLat: json['clock_in_lat'],
      clockInLong: json['clock_in_long'],
      clockOut: json['clock_out'],
      clockOutLat: json['clock_out_lat'],
      clockOutLong: json['clock_out_long'],
      confirmationStatus: json['confirmation_status'],
      id: json['id'],
      jobFk: json['job_fk'],
      lateCallOff: json['late_call_off'],
      manualBidAttachment: json['manual_bid_attachment'],
      manualBidAttachmentUrl: json['manual_bid_attachment_url'],
      manualBidReason: json['manual_bid_reason'],
      nurseUserFk: json['nurse_user_fk'],
      price: json['price'],
      reason: json['reason'],
      status: json['status'],
      statusDatetime: json['status_datetime'],
      timesheetApproveBy: json['timesheet_approve_by'],
      timesheetRejectBy: json['timesheet_reject_by'],
      timesheetStatus: json['timesheet_status'],
      trackStatus: json['track_status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['api_version'] = apiVersion;
    data['bil_rate'] = bilRate;
    data['clock_in'] = clockIn;
    data['clock_in_lat'] = clockInLat;
    data['clock_in_long'] = clockInLong;
    data['clock_out'] = clockOut;
    data['clock_out_lat'] = clockOutLat;
    data['clock_out_long'] = clockOutLong;
    data['confirmation_status'] = confirmationStatus;
    data['id'] = id;
    data['job_fk'] = jobFk;
    data['late_call_off'] = lateCallOff;
    data['manual_bid_attachment'] = manualBidAttachment;
    data['manual_bid_attachment_url'] = manualBidAttachmentUrl;
    data['manual_bid_reason'] = manualBidReason;
    data['nurse_user_fk'] = nurseUserFk;
    data['price'] = price;
    data['reason'] = reason;
    data['status'] = status;
    data['status_datetime'] = statusDatetime;
    data['timesheet_approve_by'] = timesheetApproveBy;
    data['timesheet_reject_by'] = timesheetRejectBy;
    data['timesheet_status'] = timesheetStatus;
    data['track_status'] = trackStatus;
    return data;
  }
}

class RequiredDepartmentObject {
  int? departmentId;
  dynamic departmentMonth;
  dynamic departmentYear;
  int id;
  int jobId;
  dynamic matching;
  int professionalId;
  dynamic professionalName;

  RequiredDepartmentObject({
    this.departmentId,
    required this.departmentMonth,
    required this.departmentYear,
    required this.id,
    required this.jobId,
    required this.matching,
    required this.professionalId,
    required this.professionalName,
  });

  factory RequiredDepartmentObject.fromJson(Map<String, dynamic> json) {
    return RequiredDepartmentObject(
      departmentId: json['department_id'],
      departmentMonth: json['department_month'],
      departmentYear: json['department_year'],
      id: json['id'],
      jobId: json['job_id'],
      matching: json['matching'],
      professionalId: json['professional_id'],
      professionalName: json['professional_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['department_id'] = departmentId;
    data['department_month'] = departmentMonth;
    data['department_year'] = departmentYear;
    data['id'] = id;
    data['job_id'] = jobId;
    data['matching'] = matching;
    data['professional_id'] = professionalId;
    data['professional_name'] = professionalName;
    return data;
  }
}

class RequiredDocumentObjects {
  int id;
  String value;

  RequiredDocumentObjects({
    required this.id,
    required this.value,
  });

  factory RequiredDocumentObjects.fromJson(Map<String, dynamic> json) {
    return RequiredDocumentObjects(
      id: json['id'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['value'] = value;
    return data;
  }
}

class RequiredProfessionalLicenseObjects {
  int id;
  String name;

  RequiredProfessionalLicenseObjects({
    required this.id,
    required this.name,
  });

  factory RequiredProfessionalLicenseObjects.fromJson(
      Map<String, dynamic> json) {
    return RequiredProfessionalLicenseObjects(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class TemplateObj {
  dynamic description;
  dynamic hospitalId;
  dynamic id;
  dynamic jobId;
  dynamic speciality;
  dynamic type;

  TemplateObj({
     this.description,
     this.hospitalId,
     this.id,
     this.jobId,
     this.speciality,
     this.type,
  });

  factory TemplateObj.fromJson(Map<String, dynamic> json) {
    return TemplateObj(
      description: json['description'],
      hospitalId: json['hospital_id'],
      id: json['id'],
      jobId: json['job_id'],
      speciality: json['speciality'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['description'] = description;
    data['hospital_id'] = hospitalId;
    data['id'] = id;
    data['job_id'] = jobId;
    data['speciality'] = speciality;
    data['type'] = type;
    return data;
  }
}
