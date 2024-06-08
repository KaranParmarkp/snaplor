class ApiConfig {

  static const String baseUrl = "https://api.snaplor.com/";
  static const String baseUrlSocket = "https://api.snaplor.com";
  static const String apiUrl = "${baseUrl}api/";

  // User Management
  static const String login = "astrologers/login";
  static const String verifyOtp = "astrologers/verify-otp";
  static const String userData = "astrologers/me";
  static const String fcmSave = "fcm-notifications";
  static const String logout = "astrologers/logout";

  static const String offersList = "astrologer-offers/astrologers";
  static const String ordersList = "astrologer-orders";
  static const String productsList = "products";
  static const String amountRefund = "payments/wallet/refund/";
  static const String reviewList = "astrologer-reviews/";
  static const String chatWaitingList = "chats/requests";
  static const String callWaitingList = "call/requests";
  static const String wallet = "payments/astrologer/wallet/history";
  static const String notificationList = "notifications";
  static const String notificationCount = "notifications/count";
  static const String notificationRead = "notifications";
  static const String acceptCallRequest = "call/accept/";
  static const String acceptChatRequest = "chats/accept-astrologer/";
  static const String cancelChatRequest = "chats/cancel-request/";
  static const String cancelCallRequest = "call/cancel/";
  static const String getMessages = "chats/";
  static const String endChat = "chats/complete-customer-astrologer/";
  static const String onGoingChat = "chats/on-going";
  static const String onGoingCall = "call/on-going";
  static const String upload = "s3/pre-signed-url?key=astrologers/";
  static const String callCount = "call/count";
  static const String chatCount = "chat/count";
  static const String askReview = "astrologer-reviews/";

  // Social
  static const String addPost = "posts";
  static const String myPost = "posts/astrologers";
  static const String userPost = "posts?user_slug=";
  static const String comment = "posts/comments/";
  static const String deletePost = "posts/deletepost/";
  static const String deleteComment = "posts/deletecomment/";
  static const String whoToFollow = "astrologers/follow";
  static const String followUnFollow = "followers";

  // Socket
  static const String chatStatus = "chatStatus";
  static const String callStatus = "callStatus";
  static const String privateMessage = "privateMessage";
  static const String typingMessage = "typingMessage";
  static const String seenMessage = "seenMessage";
  static const String receivedMessage = "receivedMessage";
  static const String messageStatus = "messageStatus";
  static const String chatInitiated = "requested";
  static const String chatAcceptedByCustomer = "in-progress";
  static const String chatAcceptedByAstro = "in-progress";
  static const String chatCompleted = "completed";
  static const String cancelled = "cancelled";

  //Follow
  static const String followers = "followers/follower/";
  static const String followings = "followers/following/";

  static const String userDetails = "users/slug/";

}


