import 'package:jyotishee/data/models/generic_response_model.dart';

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
      serviceFunction: () => service.deleteReview(id,),
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


}
