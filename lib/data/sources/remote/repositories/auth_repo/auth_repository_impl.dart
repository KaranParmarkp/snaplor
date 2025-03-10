import 'package:jyotishee/data/models/notification_data_model.dart';

import 'package:jyotishee/data/models/notification_data_model.dart';

import 'package:jyotishee/data/models/notification_data_model.dart';

import 'package:jyotishee/data/models/notification_data_model.dart';

import '../../../../../app/utils/utils.dart';
import '../../../../models/models.dart';
import '../../network_services/abstract_api.dart';
import '../../services/auth_service.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl extends AbstractApi implements AuthRepository {
  final AuthService service = AuthService();

  @override
  Future<GenericResponse> login(String phone) {
    return serviceHandler(
      serviceFunction: () => service.login(phone),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<UserModel> verificationVerify(String mobile,String code) {
    return serviceHandler(
      serviceFunction: () => service.verificationVerify(mobile,code),
      successFunction: (response) async {
        return UserModel.fromJson(response.data);
      },
    );
  }

  @override
  Future<UserModel> userData(UserModel? model) {
    return serviceHandler(
      serviceFunction: () => service.userData(model),
      successFunction: (response) async {
        return UserModel.fromJson(response.data);
      },
    );
  }

  @override
  Future<List<OfferModel>> offerList() {
    return serviceHandler(
      serviceFunction: () => service.offerList(),
      successFunction: (response) async {
        List<OfferModel> list = [];
        list = List<OfferModel>.from(response.data!.map((x) => OfferModel.fromJson(x))).toList();
        return list;
      },
    );
  }

  @override
  Future<GenericResponse> offerStatus(String id,bool activate) {
    return serviceHandler(
      serviceFunction: () => service.offerStatus(id, activate),
      successFunction: (response) async {
        return response;
      },
    );
  }


  @override
  Future<List<OrderModel>> orderList(ComType type) {
    return serviceHandler(
      serviceFunction: () => service.orderList(type),
      successFunction: (response) async {
        List<OrderModel> list = [];
        list = List<OrderModel>.from(response.data!.map((x) => OrderModel.fromJson(x))).toList();
        return list;
      },
    );
  }
  @override
  Future<GenericResponse> refundAmount(String id) {
    return serviceHandler(
      serviceFunction: () => service.refundAmount(id),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<List<ReviewModel>> reviewList() {
    return serviceHandler(
      serviceFunction: () => service.reviewList(),
      successFunction: (response) async {
        List<ReviewModel> list = [];
        list = List<ReviewModel>.from(response.data!.map((x) => ReviewModel.fromJson(x))).toList();
        return list;
      },
    );
  }

  @override
  Future<GenericResponse> addReview(String id,String message) {
    return serviceHandler(
      serviceFunction: () => service.addReview(id,message),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<GenericResponse> deleteReview(String id) {
    return serviceHandler(
      serviceFunction: () => service.hideReview(id,),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<GenericResponse> askReview(String id) {
    return serviceHandler(
      serviceFunction: () => service.askReview(id,),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<List<WaitListModel>> waitList(ComType type) {
    return serviceHandler(
      serviceFunction: () => service.waitList(type),
      successFunction: (response) async {
        List<WaitListModel> list = [];
        list = List<WaitListModel>.from(response.data!.map((x) => WaitListModel.fromJson(x))).toList();
        return list;
      },
    );
  }

  @override
  Future<WaitListModel?> onGoingChat() {
    return serviceHandler(
      serviceFunction: () => service.onGoingChat(),
      successFunction: (response) async {
        return WaitListModel.fromJson(response.data);
      },
    );
  }
  @override
  Future<WaitListModel?> onGoingCall() {
    return serviceHandler(
      serviceFunction: () => service.onGoingCall(),
      successFunction: (response) async {
        return WaitListModel.fromJson(response.data);
      },
    );
  }


  @override
  Future<List<WalletModel>> wallet() {
    return serviceHandler(
      serviceFunction: () => service.wallet(),
      successFunction: (response) async {
        List<WalletModel> list = [];
        list = List<WalletModel>.from(response.data!.map((x) => WalletModel.fromJson(x))).toList();
        return list;
      },
    );
  }

  @override
  Future<List<ProductModel>> searchProduct(FilterModel filterModel) {
    return serviceHandler(
      serviceFunction: () => service.searchProduct(filterModel),
      successFunction: (response) async {
        List<ProductModel> list = [];
        list = List<ProductModel>.from(response.data!.map((x) => ProductModel.fromJson(x))).toList();
        return list;
      },
    );
  }
  @override
  Future<GenericResponse> acceptRequest(ComType type,String id) {
    return serviceHandler(
      serviceFunction: () => service.acceptRequest(type,id),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<GenericResponse> cancelRequest(ComType type,String id) {
    return serviceHandler(
      serviceFunction: () => service.cancelRequest(type,id),
      successFunction: (response) async {
        return response;
      },
    );
  }
  @override
  Future<List<MessageModel>> getMessages(String id) {
    return serviceHandler(
      serviceFunction: () => service.getMessages(id),
      successFunction: (response) async {
        List<MessageModel> list = [];
        list = List<MessageModel>.from(response.data!.map((x) => MessageModel.fromJson(x))).toList();
        return list;
      },
    );
  }
  @override
  Future<GenericResponse> endChat(String id) {
    return serviceHandler(
      serviceFunction: () => service.endChat(id),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<GenericResponse> callCount() {
    return serviceHandler(
      serviceFunction: () => service.callCount(),
      successFunction: (response) async {
        return response;
      },
    );
  }
  @override
  Future<GenericResponse> chatCount() {
    return serviceHandler(
      serviceFunction: () => service.chatCount(),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<GenericResponse> fcmSave() {
    return serviceHandler(
      serviceFunction: () => service.fcmSave(),
      successFunction: (response) async {
        return response;
      },
    );
  }
  Future<GenericResponse> logout() {
    return serviceHandler(
      serviceFunction: () => service.logout(),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<List<NotificationDataModel>> notificationList() {
    return serviceHandler(
      serviceFunction: () => service.notificationList(),
      successFunction: (response) async {
        List<NotificationDataModel> list = [];
        list = List<NotificationDataModel>.from(response.data!.map((x) => NotificationDataModel.fromJson(x))).toList();
        return list;
      },
    );
  }
  @override
  Future<GenericResponse> notificationCount() {
    return serviceHandler(
      serviceFunction: () => service.notificationCount(),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<GenericResponse> notificationRead(String id) {
    return serviceHandler(
      serviceFunction: () => service.notificationRead(id),
      successFunction: (response) async {
        return response;
      },
    );
  }
  Future<GenericResponse> notificationSeenAll() {
    return serviceHandler(
      serviceFunction: () => service.notificationReadAll(),
      successFunction: (response) async {
        return response;
      },
    );
  }

}
