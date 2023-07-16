import 'package:jyotishee/app/utils/datetime_helper.dart';

import 'models.dart';

class AddTimePreviewRequestModel {
  BreakList? breakTimes;
  DateTime? clockOutTime;
  DateTime? clockInTime;
  String? manualUpdateResponse;
  String? providerUserId;
  String? shiftId;
  String? bidRate;

  AddTimePreviewRequestModel({
    this.breakTimes,
    this.clockInTime,
    this.clockOutTime,
    this.bidRate,
    this.manualUpdateResponse,
    this.providerUserId,
    this.shiftId
});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["end_datetime"] = DateTimeHelper.stringToDateTimeYYYMMDD(clockOutTime.toString());
    data["reason"] = manualUpdateResponse;
    data["provider_user_id"] = providerUserId ?? "";
    data["shift_id"] = shiftId;
    data["start_datetime"] = DateTimeHelper.stringToDateTimeYYYMMDD(clockInTime.toString());
    data["bid_rate"] = bidRate;
    return data;
  }
  Map<String, dynamic> toJsonUpdate() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["end_datetime"] = DateTimeHelper.stringToDateTimeYYYMMDD(clockOutTime.toString());
    data["reason"] = manualUpdateResponse;
    data["start_datetime"] = DateTimeHelper.stringToDateTimeYYYMMDD(clockInTime.toString());
    return data;
  }

}