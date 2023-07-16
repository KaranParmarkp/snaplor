class PreviewModel {
  final String breakTime;
  final dynamic extendTime;
  final String finalTime;
  final String totalTime;
  final int unpaidBreak;

  PreviewModel({
    required this.breakTime,
    required this.extendTime,
    required this.finalTime,
    required this.totalTime,
    required this.unpaidBreak,
  });

  factory PreviewModel.fromJson(Map<String, dynamic> json) {
    return PreviewModel(
      breakTime: json['break_time'],
      extendTime: json['extend_time'],
      finalTime: json['final_time'],
      totalTime: json['total_time'],
      unpaidBreak: json['unpaid_break'],
    );
  }
}
