import 'package:dio/dio.dart';
import 'package:jyotishee/data/models/generic_response_model.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:web_socket_channel/src/channel.dart';
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

  Future<Response<GenericResponse>> userData(UserModel? model) async {
    return model!=null ? putData(ApiConfig.userData,data: model.toJsonUpdateProfile()):getData(ApiConfig.userData,);
  }
  Future<Future<WebSocketChannel>> chats() async {
    return webSocketChannel();
  }

  /*Future<Response<GenericResponse>> register(RegisterModel model) async {
    return postData(ApiConfig.register, data: await model.toFormData());
  }*/
}
