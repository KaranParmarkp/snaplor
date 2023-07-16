import 'model_shift_calender_list.dart';
import 'package:jyotishee/app/utils/utils.dart';
class ShiftTemplatePreviewModel {
  int acceptedCount;
  bool isSelected;
  String availableNotificationStatus;
  List<BidAcceptedProviderObjects>? bidAcceptedProviderObjects;
  List<BidAcceptedProviderObjects>? bidCalledoffProviderObjects;
  int bidCount;
  List<BidNcnsProviderObject>? bidNcnsProviderObjects;
  List<BidObjectTemplate>? bidObjects;
  List<BidProviderObject>? bidProviderObjects;
  List<BidAcceptedProviderObjects>? bidRejectedProviderObjects;
  String bonus;
  String bonusValue;
  String callOffMsg;
  int calledoffCount;
  int categoryFk;
  String comissionType;
  String comissionValue;
  String? description;
  String endDate;
  String endTime;
  dynamic estimatedPrice;
  String? facility;
  String? facilityTemplate;
  dynamic groupId;
  int? hospitalUserFk;
  dynamic hourlyRate;
  int id;
  String jobConfirmation;
  int locationId;
  LocationObj? locationObj;
  List<NoteObject>? noteObjects;
  dynamic maximumBillAmount;
  int ncnsCount;
  String? needCount;
  String? nurseRate;
  String? originalBonus;
  dynamic originalMaximumBillAmount;
  dynamic oriiginalEstimatedPrice;
  dynamic parentJobId;
  int? pendingCount;
  String? professionalNumber;
  String? recurring;
  String? recurringEndDate;
  String? recurringType;
  int? rejectedCount;
  List<RequiredDepartmentObject>? requiredDepartmentObjects;
  List<RequiredDocumentObjects>? requiredDocumentObjects;
  //List<RequiredEmrObjects>? requiredEmrObjects;
  List<RequiredProfessionalLicenseObjects>? requiredProfessionalLicenseObjects;
  String? scheduleType;
  String? setFavorite;
  String? shiftKeyword;
  String? showingShiftTo;
  int? speciality;
  String? specialityName;
  String startDate;
  String startTime;
  String? status;
  String? supervisorPrimary;
  String? supervisorSecondary;
  TemplateObj? templateObj;
  String? timezone;
  String? timezoneEndTime;
  String? timezoneStartTime;
  String title;
  int? unfilledCount;
  String? unpaidBreak;
  String? unpaidBreakTime;
  List<Recurrings>? reccuringList;

  String funProfessionalLicense() {
    RegExp re = RegExp(r"[^A-Za-z0-9, ]");
    String value = requiredProfessionalLicenseObjects!.map((it) => it.name).toString();
    value = value.replaceAll(re, "");
    return value;
  }
  String credentialDocument() {
    RegExp re = RegExp(r"[^A-Za-z0-9, ]");
    String value = requiredDocumentObjects!.map((it) => it.value).toString();
    value = value.replaceAll(re, "");
    return value;
  }
  String getExperience(int count) {
    String year = int.parse(requiredDepartmentObjects?[count].departmentYear!) > 1 ? "years" : "year";
    String month = int.parse(requiredDepartmentObjects?[count].departmentMonth!) > 1 ? "months" : "month";

    return "${this.requiredDepartmentObjects?[count].departmentYear} $year and ${this.requiredDepartmentObjects?[count]?.departmentMonth} $month";
  }

  ShiftTemplatePreviewModel({
    required this.acceptedCount,
    required this.isSelected,
    required this.availableNotificationStatus,
    this.bidAcceptedProviderObjects,
    this.bidCalledoffProviderObjects,
    required this.bidCount,
    this.bidNcnsProviderObjects,
    this.bidObjects,
    this.bidProviderObjects,
    this.bidRejectedProviderObjects,
    required this.bonus,
    required this.bonusValue,
    required this.callOffMsg,
    required this.calledoffCount,
    required this.categoryFk,
    required this.comissionType,
    required this.comissionValue,
    this.description,
    required this.endDate,
    required this.endTime,
    this.estimatedPrice,
    this.facility,
    this.facilityTemplate,
    this.groupId,
    this.hospitalUserFk,
    required this.hourlyRate,
    required this.id,
    required this.jobConfirmation,
    required this.locationId,
    this.locationObj,
    this.noteObjects,
    this.maximumBillAmount,
    required this.ncnsCount,
    this.needCount,
    this.nurseRate,
    this.originalBonus,
    this.originalMaximumBillAmount,
    this.oriiginalEstimatedPrice,
    this.parentJobId,
    this.pendingCount,
    this.professionalNumber,
    this.recurring,
    this.recurringEndDate,
    this.recurringType,
    this.rejectedCount,
    this.requiredDepartmentObjects,
    this.requiredDocumentObjects,
    //this.requiredEmrObjects,
    this.requiredProfessionalLicenseObjects,
    this.scheduleType,
    this.setFavorite,
    this.shiftKeyword,
    this.showingShiftTo,
    this.speciality,
    this.specialityName,
    required this.startDate,
    required this.startTime,
    this.status,
    this.supervisorPrimary,
    this.supervisorSecondary,
    this.templateObj,
    this.timezone,
    this.timezoneEndTime,
    this.timezoneStartTime,
    required this.title,
    this.unfilledCount,
    this.unpaidBreak,
    this.unpaidBreakTime,
    this.reccuringList,
  });

  factory ShiftTemplatePreviewModel.fromJson(Map<String, dynamic> json) {
    return ShiftTemplatePreviewModel(
      acceptedCount: json['accepted_count'] ?? 0,
      isSelected: json['isSelected'] ?? false,
      availableNotificationStatus: json['available_notification_status'] ?? '',
      bidAcceptedProviderObjects: (json['bid_accepted_provider_objects'] as List<dynamic>?)
          ?.map((obj) => BidAcceptedProviderObjects.fromJson(obj))
          .toList(),
      bidCalledoffProviderObjects: (json['bid_calledoff_provider_objects'] as List<dynamic>?)
          ?.map((obj) => BidAcceptedProviderObjects.fromJson(obj))
          .toList(),
      bidCount: json['bid_count'] ?? 0,
      bidNcnsProviderObjects: (json['bid_ncns_provider_objects'] as List<dynamic>?)
          ?.map((obj) => BidNcnsProviderObject.fromJson(obj))
          .toList(),
      bidObjects: (json['bid_objects'] as List<dynamic>?)
          ?.map((obj) => BidObjectTemplate.fromJson(obj))
          .toList(),
      bidProviderObjects: (json['bid_provider_objects'] as List<dynamic>?)
          ?.map((obj) => BidProviderObject.fromJson(obj))
          .toList(),
      bidRejectedProviderObjects: (json['bid_rejected_provider_objects'] as List<dynamic>?)
          ?.map((obj) => BidAcceptedProviderObjects.fromJson(obj))
          .toList(),
      bonus: json['bonus'] ?? 'No',
      bonusValue: json['bonus_value'] ?? '0.0',
      callOffMsg: json['call_off_msg'] ?? '',
      calledoffCount: json['calledoff_count'] ?? 0,
      categoryFk: json['category_fk'] ?? 0,
      comissionType: json['comission_type'] ?? 'percentage',
      comissionValue: json['comission_value'] ?? '20',
      description: json['description'],
      endDate: json['end_date'] ?? '',
      endTime: json['end_time'] ?? '',
      estimatedPrice: json['estimated_price'],
      facility: json['facility'],
      facilityTemplate: json['facility_template'],
      groupId: json['group_id'],
      hospitalUserFk: json['hospital_user_fk'],
      hourlyRate: json['hourly_rate'] ?? 0,
      id: json['id'] ?? 0,
      jobConfirmation: json['job_confirmation'] ?? '',
      locationId: json['location_id'] ?? 0,
      locationObj: json['location_obj'] != null ? LocationObj.fromJson(json['location_obj']) : null,
      noteObjects: (json['note_objects'] as List<dynamic>?)
          ?.map((obj) => NoteObject.fromJson(obj))
          .toList(),
      maximumBillAmount: json['maximum_bill_amount'] ?? 0,
      ncnsCount: json['ncns_count'] ?? 0,
      needCount: json['need_count'],
      nurseRate: json['nurse_rate'],
      originalBonus: json['original_bonus'],
      originalMaximumBillAmount: json['original_maximum_bill_amount'] ?? '0.0',
      oriiginalEstimatedPrice: json['oriiginal_estimated_price'] ?? '0.0',
      parentJobId: json['parent_job_id'],
      pendingCount: json['pending_count'],
      professionalNumber: json['professional_number'],
      recurring: json['recurring'],
      recurringEndDate: json['recurring_end_date'],
      recurringType: json['recurring_type'],
      rejectedCount: json['rejected_count'],
      requiredDepartmentObjects: (json['required_department_objects'] as List<dynamic>?)
          ?.map((obj) => RequiredDepartmentObject.fromJson(obj))
          .toList(),
      requiredDocumentObjects: (json['required_document_objects'] as List<dynamic>?)
          ?.map((obj) => RequiredDocumentObjects.fromJson(obj))
          .toList(),
      /*requiredEmrObjects: (json['required_emr_objects'] as List<dynamic>?)
          ?.map((obj) => RequiredEmrObjects.fromJson(obj))
          .toList(),
      */requiredProfessionalLicenseObjects: (json['required_professional_license_objects'] as List<dynamic>?)
          ?.map((obj) => RequiredProfessionalLicenseObjects.fromJson(obj))
          .toList(),
      scheduleType: json['schedule_type'],
      setFavorite: json['set_favorite'],
      shiftKeyword: json['shift_keyword'],
      showingShiftTo: json['showing_shift_to'],
      speciality: json['speciality'],
      specialityName: json['speciality_name'],
      startDate: json['start_date'] ?? '',
      startTime: json['start_time'] ?? '',
      status: json['status'],
      supervisorPrimary: json['supervisor_primary'],
      supervisorSecondary: json['supervisor_secondary'],
      templateObj: json['template_obj'] != null ? TemplateObj.fromJson(json['template_obj']) : null,
      timezone: json['timezone'],
      timezoneEndTime: json['timezone_end_time'],
      timezoneStartTime: json['timezone_start_time'],
      title: json['title'] ?? '',
      unfilledCount: json['unfilled_count'],
      unpaidBreak: json['unpaid_break'],
      unpaidBreakTime: json['unpaid_break_time'],
      reccuringList: (json['recurrings'] as List<dynamic>?)
          ?.map((obj) => Recurrings.fromJson(obj))
          .toList(),
    );
  }
}
class Recurrings {
  int? id;
  String? startDate;
  String? startTime;
  String? endDate;
  String? endTime;

  Recurrings({
    this.id,
    this.startDate,
    this.startTime,
    this.endDate,
    this.endTime,
  });

  factory Recurrings.fromJson(Map<String, dynamic> json) {
    return Recurrings(
      id: json['id'],
      startDate: json['start_date'],
      startTime: json['start_time'],
      endDate: json['end_date'],
      endTime: json['end_time'],
    );
  }
}
class BidNcnsProviderObject {
  String? accountStatus;
  String? accountStatusAt;
  int? accountStatusBy;
  String? addressLat;
  String? addressLine1;
  String? addressLine2;
  String? addressLong;
  double? avgRating;
  String? cityId;
  String? cityName;
  String? countryId;
  String? countryName;
  String? createdAt;
  String? createdBy;
  String? deleteFlag;
  String? deletedAt;
  String? deletedBy;
  String? dob;
  String? email;
  String? emailVerifiedAt;
  String? emailVerifiedCode;
  String? firstName;
  String? hospitalDetailId;
  String? hospitalId;
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
  int? role;
  int? servicesFk;
  String? specialityName;
  String? ssnNumber;
  int? stateId;
  String? stateName;
  String? suspendReason;
  dynamic totalRating;
  String? updatedAt;
  int? updatedBy;
  String? verifyAt;
  String? verifyOtp;
  String? verifyStatus;
  String? welcomeFlag;
  String? zipcode;

  BidNcnsProviderObject({
     this.accountStatus,
     this.accountStatusAt,
     this.accountStatusBy,
    this.addressLat,
     this.addressLine1,
     this.addressLine2,
    this.addressLong,
     this.avgRating,
    this.cityId,
     this.cityName,
    this.countryId,
    this.countryName,
     this.createdAt,
    this.createdBy,
     this.deleteFlag,
    this.deletedAt,
    this.deletedBy,
     this.dob,
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
    this.referralBy = '',
     this.referralCode,
    this.referralType,
    this.regionId,
    this.regionName,
     this.role,
     this.servicesFk,
     this.specialityName,
     this.ssnNumber,
     this.stateId,
    this.stateName,
    this.suspendReason,
     this.totalRating,
     this.updatedAt,
     this.updatedBy,
     this.verifyAt,
    this.verifyOtp,
     this.verifyStatus,
     this.welcomeFlag,
     this.zipcode,
  });

  factory BidNcnsProviderObject.fromJson(Map<String, dynamic> json) {
    return BidNcnsProviderObject(
      accountStatus: json['account_status'],
      accountStatusAt: json['account_status_at'],
      accountStatusBy: json['account_status_by'],
      addressLat: json['address_lat'],
      addressLine1: json['address_line_1'],
      addressLine2: json['address_line_2'],
      addressLong: json['address_long'],
      avgRating: json['avg_rating'].toDouble(),
      cityId: json['city_id'],
      cityName: json['city_name'],
      countryId: json['country_id'],
      countryName: json['country_name'],
      createdAt: json['created_at'],
      createdBy: json['created_by'],
      deleteFlag: json['delete_flag'],
      deletedAt: json['deleted_at'],
      deletedBy: json['deleted_by'],
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
      referralBy: json['referral_by'] ?? '',
      referralCode: json['referral_code'],
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
      updatedAt: json['updated_at'],
      updatedBy: json['updated_by'],
      verifyAt: json['verify_at'],
      verifyOtp: json['verify_otp'],
      verifyStatus: json['verify_status'],
      welcomeFlag: json['welcome_flag'],
      zipcode: json['zipcode'],
    );
  }
}
class BidObjectTemplate {
  String? acceptedFlag;
  String? apiVersion;
  double bilRate;
  String? clockIn;
  String? clockInLat;
  String? clockInLong;
  String? clockOut;
  String? clockOutLat;
  String? clockOutLong;
  String? confirmationStatus;
  dynamic createdAt;
  dynamic createdBy;
  dynamic deleteFlag;
  String? deletedAt;
  String? deletedBy;
  int id;
  int jobFk;
  String? lateCallOff;
  String? manualBidAttachment;
  String? manualBidAttachmentUrl;
  String? manualBidReason;
  int nurseUserFk;
  double price;
  String? reason;
  String status;
  String statusDatetime;
  String? timesheetApproveBy;
  String? timesheetRejectBy;
  String? timesheetStatus;
  String? trackStatus;
  String? updatedAt;
  int? updatedBy;
  String? winLose;

  BidObjectTemplate({
     this.acceptedFlag,
    this.apiVersion,
    required this.bilRate,
    this.clockIn,
    this.clockInLat,
    this.clockInLong,
    this.clockOut,
    this.clockOutLat,
    this.clockOutLong,
     this.confirmationStatus,
    required this.createdAt,
    required this.createdBy,
    required this.deleteFlag,
    this.deletedAt,
    this.deletedBy,
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
     this.updatedAt,
     this.updatedBy,
     this.winLose,
  });

  factory BidObjectTemplate.fromJson(Map<String, dynamic> json) {
    return BidObjectTemplate(
      acceptedFlag: json['accepted_flag'],
      apiVersion: json['api_version'],
      bilRate: json['bil_rate'].toDouble(),
      clockIn: json['clock_in'],
      clockInLat: json['clock_in_lat'],
      clockInLong: json['clock_in_long'],
      clockOut: json['clock_out'],
      clockOutLat: json['clock_out_lat'],
      clockOutLong: json['clock_out_long'],
      confirmationStatus: json['confirmation_status'],
      createdAt: json['created_at'],
      createdBy: json['created_by'],
      deleteFlag: json['delete_flag'],
      deletedAt: json['deleted_at'],
      deletedBy: json['deleted_by'],
      id: json['id'],
      jobFk: json['job_fk'],
      lateCallOff: json['late_call_off'],
      manualBidAttachment: json['manual_bid_attachment'],
      manualBidAttachmentUrl: json['manual_bid_attachment_url'],
      manualBidReason: json['manual_bid_reason'],
      nurseUserFk: json['nurse_user_fk'],
      price: json['price'].toDouble(),
      reason: json['reason'],
      status: json['status'],
      statusDatetime: json['status_datetime'],
      timesheetApproveBy: json['timesheet_approve_by'],
      timesheetRejectBy: json['timesheet_reject_by'],
      timesheetStatus: json['timesheet_status'],
      trackStatus: json['track_status'],
      updatedAt: json['updated_at'],
      updatedBy: json['updated_by'],
      winLose: json['win_lose'],
    );
  }
}
class BidProviderObject {
  dynamic accountStatus;
  dynamic accountStatusAt;
  int? accountStatusBy;
  dynamic? addressLat;
  dynamic addressLine1;
  dynamic addressLine2;
  dynamic? addressLong;
  dynamic avgRating;
  dynamic? cityId;
  dynamic cityName;
  dynamic? countryId;
  dynamic? countryName;
  dynamic createdAt;
  dynamic? createdBy;
  dynamic deleteFlag;
  dynamic? deletedAt;
  dynamic? deletedBy;
  dynamic dob;
  dynamic email;
  dynamic? emailVerifiedAt;
  dynamic? emailVerifiedCode;
  dynamic firstName;
  dynamic? hospitalDetailId;
  dynamic? hospitalId;
  int id;
  dynamic ip;
  dynamic lastLogin;
  dynamic lastName;
  dynamic? loginOtp;
  dynamic loginOtpStatus;
  dynamic? middleName;
  dynamic mobile;
  dynamic mobileVerified;
  dynamic netspendAccNo;
  dynamic netspendAccStatus;
  dynamic? netspendEnrollDatetime;
  dynamic notificationEmail;
  dynamic notificationText;
  dynamic? objectId;
  dynamic paymentGateway;
  dynamic? profile;
  dynamic profileUrl;
  dynamic? referralBy;
  dynamic referralCode;
  dynamic? referralType;
  dynamic? regionId;
  dynamic? regionName;
  int? role;
  int? servicesFk;
  dynamic specialityName;
  dynamic ssnNumber;
  int? stateId;
  dynamic? stateName;
  dynamic? suspendReason;
  dynamic totalRating;
  dynamic updatedAt;
  int? updatedBy;
  dynamic verifyAt;
  dynamic? verifyOtp;
  dynamic verifyStatus;
  dynamic welcomeFlag;
  dynamic zipcode;

  BidProviderObject({
     this.accountStatus,
     this.accountStatusAt,
     this.accountStatusBy,
    this.addressLat,
     this.addressLine1,
     this.addressLine2,
    this.addressLong,
     this.avgRating,
    this.cityId,
     this.cityName,
    this.countryId,
    this.countryName,
     this.createdAt,
    this.createdBy,
     this.deleteFlag,
    this.deletedAt,
    this.deletedBy,
     this.dob,
     this.email,
    this.emailVerifiedAt,
    this.emailVerifiedCode,
     this.firstName,
    this.hospitalDetailId,
    this.hospitalId,
     required this.id,
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
     this.servicesFk,
     this.specialityName,
     this.ssnNumber,
     this.stateId,
    this.stateName,
    this.suspendReason,
     this.totalRating,
     this.updatedAt,
     this.updatedBy,
     this.verifyAt,
    this.verifyOtp,
     this.verifyStatus,
     this.welcomeFlag,
     this.zipcode,
  });

  factory BidProviderObject.fromJson(Map<String, dynamic> json) {
    return BidProviderObject(
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
      createdAt: json['created_at'],
      createdBy: json['created_by'],
      deleteFlag: json['delete_flag'],
      deletedAt: json['deleted_at'],
      deletedBy: json['deleted_by'],
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
      referralCode: json['referral_code'],
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
      updatedAt: json['updated_at'],
      updatedBy: json['updated_by'],
      verifyAt: json['verify_at'],
      verifyOtp: json['verify_otp'],
      verifyStatus: json['verify_status'],
      welcomeFlag: json['welcome_flag'],
      zipcode: json['zipcode'],
    );
  }
}
class BidAcceptedProviderObjects {
  dynamic accountStatus;
  dynamic accountStatusAt;
  dynamic accountStatusBy;
  dynamic? addressLat;
  dynamic addressLine1;
  dynamic addressLine2;
  dynamic? addressLong;
  dynamic avgRating;
  dynamic? cityId;
  dynamic cityName;
  dynamic? countryId;
  dynamic? countryName;
  dynamic dob;
  dynamic email;
  dynamic firstName;
  dynamic id;
  dynamic lastLogin;
  dynamic lastName;
  dynamic? middleName;
  dynamic mobile;
  dynamic netspendAccNo;
  dynamic netspendAccStatus;
  dynamic? netspendEnrollDatetime;
  dynamic? objectId;
  dynamic paymentGateway;
  dynamic profile;
  dynamic profileUrl;
  dynamic? referralBy;
  dynamic referralCode;
  dynamic? referralType;
  dynamic? regionId;
  dynamic? regionName;
  dynamic role;
  dynamic servicesFk;
  dynamic specialityName;
  dynamic ssnNumber;
  dynamic stateId;
  dynamic? stateName;
  dynamic? suspendReason;
  dynamic totalRating;

  BidAcceptedProviderObjects({
    required this.accountStatus,
     this.accountStatusAt,
     this.accountStatusBy,
    this.addressLat,
     this.addressLine1,
     this.addressLine2,
    this.addressLong,
     this.avgRating,
    this.cityId,
     this.cityName,
    this.countryId,
    this.countryName,
     this.dob,
     this.email,
     this.firstName,
     this.id,
     this.lastLogin,
     this.lastName,
    this.middleName,
     this.mobile,
     this.netspendAccNo,
     this.netspendAccStatus,
    this.netspendEnrollDatetime,
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
     this.servicesFk,
     this.specialityName,
     this.ssnNumber,
     this.stateId,
    this.stateName,
    this.suspendReason,
     this.totalRating,
  });

  factory BidAcceptedProviderObjects.fromJson(Map<String, dynamic> json) {
    return BidAcceptedProviderObjects(
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
      firstName: json['first_name'],
      id: json['id'],
      lastLogin: json['last_login'],
      lastName: json['last_name'],
      middleName: json['middle_name'],
      mobile: json['mobile'],
      netspendAccNo: json['netspend_acc_no'],
      netspendAccStatus: json['netspend_acc_status'],
      netspendEnrollDatetime: json['netspend_enroll_datetime'],
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
      servicesFk: json['services_fk'],
      specialityName: json['speciality_name'],
      ssnNumber: json['ssn_number'],
      stateId: json['state_id'],
      stateName: json['state_name'],
      suspendReason: json['suspend_reason'],
      totalRating: json['total_rating'],
    );
  }
}
