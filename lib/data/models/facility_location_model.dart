class FacilityLocation {
  int accountId;
  String additionalInstruction;
  String address;
  dynamic address2;
  String cityName;
  String contactPersonName;
  String deleteFlag;
  String description;
  String email;
  int facilityType;
  int hospitalUserId;
  int id;
  String? image;
  String imageUrl;
  String lat;
  String long;
  String name;
  String nickname;
  String phone;
  String stateName;
  dynamic streetName;
  String timezone;
  String zipcode;

  FacilityLocation({
    required this.accountId,
    required this.additionalInstruction,
    required this.address,
    this.address2,
    required this.cityName,
    required this.contactPersonName,
    required this.deleteFlag,
    required this.description,
    required this.email,
    required this.facilityType,
    required this.hospitalUserId,
    required this.id,
     this.image,
    required this.imageUrl,
    required this.lat,
    required this.long,
    required this.name,
    required this.nickname,
    required this.phone,
    required this.stateName,
    this.streetName,
    required this.timezone,
    required this.zipcode,
  });

  factory FacilityLocation.fromJson(Map<String, dynamic> json) {
    return FacilityLocation(
      accountId: json['account_id'],
      additionalInstruction: json['additional_instruction'] ?? '',
      address: json['address'],
      address2: json['address2'],
      cityName: json['city_name'],
      contactPersonName: json['contact_person_name'],
      deleteFlag: json['delete_flag'],
      description: json['description'],
      email: json['email'],
      facilityType: json['facility_type'],
      hospitalUserId: json['hospital_user_id'],
      id: json['id'],
      image: json['image'],
      imageUrl: json['image_url'],
      lat: json['lat'],
      long: json['long'],
      name: json['name'],
      nickname: json['nickname'],
      phone: json['phone'],
      stateName: json['state_name'],
      streetName: json['street_name'],
      timezone: json['timezone'],
      zipcode: json['zipcode'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id'] = this.accountId;
    data['additional_instruction'] = this.additionalInstruction;
    data['address'] = this.address;
    data['address2'] = this.address2;
    data['city_name'] = this.cityName;
    data['contact_person_name'] = this.contactPersonName;
    data['delete_flag'] = this.deleteFlag;
    data['description'] = this.description;
    data['email'] = this.email;
    data['facility_type'] = this.facilityType;
    data['hospital_user_id'] = this.hospitalUserId;
    data['id'] = this.id;
    data['image'] = this.image;
    data['image_url'] = this.imageUrl;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['name'] = this.name;
    data['nickname'] = this.nickname;
    data['phone'] = this.phone;
    data['state_name'] = this.stateName;
    data['street_name'] = this.streetName;
    data['timezone'] = this.timezone;
    data['zipcode'] = this.zipcode;
    return data;
  }

}
