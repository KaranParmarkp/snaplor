class FacilityDetail {
  dynamic abotUsOther;
  dynamic aboutUs;
  String address;
  dynamic addressLine2;
  int? assignTo;
  String cityName;
  dynamic companyLogo;
  dynamic companyLogoUrl;
  dynamic companyPhoto;
  dynamic companyPhotoUrl;
  dynamic contactPersonName;
  String deleteFlag;
  dynamic deletedAt;
  dynamic deletedBy;
  String email;
  int facilityType;
  dynamic fax;
  int hospitalUserFk;
  int id;
  String invoiceType;
  String lang;
  String lat;
  String legalCompanyName;
  String phone;
  dynamic rating;
  String stateName;
  String updatedAt;
  int updatedBy;
  String websiteUrl;
  String zipcode;

  FacilityDetail({
    this.abotUsOther,
    this.aboutUs,
    required this.address,
    this.addressLine2,
     this.assignTo,
    required this.cityName,
    this.companyLogo,
    this.companyLogoUrl,
    this.companyPhoto,
    this.companyPhotoUrl,
    this.contactPersonName,
    required this.deleteFlag,
    this.deletedAt,
    this.deletedBy,
    required this.email,
    required this.facilityType,
    this.fax,
    required this.hospitalUserFk,
    required this.id,
    required this.invoiceType,
    required this.lang,
    required this.lat,
    required this.legalCompanyName,
    required this.phone,
    this.rating,
    required this.stateName,
    required this.updatedAt,
    required this.updatedBy,
    required this.websiteUrl,
    required this.zipcode,
  });

  factory FacilityDetail.fromJson(Map<String, dynamic> json) {
    return FacilityDetail(
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
      deleteFlag: json['delete_flag'],
      deletedAt: json['deleted_at'],
      deletedBy: json['deleted_by'],
      email: json['email'],
      facilityType: json['facility_type'],
      fax: json['fax'],
      hospitalUserFk: json['hospital_user_fk'],
      id: json['id'],
      invoiceType: json['invoice_type'],
      lang: json['lang'],
      lat: json['lat'],
      legalCompanyName: json['legal_company_name'],
      phone: json['phone'],
      rating: json['rating'],
      stateName: json['state_name'],
      updatedAt: json['updated_at'],
      updatedBy: json['updated_by'],
      websiteUrl: json['website_url'],
      zipcode: json['zipcode'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['abot_us_other'] = this.abotUsOther;
    data['about_us'] = this.aboutUs;
    data['address'] = this.address;
    data['address_line_2'] = this.addressLine2;
    data['assign_to'] = this.assignTo;
    data['city_name'] = this.cityName;
    data['company_logo'] = this.companyLogo;
    data['company_logo_url'] = this.companyLogoUrl;
    data['company_photo'] = this.companyPhoto;
    data['company_photo_url'] = this.companyPhotoUrl;
    data['contact_person_name'] = this.contactPersonName;
    data['delete_flag'] = this.deleteFlag;
    data['deleted_at'] = this.deletedAt;
    data['deleted_by'] = this.deletedBy;
    data['email'] = this.email;
    data['facility_type'] = this.facilityType;
    data['fax'] = this.fax;
    data['hospital_user_fk'] = this.hospitalUserFk;
    data['id'] = this.id;
    data['invoice_type'] = this.invoiceType;
    data['lang'] = this.lang;
    data['lat'] = this.lat;
    data['legal_company_name'] = this.legalCompanyName;
    data['phone'] = this.phone;
    data['rating'] = this.rating;
    data['state_name'] = this.stateName;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['website_url'] = this.websiteUrl;
    data['zipcode'] = this.zipcode;
    return data;
  }

}
