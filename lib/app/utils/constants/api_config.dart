class ApiConfig {

  static const String baseUrl = "http://api.jyotishee.com/";
  static const String baseUrlSocket = "ws://api.jyotishee.com:3000/";
  static const String apiUrl = "${baseUrl}api/";

  // User Management
  static const String login = "astrologers/login";
  static const String verifyOtp = "astrologers/verify-otp";
  static const String userData = "astrologers/me";

  static const String offersList = "offers/astrologers";

}
