import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jyotishee/app/utils/utils.dart';


class RegisterModel {
  String? mobile;
  String? email;
  String? password;
  String? confirm_new_password;
  String? first_name;
  String? last_name;
  String? account_name;
  String? legal_company_name;
  String? facility_type;
  String? company_email;
  String? company_phone;
  String? company_website;
  String? address_line_1;
  String? address_line_2;
  String? city;
  String? state;
  String? zipcode;
  String? lat;
  String? long;
  String? timezone;
  String? industryId;
  File? companyLogo;
  File? companyPhoto;
  RegisterModel({
    this.mobile,
    this.email,
    this.password,
    this.confirm_new_password,
    this.first_name,
    this.last_name,
    this.account_name,
    this.legal_company_name,
    this.facility_type,
    this.company_email,
    this.company_phone,
    this.company_website,
    this.address_line_1,
    this.address_line_2,
    this.city,
    this.state,
    this.zipcode,
    this.lat,
    this.long,
    this.timezone,
    this.industryId,
    this.companyPhoto,
    this.companyLogo
  });
  Future<FormData> toFormData() async {
    FormData data = FormData.fromMap({


   "mobile" : mobile,
   "email" : email,
   "password" : password,
   "confirm_password" : confirm_new_password,
   "first_name" : first_name,
   "last_name" : last_name,
   "account_name" : address_line_2 ?? "account_name",
   "legal_company_name" : legal_company_name,
   "facility_type" : facility_type,
   "company_email" : company_email,
   "company_phone" : company_phone,
   "company_website" : company_website,
   "address_line_1" : address_line_1,
   "address_line_2" : address_line_2,
   "city" : city,
   "state" : state,
   "zipcode" : zipcode,
   "lat" : lat,
   "long" : long,
   "timezone" : timezone,
   "industry_id" : industryId,
      if(companyLogo.isNotNull)'company_logo': await MultipartFile.fromFile(
        companyLogo!.path,
        filename: companyLogo!.path.split('/').last,
      ),
      if(companyPhoto.isNotNull)'company_photo': await MultipartFile.fromFile(
        companyPhoto!.path,
        filename: companyPhoto!.path.split('/').last,
      ),
    });
    print(data.fields);
    print(data.files);
    return data;
  }

}
