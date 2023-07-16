class CreditAvailableModel {
  String creditAmount;
  String creditConfigFlag;
  double? creditLeft;
  String creditSpend;
  int gracePeriod;
  String outstandingInvoiceTotal;
  String paymentOverdueTotal;
  String pendingTimesheetTotal;
  String quickShiftFlag;
  String remainingCreditPercentage;
  String runningShiftTotal;
  String shiftToBeWork;
  String spendingPowerMessage;

  CreditAvailableModel({
    required this.creditAmount,
    required this.creditConfigFlag,
    this.creditLeft = 0.0,
    required this.creditSpend,
    required this.gracePeriod,
    required this.outstandingInvoiceTotal,
    required this.paymentOverdueTotal,
    required this.pendingTimesheetTotal,
    required this.quickShiftFlag,
    required this.remainingCreditPercentage,
    required this.runningShiftTotal,
    required this.shiftToBeWork,
    required this.spendingPowerMessage,
  });

  factory CreditAvailableModel.fromJson(Map<String, dynamic> json) {
    return CreditAvailableModel(
      creditAmount: json['credit_amount'],
      creditConfigFlag: json['credit_config_flag'],
      creditLeft: json['credit_left']!=null ? double.parse(json['credit_left'].toString()):0.0,
      creditSpend: json['credit_spend'],
      gracePeriod: json['grace_period'],
      outstandingInvoiceTotal: json['outstanding_invoice_total'],
      paymentOverdueTotal: json['payment_overdue_total'],
      pendingTimesheetTotal: json['pending_timesheet_total'],
      quickShiftFlag: json['quick_shift_flag'],
      remainingCreditPercentage: json['remaining_credit_percentage'],
      runningShiftTotal: json['running_shift_total'],
      shiftToBeWork: json['shift_to_be_work'],
      spendingPowerMessage: json['spending_power_message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'credit_amount': creditAmount,
      'credit_config_flag': creditConfigFlag,
      'credit_left': creditLeft,
      'credit_spend': creditSpend,
      'grace_period': gracePeriod,
      'outstanding_invoice_total': outstandingInvoiceTotal,
      'payment_overdue_total': paymentOverdueTotal,
      'pending_timesheet_total': pendingTimesheetTotal,
      'quick_shift_flag': quickShiftFlag,
      'remaining_credit_percentage': remainingCreditPercentage,
      'running_shift_total': runningShiftTotal,
      'shift_to_be_work': shiftToBeWork,
      'spending_power_message': spendingPowerMessage,
    };
  }
}
