import 'package:dio/dio.dart';
import 'package:jyotishee/data/models/generic_response_model.dart';
import 'package:jyotishee/data/models/models.dart';
import '../../../../app/utils/constants/api_config.dart';
import '../network_services/api_service.dart';

class AuthService extends ApiService {
  Future<Response<GenericResponse>> login(String phone) async {
    return postData(ApiConfig.login,
        data: {"phone": phone});
  }
  Future<Response<GenericResponse>> verificationVerify(String mobile,String code) async {
    return postData(ApiConfig.verifyOtp, data: {"phone": mobile,"code":code});
  }
  Future<Response<GenericResponse>> userData() async {
    return getData(ApiConfig.userData,);
  }

  /*Future<Response<GenericResponse>> register(RegisterModel model) async {
    return postData(ApiConfig.register, data: await model.toFormData());
  }*/
}
