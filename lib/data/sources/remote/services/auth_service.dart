import 'package:dio/dio.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/main.dart';
import '../../../providers/providers.dart';
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

  Future<Response<GenericResponse>> offerList() async {
    return getData(ApiConfig.offersList,);
  }

  Future<Response<GenericResponse>> orderList(ComType type) async {
    String url = '''?filter={"astrologer.id": "${MyApp.appContext.read<AuthProvider>().userModel!.id}", "order_source": "${type.name}"}&limit=10&skip=0''';

    return getData(ApiConfig.ordersList+url,
        /*queryParameters: {
      "filter": {"astrologer.id": "${MyApp.appContext.read<AuthProvider>().userModel!.id}", "order_source": "${type.name}"},
      "limit":10,
      "skip":0
    }*/
    );
  }
   /*Future<IOWebSocketChannel> chats() async {
    return webSocketChannel();
  }
*/
  /*Future<Response<GenericResponse>> register(RegisterModel model) async {
    return postData(ApiConfig.register, data: await model.toFormData());
  }*/
}
