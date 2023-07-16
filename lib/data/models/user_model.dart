import 'dart:convert';

import 'package:jyotishee/data/models/generic_response_model.dart';

import 'models.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

//String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel implements FromJsonModel<UserModel>{
  String? accessToken;
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
  String? password;
  String? emailVerifiedAt;
  String? emailVerifiedCode;
  String? expiresAt;
  FacilityDetail facilityDetail;
  List<FacilityLocation> facilityLocations;
  String? firstName;
  int? hospitalDetailId;
  String? hospitalId;
  int? id;
  String? ip;
  String? lastLogin;
  String? lastName;
  int? loginOtp;
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
  String? tokenType;
  String? verifyAt;
  dynamic verifyOtp;
  String? verifyStatus;
  String? welcomeFlag;
  String? zipcode;

  UserModel({
    this.accessToken,
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
    this.password,
    this.emailVerifiedAt,
    this.emailVerifiedCode,
    this.expiresAt,
     required this.facilityDetail,
     required this.facilityLocations,
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
    this.tokenType,
    this.verifyAt,
    this.verifyOtp,
    this.verifyStatus,
    this.welcomeFlag,
    this.zipcode,
  });

  @override
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      accessToken: json['access_token'],
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
      password: json['password'],
      emailVerifiedAt: json['email_verified_at'],
      emailVerifiedCode: json['email_verified_code'],
      expiresAt: json['expires_at'],
      facilityDetail: FacilityDetail.fromJson(json['facility_detail']),
      facilityLocations: List<FacilityLocation>.from(json['facility_locations'].map((x) => FacilityLocation.fromJson(x))),
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
      tokenType: json['token_type'],
      verifyAt: json['verify_at'],
      verifyOtp: json['verify_otp'],
      verifyStatus: json['verify_status'],
      welcomeFlag: json['welcome_flag'],
      zipcode: json['zipcode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['account_status'] = this.accountStatus;
    data['account_status_at'] = this.accountStatusAt;
    data['account_status_by'] = this.accountStatusBy;
    data['address_lat'] = this.addressLat;
    data['address_line_1'] = this.addressLine1;
    data['address_line_2'] = this.addressLine2;
    data['address_long'] = this.addressLong;
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['country_id'] = this.countryId;
    data['country_name'] = this.countryName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['email_verified_code'] = this.emailVerifiedCode;
    data['expires_at'] = this.expiresAt;
    data['facility_detail'] = this.facilityDetail.toJson();
    data['facility_locations'] = this.facilityLocations.map((location) => location.toJson()).toList();
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
    data['referral_code'] = this.referralCode;
    data['referral_type'] = this.referralType;
    data['region_id'] = this.regionId;
    data['region_name'] = this.regionName;
    data['role'] = this.role;
    data['state_id'] = this.stateId;
    data['state_name'] = this.stateName;
    data['suspend_reason'] = this.suspendReason;
    data['token_type'] = this.tokenType;
    data['verify_at'] = this.verifyAt;
    data['verify_otp'] = this.verifyOtp;
    data['verify_status'] = this.verifyStatus;
    data['welcome_flag'] = this.welcomeFlag;
    data['zipcode'] = this.zipcode;
    return data;
  }


  fromJsonBase(Map<String, dynamic> json) {
    return UserModel(
      accessToken: json['access_token'],
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
      password: json['password'],
      emailVerifiedAt: json['email_verified_at'],
      emailVerifiedCode: json['email_verified_code'],
      expiresAt: json['expires_at'],
      facilityDetail: FacilityDetail.fromJson(json['facility_detail']),
      facilityLocations: List<FacilityLocation>.from(json['facility_locations'].map((x) => FacilityLocation.fromJson(x))),
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
      tokenType: json['token_type'],
      verifyAt: json['verify_at'],
      verifyOtp: json['verify_otp'],
      verifyStatus: json['verify_status'],
      welcomeFlag: json['welcome_flag'],
      zipcode: json['zipcode'],
    );
  }

  @override
  UserModel fromJsonHelp(Map<String, dynamic> json) {
    return UserModel(
      accessToken: json['access_token'],
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
      password: json['password'],
      emailVerifiedAt: json['email_verified_at'],
      emailVerifiedCode: json['email_verified_code'],
      expiresAt: json['expires_at'],
      facilityDetail: FacilityDetail.fromJson(json['facility_detail']),
      facilityLocations: List<FacilityLocation>.from(json['facility_locations'].map((x) => FacilityLocation.fromJson(x))),
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
      tokenType: json['token_type'],
      verifyAt: json['verify_at'],
      verifyOtp: json['verify_otp'],
      verifyStatus: json['verify_status'],
      welcomeFlag: json['welcome_flag'],
      zipcode: json['zipcode'],
    );
  }

}
