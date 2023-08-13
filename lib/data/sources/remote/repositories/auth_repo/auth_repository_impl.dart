import 'package:jyotishee/data/models/generic_response_model.dart';

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

}
