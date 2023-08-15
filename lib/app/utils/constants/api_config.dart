class ApiConfig {

  static const String baseUrl = "http://api.jyotishee.com/";
  static const String baseUrlSocket = "ws://api.jyotishee.com:3000/";
  static const String apiUrl = "${baseUrl}api/";

  // User Management
  static const String login = "astrologers/login";
  static const String verifyOtp = "astrologers/verify-otp";
  static const String userData = "astrologers/me";

  static const String offersList = "offers/astrologers";
  static const String ordersList = "orders";
  static const String productsList = "products";
  static const String amountRefund = "payments/wallet/refund/";
  static const String reviewList = "reviews/";
  static const String callWaitingList = "call/waiting-list";
  static const String chatWaitingList = "chat/requests";
  static const String wallet = "payments/astrologer/wallet/history";
  static const String notificationList = "notifications";

  // Social
  static const String addPost = "posts";

}
