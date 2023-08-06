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
  Future<UserModel> userData() {
    return serviceHandler(
      serviceFunction: () => service.userData(),
      successFunction: (response) async {
        return UserModel.fromJson(response.data);
      },
    );
  }

}
