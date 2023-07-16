import 'package:jyotishee/data/models/generic_response_model.dart';

import '../../../../models/models.dart';
import '../../network_services/abstract_api.dart';
import '../../services/auth_service.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl extends AbstractApi implements AuthRepository {
  final AuthService service = AuthService();

  @override
  Future<UserModel> login(String email, String password) {
    return serviceHandler(
      serviceFunction: () => service.login(email, password),
      successFunction: (response) async {
        return UserModel.fromJson(response.data!);
      },
    );
  }

  @override
  Future<dynamic> forgotPasswordSendVerificationCode(String mobile) {
    return serviceHandler(
      serviceFunction: () => service.forgotPasswordSendVerification(mobile),
      successFunction: (response) async {
        return response;
        //return UserModel.fromJson(response.data);
      },
    );
  }

  @override
  Future<GenericResponse> forgotPassword(String mobile,String code, String password) {
    return serviceHandler(
      serviceFunction: () => service.forgotPassword(mobile, code, password),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<GenericResponse> checkEmailOrMobile(String? mobile,String? email) {
    return serviceHandler(
      serviceFunction: () => service.checkEmailOrMobile(mobile,email),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<GenericResponse> sendVerificationCode(String mobile,bool fromForgot) {
    return serviceHandler(
      serviceFunction: () => service.sendVerificationCode(mobile,fromForgot),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<GenericResponse> verificationVerify(String mobile,String code) {
    return serviceHandler(
      serviceFunction: () => service.verificationVerify(mobile,code),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<List<CompanyModel>> companyList(String search, String longitude, String latitude) {
    return serviceHandler(
      serviceFunction: () => service.companyList(search,latitude,latitude),
      successFunction: (response) async {
        List<CompanyModel> list = [];
        if (response.data.isNotEmpty) list = List<CompanyModel>.from(response.data.map((x) => CompanyModel.fromJson(x)));
        return list;
      },
    );
  }

  @override
  Future<List<ButtonModel>> getIndustry() {
    return serviceHandler(
      serviceFunction: () => service.getIndustry(),
      successFunction: (response) async {
        List<ButtonModel> list = [];
        if (response.data.isNotEmpty) list = List<ButtonModel>.from(response.data.map((x) => ButtonModel.fromJson(x)));
        return list;
      },
    );
  }

  @override
  Future<List<ButtonModel>> getFacilityTypeByIndustry(String id) {
    return serviceHandler(
      serviceFunction: () => service.getFacilityTypeByIndustry(id),
      successFunction: (response) async {
        List<ButtonModel> list = [];
        if (response.data.isNotEmpty) list = List<ButtonModel>.from(response.data.map((x) => ButtonModel.fromJson(x)));
        return list;
      },
    );
  }

  @override
  Future<List<ButtonModel>> getTimeZones() {
    return serviceHandler(
      serviceFunction: () => service.getTimezones(),
      successFunction: (response) async {
        List<ButtonModel> list = [];
        if (response.data.isNotEmpty) list = List<ButtonModel>.from(response.data.map((x) => ButtonModel.fromJson(x)));
        return list;
      },
    );
  }

  @override
  Future<List<ButtonModel>> getCompanyStates() {
    return serviceHandler(
      serviceFunction: () => service.getCompanyStates(),
      successFunction: (response) async {
        List<ButtonModel> list = [];
        if (response.data.isNotEmpty) list = List<ButtonModel>.from(response.data.map((x) => ButtonModel.fromJson(x)));
        return list;
      },
    );
  }

  @override
  Future<GenericResponse> register(RegisterModel model) {
    return serviceHandler(
      serviceFunction: () => service.register(model),
      successFunction: (response) async {
        return response;
      },
    );
  }
}
