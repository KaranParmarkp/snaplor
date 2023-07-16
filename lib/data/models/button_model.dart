
class ButtonModel {
  int id;
  String value;
  int? favCount;

  ButtonModel({
    required this.id,
    this.value = '',
    this.favCount
  });

  factory ButtonModel.fromJson(Map<String, dynamic> json) {
    return ButtonModel(
      id: json['id'],
      value: json['value'] ?? json['timezone'] ?? json['name'] ?? "",
      favCount: json['member_count'] ?? 0,
    );
  }

}
