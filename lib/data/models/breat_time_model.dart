import '../../app/utils/utils.dart';

class BreakTimeModel {
  String id;
  String breakStartTime;
  String breakStopTime;
  String totalBreakTime;
  int position;
  String action;

  BreakTimeModel({
    required this.id,
    required this.breakStartTime,
    required this.breakStopTime,
    required this.totalBreakTime,
    this.position = -1,
    this.action = "create",
  });
}
class BreakAddTimeModel {
  String breakStartDatetime;
  String breakEndDatetime;

  BreakAddTimeModel({
    required this.breakStartDatetime,
    required this.breakEndDatetime,
  });

  factory BreakAddTimeModel.fromJson(Map<String, dynamic> json) {
    return BreakAddTimeModel(
      breakStartDatetime: json['break_start_datetime'],
      breakEndDatetime: json['break_end_datetime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'break_start_datetime': DateTimeHelper.stringToDateTimeYYYMMDD(DateTimeHelper.stringToDateTimeMMDDYYYHHMMA(breakStartDatetime).toString()),
      'break_end_datetime': DateTimeHelper.stringToDateTimeYYYMMDD(DateTimeHelper.stringToDateTimeMMDDYYYHHMMA(breakEndDatetime).toString()),
    };
  }
}

class BreakList {
  List<BreakAddTimeModel> list;

  BreakList({required this.list});

  factory BreakList.fromJson(Map<String, dynamic> json) {
    final breakTimes = json['break_times'] as List<dynamic>;
    final list = breakTimes
        .map((breakTime) => BreakAddTimeModel.fromJson(breakTime))
        .toList();

    return BreakList(list: list);
  }

  Map<String, dynamic> toJson() {
    final breakTimes = list.map((breakTime) => breakTime.toJson()).toList();

    return {
      'break_times': breakTimes,
    };
  }
}
