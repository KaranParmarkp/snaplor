class ApiConfig {

  static const String baseUrl = "https://www.google.com/";
  static const String apiUrl = "${baseUrl}api/v8/";
  static const String providerBaseImageUrlDebug = "https://staging.quinable.com/";
  static const String providerBaseImageUrl = "https://login.quinable.com/";

  //Google place api key
  static const String googleApiKey = "google";

  // update below url when creating build for release
  static const String serviceAgreementUrl = providerBaseImageUrlDebug+"facility_agreement";
  static const String aboutUs = providerBaseImageUrlDebug+"about_us";
  static const String support = "https://support.quinable.com/hc/en-us/sections/1260801285850";
  static const String baseSupportRequest = "https://quinablefacility.zendesk.com/";

  // User Management
  static const String login = "login";
  static const String sendVerificationCode  = "verification_code/send";
  static const String sendVerificationCodeForgot  = "forgot_password_verification_code/send";
  static const String sendVerificationCodeVerify  = "verification_code/verify";
  static const String forgetPassword  = "forget_password";
  static const String register  = "register";
  static const String companyList  = "cadidate_facilities";
  static const String checkEmailOrMobile  = "check_email_or_mobile_available";
  static const String industryList  = "options";
  static const String getFacilityTypeByIndustry  = "facility_types";
  static const String timezones  = "timezones";
  static const String companyState  = "countries/231/states";


  // Dashboard api
  static const String creditProfile  = "credit-line-counter";
  static const String dashboard  = "dashboard";
  static const String outStanding  = "outstanding-invoices";
  static const String unInvoice  = "uninvoice-timesheets";
  static const String runningShift  = "running-shifts";
  static const String confirmShift  = "shift-to-be-work";

  // Shifts
  static const String shiftList  = "shifts";
  static const String todayTotalShifts  = "dashboard/total_shifts_of_today";
  static const String todayFilledShift  = "dashboard/filled_shifts_of_today";
  static const String todayMissedShift  = "dashboard/open_shifts_of_today";
  static const String todayCompletedShift  = "dashboard/completed_shifts_of_today";
  static const String tomorrowFilledShift  = "dashboard/filled_shifts_of_tomorrow";
  static const String tomorrowTotalShift  = "dashboard/total_shifts_of_tomorrow";
  static const String acceptBidList  = "dashboard/need_to_process_shifts";
  static const String approvedTimeList  = "dashboard/need_to_process_bids";
  static const String cancelShift  = "shifts/cancel/";
  static const String publishShift  = "shifts/publish";
  static const String unPublishShift  = "shifts/unpublish";
  static const String shiftOptions  = "shifts/options";
  static const String callOffs  = "dashboard/need_to_process_calloffs";

  // Providers
  static const String providerList  = "providers";
  static const String favProvider  = "favorite_providers";
  static const String providerListDetails  = "providers/";
  static const String favoriteProvidersList  = "facility_groups";
  static const String suspendedProvider  = "suspended_providers";
  static const String recommendedProvider  = "recommended_providers";

  // Bid
  static const String approveBid  = "timesheets/";
  static const String approveBidDetails  = "times/";
  static const String times  = "times?";
  static const String approveTimeNCNSStatus  = "bids/update_status_in_batch";
  static const String addTimePreview  = "timesheets/add-timesheet-manually-preview";
  static const String addTimeSubmit  = "timesheets/add-timesheet-manually";
  static const String updateApproveTime  = "/update-timesheet-manually";
}
