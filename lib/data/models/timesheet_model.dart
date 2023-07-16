class TimeSheetDetailModel {
  dynamic idTitle;
  dynamic invoiceDateProviderPosition;
  dynamic dueShiftStartDate;
  dynamic outStandingDurationEndDate;
  dynamic amount;

  TimeSheetDetailModel({
    required this.idTitle,
    required this.invoiceDateProviderPosition,
    required this.dueShiftStartDate,
    required this.outStandingDurationEndDate,
    required this.amount,
  });

  factory TimeSheetDetailModel.fromJson(Map<String, dynamic> json) {
    return TimeSheetDetailModel(
      idTitle: json['invoice_id'] ?? json['job_title'] ?? json['title'],
      invoiceDateProviderPosition: json['incoice_date'] ?? json['provider'] ?? json['position'],
      dueShiftStartDate: json['due_date'] ?? json['shift_date'] ?? json['start_date'],
      outStandingDurationEndDate: json['oustanding_days'] ?? json['duration'] ?? json['end_date'],
      amount: json['amount'] ?? '',
    );
  }
}
