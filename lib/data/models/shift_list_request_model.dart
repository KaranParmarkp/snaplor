import '../../app/utils/utils.dart';

class ShiftListRequestModel {
  String? title;
  String? keyword;
  String? locationId;
  List<String>? statusArray;
  ShiftsTypes shiftsType;
  ShiftListRequestModel({this.title,this.keyword,this.locationId,this.statusArray,required this.shiftsType});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(title.isNotNull)data['title'] = title ?? "";
    if(keyword.isNotNull)data['keyword'] = keyword ?? "";
    if(locationId.isNotNull)data['location_id'] = locationId ?? "";
    if(statusArray.isNotNull && statusArray!=[])data['status_array[]'] = statusArray ?? "";
    return data;
  }
}