class DashBoardModel {
  int processShiftCount;
  int processBidsCount;
  int processCallOffCount;
  int todayTotalShiftCount;
  int tomorrowTotalShiftCount;
  int todayUnfilledShiftCount;
  int tomorrowUnfilledShiftCount;
  int todayFilledShiftCount;
  int tomorrowFilledShiftCount;
  int todayCompletedShiftCount;
  int tomorrowCompletedShiftCount;
  int todayOpenShiftCount;

  DashBoardModel({
    this.processShiftCount = 0,
    this.processBidsCount = 0,
    this.processCallOffCount = 0,
    this.todayTotalShiftCount = 0,
    this.tomorrowTotalShiftCount = 0,
    this.todayUnfilledShiftCount = 0,
    this.tomorrowUnfilledShiftCount = 0,
    this.todayFilledShiftCount = 0,
    this.tomorrowFilledShiftCount = 0,
    this.todayCompletedShiftCount = 0,
    this.tomorrowCompletedShiftCount = 0,
    this.todayOpenShiftCount = 0,
  });

  factory DashBoardModel.fromJson(Map<String, dynamic> json) {
    return DashBoardModel(
      processShiftCount: json['need_to_process_shifts_count'] ?? 0,
      processBidsCount: json['need_to_process_bids_count'] ?? 0,
      processCallOffCount: json['need_to_process_calloffs_count'] ?? 0,
      todayTotalShiftCount: json['total_shifts_of_today_count'] ?? 0,
      tomorrowTotalShiftCount: json['total_shifts_of_tomorrow_count'] ?? 0,
      todayUnfilledShiftCount: json['unfilled_shifts_of_today_count'] ?? 0,
      tomorrowUnfilledShiftCount: json['unfilled_shifts_of_tomorrow_count'] ?? 0,
      todayFilledShiftCount: json['filled_shifts_of_today_count'] ?? 0,
      tomorrowFilledShiftCount: json['filled_shifts_of_tomorrow_count'] ?? 0,
      todayCompletedShiftCount: json['completed_shifts_of_today_count'] ?? 0,
      tomorrowCompletedShiftCount: json['completed_shifts_of_tomorrow_count'] ?? 0,
      todayOpenShiftCount: json['open_shifts_of_today_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'need_to_process_shifts_count': processShiftCount,
      'need_to_process_bids_count': processBidsCount,
      'need_to_process_calloffs_count': processCallOffCount,
      'total_shifts_of_today_count': todayTotalShiftCount,
      'total_shifts_of_tomorrow_count': tomorrowTotalShiftCount,
      'unfilled_shifts_of_today_count': todayUnfilledShiftCount,
      'unfilled_shifts_of_tomorrow_count': tomorrowUnfilledShiftCount,
      'filled_shifts_of_today_count': todayFilledShiftCount,
      'filled_shifts_of_tomorrow_count': tomorrowFilledShiftCount,
      'completed_shifts_of_today_count': todayCompletedShiftCount,
      'completed_shifts_of_tomorrow_count': tomorrowCompletedShiftCount,
      'open_shifts_of_today_count': todayOpenShiftCount,
    };
  }
}
