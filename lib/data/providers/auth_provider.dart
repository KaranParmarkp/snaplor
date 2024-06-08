import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/data/providers/base_provider.dart';
import 'package:jyotishee/presentation/screens/auth/login/login_screen.dart';
import 'package:jyotishee/presentation/screens/base/base_screen.dart';
import 'package:jyotishee/presentation/screens/chat/chat_screen.dart';
import 'package:jyotishee/presentation/screens/orders/orders_screen.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../app/utils/preferences/preferences.dart';
import '../../main.dart';
import '../sources/remote/network_services/api_service.dart';
import '../sources/remote/repositories/auth_repo/auth_repository.dart';
import '../sources/remote/repositories/auth_repo/auth_repository_impl.dart';

enum AuthStatus { authenticated, unAuthenticated }

class AuthProvider extends BaseProvider {
  late AuthRepository _authRepo;

  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  AuthStatus _authStatus = AuthStatus.unAuthenticated;

  AuthStatus get authStatus => _authStatus;
  IO.Socket? _socket;

  IO.Socket? get socket => _socket;
  WaitListModel? _currentChat;

  WaitListModel? get currentChat => _currentChat;

  AuthProvider.initialize() {
    _authRepo = AuthRepositoryImpl();
    checkUserIsLoggedIn();
  }

  initSocket() async {
    String? token = await ApiService.getToken();
    print("socket token ${token}");
    disposeSocket();
    _socket = IO.io(
      ApiConfig.baseUrlSocket,
      //"https://api.snaplor.com:3000",
      IO.OptionBuilder().setTransports(['websocket']).setExtraHeaders(
          {'Authorization': 'Bearer $token'}).build(),
    );
    _socket?.connect();
    _socket?.onConnect((_) {
      'connected to websocket'.printDebug;
      getChatStatus();
      onGoingChat();

      /// call in home bottom nav tap onGoingChat();
    });
    _socket?.onConnectError((m) {
      print(' websocket Error');
      _socket?.disconnect();
      initSocket();
      print(m);
    });
    _socket?.onError((m) {
      print(' websocket on  Error');
      print(m);
    });
    notifyListeners();
  }

  disposeSocket() {
    if (_socket.isNotNull) _socket?.disconnect();
    if (_socket.isNotNull) _socket?.dispose();
  }

  checkUserIsLoggedIn() async {
    String? encodedMap = await preference.getData(PreferenceKeys.appPrefName);
    if (encodedMap == null) {
      _authStatus = AuthStatus.unAuthenticated;
      notifyListeners();
    } else {
      _authStatus = AuthStatus.authenticated;
      notifyListeners();
      loadUserData();
    }
  }

  loadUserData() async {
    String? encodedMap = await preference.getData(PreferenceKeys.appPrefName);
    if (encodedMap != null) {
      _userModel = UserModel.fromJson(jsonDecode(encodedMap));
    }
    notifyListeners();
  }

  saveDataToLocally(UserModel user) async {
    preference.removeString(PreferenceKeys.appPrefName);
    String encodedMap = json.encode(user.toJson());
    await preference.setString(PreferenceKeys.appPrefName, encodedMap);
  }

  logout() async {
    fcmSave(logout: true);
    disposeSocket();
    _authStatus = AuthStatus.unAuthenticated;
    preference.clearPref();
    notifyListeners();
    MyApp.navKey.currentContext!.pushRemoveUntil(LoginScreen());
  }

  // Login API
  Future<bool?> login({required String phone}) async {
    AppHelper.showLoading();
    try {
      GenericResponse response = await _authRepo.login(phone);
      AppHelper.hideLoading();
      return response.code;
    } catch (e, s) {
      AppHelper.hideLoading();
      AppHelper.showToast(
        message: e.toString(),
      );
      e.printDebug;
      s.printDebug;
    }
    return null;
  }

  // Verify code  API
  verificationVerify({required String mobile, required String code}) async {
    AppHelper.showLoading();
    try {
      UserModel? model = await _authRepo.verificationVerify(mobile, code);
      AppHelper.showToast(message: "Login Successfully");
      _authStatus = AuthStatus.authenticated;
      _userModel = model;
      notifyListeners();
      await saveDataToLocally(model);
      loadUserData();
      AppHelper.hideLoading();
      MyApp.navKey.currentContext!.pushRemoveUntil(BaseScreen());
      notifyListeners();
    } catch (e, s) {
      AppHelper.hideLoading();
      AppHelper.showToast(
        message: e.toString(),
      );
      e.printDebug;
      s.printDebug;
    }
  }

  // User home api
  static String userDataKey = 'userDataDetailsKey';

  Future<bool?> userData({bool refresh = false, UserModel? updateModel}) async {
    onGoingChat();
    setLoading(taskName: userDataKey, showDialogLoader: refresh);
    try {
      UserModel model = await _authRepo.userData(updateModel);
      final modelNew = model.copyWith(accessToken: _userModel?.accessToken);
      _userModel = modelNew;
      notifyListeners();
      setData(taskName: userDataKey, data: userModel);
      return true;
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(
          taskName: userDataKey, errorMessage: e.toString(), showToast: true);
    }
    return null;
  }

  // Offer list api
  static String offerListKey = 'offerListKey';

  offerList() async {
    setLoading(taskName: offerListKey);
    try {
      setData(taskName: offerListKey, data: await _authRepo.offerList());
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(
        taskName: offerListKey,
        errorMessage: e.toString(),
      );
    }
  }

  // Order list api
  static String orderListKey = 'orderListKey';

  orderList(ComType type) async {
    setLoading(taskName: orderListKey);
    try {
      setData(taskName: orderListKey, data: await _authRepo.orderList(type));
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(
        taskName: orderListKey,
        errorMessage: e.toString(),
      );
    }
  }

  // Delete Review api
  static String refundAmountKey = 'refundAmountKey';

  refundAmount({required String id}) async {
    setLoading(taskName: refundAmountKey, showDialogLoader: true);
    try {
      setData(
          taskName: refundAmountKey,
          data: await _authRepo.refundAmount(id),
          hideLoader: true);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(
          taskName: refundAmountKey,
          errorMessage: e.toString(),
          showToast: true);
    }
  }

  // Reviews list api
  static String reviewListKey = 'reviewListKey';
  reviewList() async {
    setLoading(taskName: reviewListKey);
    try {
      setData(taskName: reviewListKey, data: await _authRepo.reviewList());
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(
        taskName: reviewListKey,
        errorMessage: e.toString(),
      );
    }
  }
  updateReviewTextField(){
    notify();
  }
  // Add Review api
  static String addReviewKey = 'addReviewKey';

  addReview({required String id, required String message}) async {
    setLoading(taskName: addReviewKey, showDialogLoader: true);
    try {
      setData(
          taskName: addReviewKey,
          data: await _authRepo.addReview(id, message),
          hideLoader: true);
      reviewList();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(
        taskName: addReviewKey,
        errorMessage: e.toString(),
      );
    }
  }

  // Delete Review api
  static String deleteReviewKey = 'deleteReviewKey';

  deleteReview({required String id}) async {
    setLoading(taskName: deleteReviewKey, showDialogLoader: true);
    try {
      setData(
          taskName: deleteReviewKey,
          data: await _authRepo.deleteReview(id),
          hideLoader: true);
      reviewList();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(
          taskName: deleteReviewKey,
          errorMessage: e.toString(),
          showToast: true);
    }
  }

  // Ask Review api
  static String askReviewKey = 'askReviewKey';

  askReview({required String id, required ComType type}) async {
    setLoading(taskName: askReviewKey, showDialogLoader: true);
    try {
      setData(
        taskName: askReviewKey,
        data: await _authRepo.askReview(id),
        hideLoader: true,
        onSuccess: (data) {
          orderList(type);
        },
      );
      reviewList();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(
          taskName: askReviewKey, errorMessage: e.toString(), showToast: true);
    }
  }

  // WaitList list api
  static String waitListKey = 'waitListKey';

  waitList(ComType type) async {
    setLoading(taskName: waitListKey);
    try {
      setData(
        taskName: waitListKey,
        data: await _authRepo.waitList(type),
        onSuccess: (data) {
          /*List<WaitListModel> list = data ;
        if(list.isNotEmpty){
          _currentChat = list.first;
        }else{
          _currentChat=null;
        }
        notifyListeners();*/
        },
      );
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(
        taskName: waitListKey,
        errorMessage: e.toString(),
      );
    }
  }

  // On Going Chat api
  static String onGoingChatKey = 'onGoingChatKey';
  onGoingChat() async {
    try {
      _currentChat = await _authRepo.onGoingChat();
      notifyListeners();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      onGoingCall();
    }
  }

  // On Going Call api
  static String onGoingCallKey = 'onGoingCallKey';
  onGoingCall() async {
    try {
      _currentChat = await _authRepo.onGoingCall();
      _currentChat?.type=ComType.call;
      notifyListeners();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
    }
  }

  // Wallet list api
  static String walletKey = 'walletKey';

  wallet() async {
    setLoading(taskName: walletKey);
    try {
      setData(taskName: walletKey, data: await _authRepo.wallet());
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(
        taskName: walletKey,
        errorMessage: e.toString(),
      );
    }
  }

  // Wallet list api
  static String searchProductKey = 'searchProductKey';

  searchProduct({required FilterModel filterModel}) async {
    setLoading(taskName: searchProductKey);
    try {
      setData(
          taskName: searchProductKey,
          data: await _authRepo.searchProduct(filterModel));
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(
        taskName: searchProductKey,
        errorMessage: e.toString(),
      );
    }
  }

  // Accept Request api
  static String acceptRequestKey = 'acceptCallChatKey';

  acceptRequest({required ComType type, required WaitListModel model}) async {
    setLoading(taskName: acceptRequestKey, showDialogLoader: true);
    try {
      setData(
        taskName: acceptRequestKey,
        data: await _authRepo.acceptRequest(type, model.id!),
        onSuccess: (data) {
          WaitListModel model =
              WaitListModel.fromJson(data.data as Map<String, dynamic>);
          _currentChat = model;
          notifyListeners();
        },
      );

      /*MyApp.appContext.push(ChatScreen(
        model: model,
      ));*/
      //waitList(type);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(
          taskName: acceptRequestKey,
          errorMessage: e.toString(),
          showToast: true);
    }
  }

  // Cancel request api
  static String cancelRequestKey = 'cancelRequestChatKey';

  cancelRequest({required ComType type, required String id}) async {
    setLoading(taskName: cancelRequestKey, showDialogLoader: true);
    try {
      setData(
          taskName: cancelRequestKey,
          data: await _authRepo.cancelRequest(type, id));
      if (_currentChat?.id == id) {
        _currentChat = null;
        notifyListeners();
      }
      waitList(type);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(
          taskName: cancelRequestKey,
          errorMessage: e.toString(),
          showToast: true);
    }
  }

  // Get Messages api
  static String getMessagesKey = 'getMessagesChatKey';

  List<MessageModel> get currentChatMessageList => data[getMessagesKey] ?? [];

  getMessages({required String id}) async {
    setLoading(taskName: getMessagesKey, showDialogLoader: true);
    try {
      setData(taskName: getMessagesKey, data: await _authRepo.getMessages(id));
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(
          taskName: getMessagesKey,
          errorMessage: e.toString(),
          showToast: true);
    }
  }

  updateCurrentChatModel(WaitListModel? model) {
    _currentChat = model;
    if(model.isNotNull){
      scrollCurrentChat();
    }
    else waitList(ComType.chat);
    notifyListeners();
  }

  scrollCurrentChat(){
    _currentChat!.controller.animateTo(
      _currentChat!.controller.position.maxScrollExtent + 50,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
    seenUserMessages();
  }

  getChatStatus() {
    _socket?.on(ApiConfig.callStatus, (response) {
      "CallStatus".printDebug;
      Map<dynamic,dynamic> message = response is List ? response.first : response;
      response.toString().printDebug;
      if(message["status"]=="completed"){
        updateCurrentChatModel(null);
        MyApp.navKey.currentState!.context.push(OrdersScreen(initialIndex: 1,));
      }
      onGoingChat();

    });
    _socket?.on(ApiConfig.chatStatus, (response) {
      "ChatStatus".printDebug;
      Map<dynamic,dynamic> message = response is List ? response.first : response;
      message.toString().printDebug;
      if(_currentChat.isNull)onGoingChat();
      if (message != null && message['status'] == ApiConfig.chatCompleted) {
        _currentChat = null;
        MyApp.appContext.pushReplace(OrdersScreen());
        notifyListeners();
      }
      if (message != null && message['status'] == ApiConfig.chatInitiated) {
        if (message.containsKey("chat_request")) {
          WaitListModel model = WaitListModel.fromJson(
              message['chat_request'] as Map<String, dynamic>);
          if (_currentChat == null) {
            _currentChat = model;
            _currentChat?.fromInitiated = true;
            notifyListeners();
            userData();
          }
        }
      }
      if (message != null && message['status'] == ApiConfig.chatAcceptedByCustomer) {
        if (message.containsKey("chat_request")) {
          WaitListModel model = WaitListModel.fromJson(message['chat_request'] as Map<String, dynamic>);
          _currentChat = model;
          _currentChat?.fromInitiated = false;
          notifyListeners();
          MyApp.navKey.currentState!.context.push(ChatScreen(model: _currentChat,));
        }
      }
      if (message != null && message['status'] == ApiConfig.cancelled) {
        updateCurrentChatModel(null);
      }
    });
    _socket?.on(ApiConfig.typingMessage, (message) {
      //"UserTypingMessage ${message.toString()}".printDebug;
      if(_currentChat.isNotNull){
        _currentChat!.isTyping=true;
        notifyListeners();
        Future.delayed(Duration(seconds: 2,),() {
          _currentChat!.isTyping=false;
          notifyListeners();
        },);
      }
    });
    _socket?.on(ApiConfig.messageStatus, (response) async {
      Map<String,dynamic> message = response.first;
      "\nMessageStatus response---> ${message.toString()}".printDebug;
      if(_currentChat.isNotNull && message != null && message.containsKey("chat_message")){
        MessageModel model = MessageModel.fromJson(message["chat_message"] as Map<String, dynamic>);
        var index = await currentChatMessageList.indexWhere((element) => element.id==model.id);
        if(index!=-1){
          print("updating response ${index} and ${currentChatMessageList.length}");
          currentChatMessageList[index] = model;
          if(index==currentChatMessageList.length-1 && model.isSeen.isTrue){
            print("updating all element");
            currentChatMessageList.forEach((element) {element.isDelivered=true;element.isSeen=true;notifyListeners();});
          }
          notifyListeners();
        }
      }
    });
    _socket?.on(ApiConfig.seenMessage, (message) {
      "\nSeenMessageStatus response--->${message.toString()}".printDebug;
      if(_currentChat.isNotNull){
      }
    });
    _socket?.on(ApiConfig.privateMessage, (response) {
      Map<String,dynamic> message = response is List ? response.first : response;
      "Private Message---> ${message.toString()}".printDebug;
      if (message != null && currentChatMessageList.any((element) => element.id != message["_id"])) {
        data[getMessagesKey].add(MessageModel.fromJson(message as Map<String, dynamic>));
        currentChatMessageList.forEach((element) {element.isSeen=true;notifyListeners();});
        ///sending message to backend that i received this message
        _socket?.emitWithAck(ApiConfig.receivedMessage, {
          "message_id" : message["_id"]
        }, ack: (response) {
          print("-----------${response}");
        });
        notify();
      }
      if(_currentChat.isNotNull) {
        _currentChat!.controller.animateTo(
          _currentChat!.controller.position.maxScrollExtent + 50,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
        //currentChatMessageList.forEach((element) {element.isSeen=true;notifyListeners();});
              }
      notify();

    });
    notifyListeners();
  }

  seenUserMessages(){
    Map request = {
      "message_id": currentChatMessageList.last.id
    };
    _socket?.emitWithAck(ApiConfig.seenMessage, request, ack: (response) {
      "sending seen message to backend--->${response}".printDebug;
    });

  }
  sendMessage(
      {required String chatId,
      required String recipientId,
        String? message,File? file,String? messageId,String? type}) async {
    var signedUrl;
    if(file.isNotNull){
      AppHelper.showLoading();
       signedUrl = await getSignedUrl(isProfile: false, image: file!);
      AppHelper.hideLoading();
    }
    Map request = {
      "chat_id": chatId,
      "recipient_id": recipientId,
      if(message.isNotNull)"message": message,
      if(file.isNotNull)"attachments":[{"type":type,"url":signedUrl}],
      if(messageId.isNotNull)"original_message":messageId
    };
    _socket?.emitWithAck(ApiConfig.privateMessage, request, ack: (response) {
      "\nsend message response--->${response.toString()}".printDebug;
      if (response != null && response["data"] != null) {
        data[getMessagesKey].add(MessageModel.fromJson(response["data"] as Map<String, dynamic>));
        notify();
        scrollCurrentChat();
      }
    });
  }

  typingMessage({required String recipientId,}) {
    Map request = {
      "recipient_id": recipientId,
    };
    _socket?.emitWithAck(ApiConfig.typingMessage, request, ack: (response) {
      //"response from typingMessage ${response}".printDebug;
    });
  }

  // end request api
  static String endChatKey = 'endChatChatKey';

  endChat({required String id}) async {
    setLoading(taskName: endChatKey, showDialogLoader: true);
    try {
      setData(taskName: endChatKey, data: await _authRepo.endChat(id));
      _currentChat = null;
      MyApp.appContext.pushReplace(OrdersScreen());
      //MyApp.appContext.pushRemoveUntil(BaseScreen());
      notifyListeners();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(
          taskName: endChatKey, errorMessage: e.toString(), showToast: true);
    }
  }

  // Offer status change
  static String offerStatusChangeKey = 'offerStatusChangeKey';

  offerStatusChange({required String id, required bool activate}) async {
    setLoading(taskName: offerStatusChangeKey, showDialogLoader: true);
    try {
      setData(
          taskName: offerStatusChangeKey,
          data: await _authRepo.offerStatus(id, activate),
          hideLoader: true);
      offerList();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(
        taskName: offerStatusChangeKey,
        errorMessage: e.toString(),
      );
    }
  }

  int _callChatCount = 0;

  int get callChatCount => _callChatCount;
  static String callChatCountKey = 'callChatCountChatKey';

  getCallChatCount() async {
    _callChatCount = 0;
    notifyListeners();
    try {
      final callCount = await _authRepo.callCount();
      final chatCount = await _authRepo.chatCount();
      if (callCount.data > 0 || chatCount.data > 0) {
        _callChatCount = 1;
      }
      notifyListeners();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(
          taskName: callChatCountKey,
          errorMessage: e.toString(),
          showToast: false);
    }
  }

  // FCM api
  fcmSave({bool logout = false}) async {
    try {
      if(logout){
        await _authRepo.logout();

      }else {
        await _authRepo.fcmSave();
      }
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
    }
  }

  // Notification list api
  static String notificationListKey = 'notificationListKey';
  notificationList() async {
    setLoading(taskName: notificationListKey);
    try {
      setData(taskName: notificationListKey, data: await _authRepo.notificationList());
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(
        taskName: notificationListKey,
        errorMessage: e.toString(),
      );
    }
  }

  // Notification Count api
  static String notificationCountKey = 'notificationCountKey';
  notificationCount() async {
    setLoading(taskName: notificationCountKey);
    try {
      setData(taskName: notificationCountKey, data: await _authRepo.notificationCount());
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(
        taskName: notificationCountKey,
        errorMessage: e.toString(),
      );
    }
  }

  // Notification Read api
  static String notificationReadKey = 'notificationReadKey';
  notificationRead({required String id,Function()? onSuccess}) async {
    setLoading(taskName: notificationReadKey,showDialogLoader: true);
    try {
      setData(taskName: notificationReadKey, data: await _authRepo.notificationRead(id),onSuccess: (data) => onSuccess?.call(),hideLoader: true);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(
        taskName: notificationReadKey,
        errorMessage: e.toString(),
      );
    }
  }

}
