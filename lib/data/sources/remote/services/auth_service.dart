import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/main.dart';

import '../../../providers/providers.dart';
import '../network_services/api_service.dart';

class AuthService extends ApiService {
  Future<Response<GenericResponse>> login(String phone) async {
    return postData(ApiConfig.login, data: {"phone": phone});
  }

  Future<Response<GenericResponse>> verificationVerify(
      String mobile, String code) async {
    return postData(ApiConfig.verifyOtp, data: {"phone": mobile, "code": code});
  }

  Future<Response<GenericResponse>> fcmSave() async {
    String? token = await FirebaseMessaging.instance.getToken();
    log(token.toString(), name: "FCM Token");
    return postData(ApiConfig.fcmSave, data: {"token": token, "type": Platform.isAndroid ? "android" : "ios"});
  }

  Future<Response<GenericResponse>> logout() async {
    await putData(ApiConfig.logout);
    return deleteData(ApiConfig.fcmSave,);
  }


  Future<Response<GenericResponse>> userData(UserModel? model) async {
    return model != null
        ? putData(ApiConfig.userData, data: model.toJsonUpdateProfile())
        : getData(
            ApiConfig.userData,
          );
  }

  Future<Response<GenericResponse>> offerList() async {
    return getData(
      ApiConfig.offersList,
    );
  }
  Future<Response<GenericResponse>> offerStatus(String id,bool activate) async {
    return putData(
      ApiConfig.offersList+"/"+id+"/${activate ? "activate" : "deactivate"}",
    );
  }

  Future<Response<GenericResponse>> orderList(ComType type) async {
    String url = '''?filter={"order_source": "${type.name}"}&limit=10&skip=0''';
    return getData(
      ApiConfig.ordersList + url,
    );
  }

  Future<Response<GenericResponse>> refundAmount(String id) async {
    return putData(
      ApiConfig.amountRefund + id.toString(),
    );
  }

  Future<Response<GenericResponse>> reviewList() async {
    return getData(
      ApiConfig.reviewList +
          MyApp.appContext.read<AuthProvider>().userModel!.id +
          "/list",
    );
  }

  Future<Response<GenericResponse>> addReview(String id, String message) async {
    return putData(ApiConfig.reviewList+"response/" + id, data: {"message": message});
  }

  Future<Response<GenericResponse>> hideReview(String id) async {
    return putData(ApiConfig.reviewList + id+"/status/hide");
  }
  Future<Response<GenericResponse>> askReview(String id) async {
    return putData(ApiConfig.askReview+id+"/ask");
  }

  Future<Response<GenericResponse>> waitList(ComType type) async {
    return getData(type == ComType.chat
        ? ApiConfig.chatWaitingList
        : ApiConfig.callWaitingList);
  }

  Future<Response<GenericResponse>> wallet() async {
    return getData(ApiConfig.wallet);
  }

  Future<Response<GenericResponse>> notificationCount() async {
    return getData(ApiConfig.notificationCount);
  }
  Future<Response<GenericResponse>> notificationList() async {
    return getData(ApiConfig.notificationList);
  }

  Future<Response<GenericResponse>> notificationRead(String id) async {
    return putData(ApiConfig.notificationList+"seen/$id");
  }

  Future<Response<GenericResponse>> notificationReadAll() async {
    return putData(ApiConfig.notificationList+"seen");
  }

  Future<Response<GenericResponse>> searchProduct(FilterModel filterModel) async {
    String url = '''?filter={"product_name": {"\$regex": "${filterModel.name??""}"},"product_category":{"\$regex": "${filterModel.category??""}"}}&limit=10&skip=0''';
    return getData(
      ApiConfig.productsList + url,
    );
  }

  Future<Response<GenericResponse>> acceptRequest(ComType type,String id) async {
    return putData(type==ComType.chat ? ApiConfig.acceptChatRequest+id : ApiConfig.acceptCallRequest+id);
  }

  Future<Response<GenericResponse>> cancelRequest(ComType type,String id) async {
    return putData(type==ComType.chat ? ApiConfig.cancelChatRequest+id : ApiConfig.cancelCallRequest+id);
  }

  Future<Response<GenericResponse>> getMessages(String id) async {
    return getData(ApiConfig.getMessages+id,queryParameters: {"limit":4000});
  }

  Future<Response<GenericResponse>> onGoingChat() async {
    return getData(ApiConfig.onGoingChat);
  }
  Future<Response<GenericResponse>> onGoingCall() async {
    return getData(ApiConfig.onGoingCall);
  }

  Future<Response<GenericResponse>> endChat(String id) async {
    return putData(ApiConfig.endChat+id);
  }

  Future<Response<GenericResponse>> uploadFile(File? file) async {
    return putData(ApiConfig.upload+"${MyApp.appContext.read<AuthProvider>().userModel!.id}/");
  }

  Future<Response<GenericResponse>> callCount() async {
    return getData(ApiConfig.callCount);
  }
  Future<Response<GenericResponse>> chatCount() async {
    return getData(ApiConfig.chatCount);
  }

}
