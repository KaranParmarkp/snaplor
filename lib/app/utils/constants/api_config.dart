class ApiConfig {

  static const String baseUrl = "http://api.jyotishee.com/";
  static const String baseUrlSocket = "http://api.jyotishee.com:3000";
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
  static const String chatWaitingList = "chats/requests";
  static const String wallet = "payments/astrologer/wallet/history";
  static const String notificationList = "notifications";
  static const String acceptCallRequest = "call/accept/";
  static const String acceptChatRequest = "chats/accept-astrologer/";
  static const String cancelChatRequest = "chats/cancel-request/";
  static const String cancelCallRequest = "call/cancel/";
  static const String getMessages = "chats/";
  static const String endChat = "chats/complete-customer-astrologer/";

  // Social
  static const String addPost = "posts";
  static const String myPost = "posts/astrologers";


}
