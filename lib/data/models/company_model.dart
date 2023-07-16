class CompanyModel {
  int? pKey;
  bool isSelected;
  String? aboutUs;
  String? address_line_1;
  String? addressLine2;
  String? city;
  String? contactPersonName;
  String? email;
  String? companyName;
  int? facilityType;
  String? fax;
  int? id;
  String? latitude;
  String? logo;
  String? companyLogo;
  String? longitude;
  String? photo;
  String? photoUrl;
  String? state;
  String? telephone;
  String? updatedAt;
  String? website;
  String? zipcode;

  CompanyModel({
     this.pKey,
    this.isSelected = false,
     this.aboutUs,
     this.address_line_1,
     this.addressLine2,
     this.city,
     this.contactPersonName,
     this.email,
     this.companyName,
     this.facilityType,
     this.fax,
     this.id,
     this.latitude,
     this.logo,
     this.companyLogo,
     this.longitude,
     this.photo,
     this.photoUrl,
     this.state,
     this.telephone,
     this.updatedAt,
     this.website,
     this.zipcode,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      pKey: json['p_key'],
      isSelected: json['isSelected'] ?? false,
      aboutUs: json['about_us'] ?? null,
      address_line_1: json['address_line_1'],
      addressLine2: json['address_line_2'],
      city: json['city'],
      contactPersonName: json['contact_person_name'],
      email: json['email'],
      companyName: json['facility_name'],
      facilityType: json['facility_type'],
      fax: json['fax'],
      id: json['id'],
      latitude: json['latitude'],
      logo: json['logo'],
      companyLogo: json['logo_url'],
      longitude: json['longitude'],
      photo: json['photo'],
      photoUrl: json['photo_url'],
      state: json['state'],
      telephone: json['telephone'],
      updatedAt: json['updated_at'],
      website: json['website'],
      zipcode: json['zipcode'],
    );
  }
}
