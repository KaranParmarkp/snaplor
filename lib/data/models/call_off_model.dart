class CallOffModel {
  String apiVersion;
  String tagOfClock;
  dynamic bilRate;
  String clockIn;
  String clockInLat;
  String clockInLong;
  String clockOut;
  String clockOutLat;
  ClockObj? clockObj;
  List<ClockObj>? clockObjs;
  String clockOutLong;
  String confirmationStatus;

  dynamic id;
  dynamic jobFk;
  String lateCallOff;
  String manualBidAttachment;
  String manualBidAttachmentUrl;
  String manualBidReason;
  dynamic nurseUserFk;
  dynamic price;
  ProviderObjCallOff? providerObj;
  String reason;
  ShiftObj? shiftObj;
  String status;
  String statusDatetime;
  String timesheetApproveBy;
  String timesheetRejectBy;
  String timesheetStatus;
  String trackStatus;
  String winLose;

  CallOffModel({
    this.apiVersion = '',
    this.tagOfClock = '',
    this.bilRate = 0,
    this.clockIn = '',
    this.clockInLat = '',
    this.clockInLong = '',
    this.clockOut = '',
    this.clockOutLat = '',
    this.clockObj,
    this.clockObjs,
    this.clockOutLong = '',
    this.confirmationStatus = '',
    this.id = 0,
    this.jobFk = 0,
    this.lateCallOff = '',
    this.manualBidAttachment = '',
    this.manualBidAttachmentUrl = '',
    this.manualBidReason = '',
    this.nurseUserFk = 0,
    this.price = 0,
    this.providerObj,
    this.reason = '',
    this.shiftObj,
    this.status = '',
    this.statusDatetime = '',
    this.timesheetApproveBy = '',
    this.timesheetRejectBy = '',
    this.timesheetStatus = '',
    this.trackStatus = '',
    this.winLose = '',
  });

  factory CallOffModel.fromJson(Map<String, dynamic> json) {
    return CallOffModel(
      apiVersion: json['api_version'] ?? '',
      tagOfClock: json['tag_of_clock'] ?? '',
      bilRate: json['bil_rate'] ?? 0.0,
      clockIn: json['clock_in'] ?? '',
      clockInLat: json['clock_in_lat'] ?? '',
      clockInLong: json['clock_in_long'] ?? '',
      clockOut: json['clock_out'] ?? '',
      clockOutLat: json['clock_out_lat'] ?? '',
      clockObj: json['clock_obj'] != null ? ClockObj.fromJson(json['clock_obj']) : null,
      clockObjs: json['clock_objs'] != null ? (json['clock_objs'] as List).map((e) => ClockObj.fromJson(e)).toList() : null,
      clockOutLong: json['clock_out_long'] ?? '',
      confirmationStatus: json['confirmation_status'] ?? '',
      id: json['id'] ?? 0,
      jobFk: json['job_fk'] ?? 0,
      lateCallOff: json['late_call_off'] ?? '',
      manualBidAttachment: json['manual_bid_attachment'] ?? '',
      manualBidAttachmentUrl: json['manual_bid_attachment_url'] ?? '',
      manualBidReason: json['manual_bid_reason'] ?? '',
      nurseUserFk: json['nurse_user_fk'] ?? 0,
      price: json['price'] ?? 0,
      providerObj: json['provider_obj'] != null ? ProviderObjCallOff.fromJson(json['provider_obj']) : null,
      reason: json['reason'] ?? '',
      shiftObj: json['shift_obj'] != null ? ShiftObj.fromJson(json['shift_obj']) : null,
      status: json['status'] ?? '',
      statusDatetime: json['status_datetime'] ?? '',
      timesheetApproveBy: json['timesheet_approve_by'] ?? '',
      timesheetRejectBy: json['timesheet_reject_by'] ?? '',
      timesheetStatus: json['timesheet_status'] ?? '',
      trackStatus: json['track_status'] ?? '',
      winLose: json['win_lose'] ?? '',
    );
  }
}


class ClockObj {
  dynamic actualTime;
  dynamic apiVersion;
  dynamic bidId;
  List<BreakObj> breakObjs;
  dynamic breakTime;
  dynamic changeLockByInvoice;
  dynamic clockInLat;
  dynamic clockInLong;
  dynamic clockOutLat;
  dynamic clockOutLong;
  dynamic clockOutReason;
  dynamic clockinClockoutStatus;
  dynamic clockinClockoutStatusDate;
  dynamic clockinClockoutStatusReason;
  dynamic clockinClockoutStatusType;
  dynamic clockinClockoutStatusUpdateBy;
  dynamic clockinTime;
  dynamic clockoutTime;
  dynamic createdAt;
  dynamic createdBy;
  dynamic deleteFlag;
  dynamic deletedAt;
  dynamic deletedBy;
  dynamic extendTime;
  dynamic facilityFeedback;
  dynamic facilityInvoiceFlag;
  dynamic facilityRate;
  dynamic finalAmountForNurseWithBonus;
  dynamic finalAmountForQuinableWithBonus;
  dynamic finalTime;
  dynamic hospitalInvoceId;
  dynamic id;
  dynamic jobClockinClockoutcol;
  dynamic jobFk;
  dynamic manualUpdate;
  dynamic manualUpdateReason;
  dynamic ncns;
  dynamic nurseFeedbackStatus;
  dynamic nurseInvoceId;
  dynamic nursePaidStatus;
  dynamic nurseUserFk;
  dynamic payableAmount;
  dynamic quinablePaidStatus;
  dynamic totalAmountForNurse;
  dynamic totalAmountForQuinable;
  dynamic totalTime;
  dynamic uniClockinTime;
  dynamic uniClockoutTime;
  dynamic unpaidBreak;
  dynamic updatedAt;
  dynamic updatedBy;

  ClockObj({
    this.actualTime = '',
    this.apiVersion = '',
    this.bidId = 0,
    this.breakObjs = const [],
    this.breakTime = '',
    this.changeLockByInvoice = '',
    this.clockInLat = '',
    this.clockInLong = '',
    this.clockOutLat = '',
    this.clockOutLong = '',
    this.clockOutReason = '',
    this.clockinClockoutStatus = '',
    this.clockinClockoutStatusDate = '',
    this.clockinClockoutStatusReason = '',
    this.clockinClockoutStatusType = '',
    this.clockinClockoutStatusUpdateBy = '',
    this.clockinTime = '',
    this.clockoutTime = '',
    this.createdAt = '',
    this.createdBy = 0,
    this.deleteFlag = '',
    this.deletedAt = '',
    this.deletedBy = '',
    this.extendTime = '',
    this.facilityFeedback = '',
    this.facilityInvoiceFlag = '',
    this.facilityRate = '',
    this.finalAmountForNurseWithBonus = 0.0,
    this.finalAmountForQuinableWithBonus = 0.0,
    this.finalTime,
    this.hospitalInvoceId = '',
    this.id = 0,
    this.jobClockinClockoutcol = '',
    this.jobFk = 0,
    this.manualUpdate = '',
    this.manualUpdateReason = '',
    this.ncns = '',
    this.nurseFeedbackStatus = '',
    this.nurseInvoceId = '',
    this.nursePaidStatus = '',
    this.nurseUserFk = 0,
    this.payableAmount = 0.0,
    this.quinablePaidStatus = '',
    this.totalAmountForNurse = 0.0,
    this.totalAmountForQuinable = 0.0,
    this.totalTime = '',
    this.uniClockinTime = '',
    this.uniClockoutTime = '',
    this.unpaidBreak = '',
    this.updatedAt = '',
    this.updatedBy = 0,
  });

  factory ClockObj.fromJson(Map<String, dynamic> json) {
    return ClockObj(
      actualTime: json['actual_time'] ?? '',
      apiVersion: json['api_version'] ?? '',
      bidId: json['bid_id'] ?? 0,
      breakObjs: (json['break_objs'] as List<dynamic>?)
          ?.map((e) => BreakObj.fromJson(e as Map<String, dynamic>))
          ?.toList() ??
          [],
      breakTime: json['break_time'] ?? '',
      changeLockByInvoice: json['change_lock_by_invoice'] ?? '',
      clockInLat: json['clock_in_lat'] ?? '',
      clockInLong: json['clock_in_long'] ?? '',
      clockOutLat: json['clock_out_lat'] ?? '',
      clockOutLong: json['clock_out_long'] ?? '',
      clockOutReason: json['clock_out_reason'] ?? '',
      clockinClockoutStatus: json['clockin_clockout_status'] ?? '',
      clockinClockoutStatusDate: json['clockin_clockout_status_date'] ?? '',
      clockinClockoutStatusReason: json['clockin_clockout_status_reason'] ?? '',
      clockinClockoutStatusType: json['clockin_clockout_status_type'] ?? '',
      clockinClockoutStatusUpdateBy: json['clockin_clockout_status_update_by'] ?? '',
      clockinTime: json['clockin_time'] ?? '',
      clockoutTime: json['clockout_time'] ?? '',
      createdAt: json['created_at'] ?? '',
      createdBy: json['created_by'] ?? 0,
      deleteFlag: json['delete_flag'] ?? '',
      deletedAt: json['deleted_at'] ?? '',
      deletedBy: json['deleted_by'] ?? '',
      extendTime: json['extend_time'] ?? '',
      facilityFeedback: json['facility_feedback'] ?? '',
      facilityInvoiceFlag: json['facility_invoice_flag'] ?? '',
      facilityRate: json['facility_rate'] ?? '',
      finalAmountForNurseWithBonus: json['final_amount_for_nurse_with_bonus'] ?? 0.0,
      finalAmountForQuinableWithBonus: json['final_amount_for_quinable_with_bonus'] ?? 0.0,
      finalTime: json['final_time'] ?? '0000',
      hospitalInvoceId: json['hospital_invoce_id'] ?? '',
      id: json['id'] ?? 0,
      jobClockinClockoutcol: json['job_clockin_clockoutcol'] ?? '',
      jobFk: json['job_fk'] ?? 0,
      manualUpdate: json['manual_update'] ?? '',
      manualUpdateReason: json['manual_update_reason'] ?? '',
      ncns: json['ncns'] ?? '',
      nurseFeedbackStatus: json['nurse_feedback_status'] ?? '',
      nurseInvoceId: json['nurse_invoce_id'] ?? '',
      nursePaidStatus: json['nurse_paid_status'] ?? '',
      nurseUserFk: json['nurse_user_fk'] ?? 0,
      payableAmount: json['payable_amount'] ?? 0.0,
      quinablePaidStatus: json['quinable_paid_status'] ?? '',
      totalAmountForNurse: json['total_amount_for_nurse'] ?? 0.0,
      totalAmountForQuinable: json['total_amount_for_quinable'] ?? 0.0,
      totalTime: json['total_time'] ?? '',
      uniClockinTime: json['uni_clockin_time'] ?? '',
      uniClockoutTime: json['uni_clockout_time'] ?? '',
      unpaidBreak: json['unpaid_break'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      updatedBy: json['updated_by'] ?? 0,
    );
  }
}

class BreakObj {
  String breakStarttime;
  String breakStoptime;
  dynamic id;
  dynamic jobClockinClockoutFk;
  dynamic jobFk;
  String notificationDatetime;
  dynamic nurseUserFk;
  String totalTime;
  String updatedAt;
  dynamic updatedBy;
  String utcBreakStarttime;
  String utcBreakStoptime;
  String action;

  BreakObj({
    this.breakStarttime = '',
    this.breakStoptime = '',
    this.id = '',
    this.jobClockinClockoutFk = 0,
    this.jobFk = 0,
    this.notificationDatetime = '',
    this.nurseUserFk = 0,
    this.totalTime = '',
    this.updatedAt = '',
    this.updatedBy = 0,
    this.utcBreakStarttime = '',
    this.utcBreakStoptime = '',
    this.action = 'update',
  });

  factory BreakObj.fromJson(Map<String, dynamic> json) {
    return BreakObj(
      breakStarttime: json['break_starttime'] ?? '',
      breakStoptime: json['break_stoptime'] ?? '',
      id: json['id'] ?? '',
      jobClockinClockoutFk: json['job_clockin_clockout_fk'] ?? 0,
      jobFk: json['job_fk'] ?? 0,
      notificationDatetime: json['notification_datetime'] ?? '',
      nurseUserFk: json['nurse_user_fk'] ?? 0,
      totalTime: json['total_time'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      updatedBy: json['updated_by'] ?? 0,
      utcBreakStarttime: json['utc_break_starttime'] ?? '',
      utcBreakStoptime: json['utc_break_stoptime'] ?? '',
      action: 'update',
    );
  }
}

class ProviderObjCallOff {
  final double avgRating;
  final String? email;
  final String? firstName;
  final dynamic id;
  final String? lastName;
  final String? middleName;
  final String? mobile;
  final String objectId;
  final String paymentGateway;
  final String? profile;
  final String? profileUrl;
  final String specialityName;
  final dynamic totalRating;

  ProviderObjCallOff({
    this.avgRating = 0.0,
    this.email,
    this.firstName,
    this.id = 0,
    this.lastName,
    this.middleName,
    this.mobile,
    this.objectId = '',
    this.paymentGateway = '',
    this.profile,
    this.profileUrl,
    this.specialityName = '',
    this.totalRating = '',
  });

  factory ProviderObjCallOff.fromJson(Map<String, dynamic> json) {
    return ProviderObjCallOff(
      avgRating: json['avg_rating']!=null  ? double.parse(json["avg_rating"].toString()): 0.0,
      email: json['email'],
      firstName: json['first_name'],
      id: json['id'] ?? 0,
      lastName: json['last_name'],
      middleName: json['middle_name'] ?? "",
      mobile: json['mobile'],
      objectId: json['object_id'] ?? '',
      paymentGateway: json['payment_gateway'] ?? '',
      profile: json['profile'],
      profileUrl: json['profile_url'],
      specialityName: json['speciality_name'] ?? '',
      totalRating: json['total_rating'] ?? '',
    );
  }
}



class ShiftObj {
  final dynamic availableNotificationStatus;
  final dynamic bonus;
  final dynamic bonusValue;
  final dynamic callOffMsg;
  final dynamic categoryFk;
  final dynamic comissionType;
  final dynamic comissionValue;
  final dynamic description;
  final dynamic endDate;
  final dynamic endTime;
  final dynamic estimatedPrice;
  final dynamic facility;
  final dynamic facilityTemplate;
  final dynamic groupId;
  final dynamic hospitalUserFk;
  final dynamic hourlyRate;
  final dynamic id;
  final dynamic jobConfirmation;
  final dynamic locationId;
  final LocationObjCallOff? locationObj;
  final dynamic maximumBillAmount;
  final dynamic nurseRate;
  final dynamic originalBonus;
  final dynamic originalMaximumBillAmount;
  final dynamic oriiginalEstimatedPrice;
  final dynamic parentJobId;
  final dynamic professionalNumber;
  final dynamic recurring;
  final dynamic recurringEndDate;
  final dynamic recurringType;
  final dynamic scheduleType;
  final dynamic setFavorite;
  final dynamic shiftKeyword;
  final dynamic showingShiftTo;
  final dynamic speciality;
  final dynamic startDate;
  final dynamic startTime;
  final dynamic status;
  final dynamic supervisorPrimary;
  final dynamic supervisorSecondary;
  final dynamic timezone;
  final dynamic timezoneEndTime;
  final dynamic timezoneStartTime;
  final dynamic title;
  final dynamic unpaidBreak;
  final dynamic unpaidBreakTime;

  ShiftObj({
    this.availableNotificationStatus = '',
    this.bonus = '',
    this.bonusValue = '',
    this.callOffMsg = '',
    this.categoryFk = 0,
    this.comissionType = '',
    this.comissionValue = '',
    this.description = '',
    this.endDate = '',
    this.endTime = '',
    this.estimatedPrice = '',
    this.facility = '',
    this.facilityTemplate = '',
    this.groupId = '',
    this.hospitalUserFk = 0,
    this.hourlyRate = 0.0,
    this.id = 0,
    this.jobConfirmation = '',
    this.locationId = 0,
    this.locationObj,
    this.maximumBillAmount = '',
    this.nurseRate = '',
    this.originalBonus = '',
    this.originalMaximumBillAmount = 0.0,
    this.oriiginalEstimatedPrice = '',
    this.parentJobId = '',
    this.professionalNumber = '',
    this.recurring = '',
    this.recurringEndDate = '',
    this.recurringType = '',
    this.scheduleType = '',
    this.setFavorite = '',
    this.shiftKeyword = '',
    this.showingShiftTo = '',
    this.speciality = 0,
    this.startDate = '',
    this.startTime = '',
    this.status = '',
    this.supervisorPrimary = 0,
    this.supervisorSecondary = 0,
    this.timezone = '',
    this.timezoneEndTime = '',
    this.timezoneStartTime = '',
    this.title = '',
    this.unpaidBreak = '',
    this.unpaidBreakTime = '',
  });

  factory ShiftObj.fromJson(Map<String, dynamic> json) {
    return ShiftObj(
      availableNotificationStatus: json['available_notification_status'] ?? '',
      bonus: json['bonus'] ?? '',
      bonusValue: json['bonus_value'] ?? '',
      callOffMsg: json['call_off_msg'] ?? '',
      categoryFk: json['category_fk'] ?? 0,
      comissionType: json['comission_type'] ?? '',
      comissionValue: json['comission_value'] ?? '',
      description: json['description'] ?? '',
      endDate: json['end_date'] ?? '',
      endTime: json['end_time'] ?? '',
      estimatedPrice: json['estimated_price'] ?? '',
      facility: json['facility'] ?? '',
      facilityTemplate: json['facility_template'] ?? '',
      groupId: json['group_id'] ?? '',
      hospitalUserFk: json['hospital_user_fk'] ?? 0,
      hourlyRate: json['hourly_rate'] ?? 0.0,
      id: json['id'] ?? 0,
      jobConfirmation: json['job_confirmation'] ?? '',
      locationId: json['location_id'] ?? 0,
      locationObj: LocationObjCallOff.fromJson(json['location_obj'] ?? {}),
      maximumBillAmount: json['maximum_bill_amount'] ?? '',
      nurseRate: json['nurse_rate'] ?? '',
      originalBonus: json['original_bonus'] ?? '',
      originalMaximumBillAmount: json['original_maximum_bill_amount'] ?? 0.0,
      oriiginalEstimatedPrice: json['oriiginal_estimated_price'] ?? '',
      parentJobId: json['parent_job_id'] ?? '',
      professionalNumber: json['professional_number'] ?? '',
      recurring: json['recurring'] ?? '',
      recurringEndDate: json['recurring_end_date'] ?? '',
      recurringType: json['recurring_type'] ?? '',
      scheduleType: json['schedule_type'] ?? '',
      setFavorite: json['set_favorite'] ?? '',
      shiftKeyword: json['shift_keyword'] ?? '',
      showingShiftTo: json['showing_shift_to'] ?? '',
      speciality: json['speciality'] ?? 0,
      startDate: json['start_date'] ?? '',
      startTime: json['start_time'] ?? '',
      status: json['status'] ?? '',
      supervisorPrimary: json['supervisor_primary'] ?? 0,
      supervisorSecondary: json['supervisor_secondary'] ?? 0,
      timezone: json['timezone'] ?? '',
      timezoneEndTime: json['timezone_end_time'] ?? '',
      timezoneStartTime: json['timezone_start_time'] ?? '',
      title: json['title'] ?? '',
      unpaidBreak: json['unpaid_break'] ?? '',
      unpaidBreakTime: json['unpaid_break_time'] ?? '',
    );
  }
}

class LocationObjCallOff {
  final dynamic accountId;
  final String additionalInstruction;
  final String address;
  final String address2;
  final String cityName;
  final String contactPersonName;
  final String description;
  final String email;
  final dynamic facilityType;
  final dynamic hospitalUserId;
  final dynamic id;
  final String image;
  final String imageUrl;
  final String lat;
  final String long;
  final String name;
  final String nickname;
  final String phone;
  final String stateName;
  final String streetName;
  final String timezone;
  final String zipcode;

  LocationObjCallOff({
    this.accountId = 0,
    this.additionalInstruction = '',
    this.address = '',
    this.address2 = '',
    this.cityName = '',
    this.contactPersonName = '',
    this.description = '',
    this.email = '',
    this.facilityType = 0,
    this.hospitalUserId = 0,
    this.id = 0,
    this.image = '',
    this.imageUrl = '',
    this.lat = '',
    this.long = '',
    this.name = '',
    this.nickname = '',
    this.phone = '',
    this.stateName = '',
    this.streetName = '',
    this.timezone = '',
    this.zipcode = '',
  });

  factory LocationObjCallOff.fromJson(Map<String, dynamic> json) {
    return LocationObjCallOff(
      accountId: json['account_id'] ?? 0,
      additionalInstruction: json['additional_instruction'] ?? '',
      address: json['address'] ?? '',
      address2: json['address2'] ?? '',
      cityName: json['city_name'] ?? '',
      contactPersonName: json['contact_person_name'] ?? '',
      description: json['description'] ?? '',
      email: json['email'] ?? '',
      facilityType: json['facility_type'] ?? 0,
      hospitalUserId: json['hospital_user_id'] ?? 0,
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      imageUrl: json['image_url'] ?? '',
      lat: json['lat'] ?? '',
      long: json['long'] ?? '',
      name: json['name'] ?? '',
      nickname: json['nickname'] ?? '',
      phone: json['phone'] ?? '',
      stateName: json['state_name'] ?? '',
      streetName: json['street_name'] ?? '',
      timezone: json['timezone'] ?? '',
      zipcode: json['zipcode'] ?? '',
    );
  }
}
