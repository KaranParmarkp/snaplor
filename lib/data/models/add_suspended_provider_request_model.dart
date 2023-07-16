
class AddSuspendedProviderRequestModel {
  String? providerId;
  String? type;
  String? fromDate;
  String? toDate;
  String? note;

  AddSuspendedProviderRequestModel({this.providerId, this.fromDate, this.note, this.toDate, this.type});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["provider_id"] = providerId;
    data["type"] = type;
    data["from_date"] = fromDate ?? "";
    data["to_date"] = toDate ?? "";
    data["note"] = note;
    return data;
  }

}
