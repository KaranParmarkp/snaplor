import 'package:dio/dio.dart';
import 'package:jyotishee/data/models/generic_response_model.dart';
import 'package:jyotishee/data/models/models.dart';
import '../../../../app/utils/constants/api_config.dart';
import '../network_services/api_service.dart';

class AuthService extends ApiService {
  Future<Response<GenericResponse>> login(String email, String password) async {
    return postData(ApiConfig.login,
        data: {"email_or_mobile": email, "password": password});
  }

  Future<Response<GenericResponse>> forgotPassword(String mobile,String code, String password) async {
    return postData(ApiConfig.forgetPassword,
        data: {"mobile": mobile, "code": code,"new_password": password,"confirm_new_password" : password});
  }

  Future<Response<GenericResponse>> forgotPasswordSendVerification(String mobile,) async {
    return postData(ApiConfig.sendVerificationCodeForgot,
        data: {"mobile": mobile,});
  }

  Future<Response<GenericResponse>> checkEmailOrMobile(String? mobile,String? email) async {
    return getData(ApiConfig.checkEmailOrMobile, queryParameters: {"mobile": mobile ?? "","email":email ?? ""});
  }

  Future<Response<GenericResponse>> sendVerificationCode(String mobile,bool fromForgot) async {
    return postData(fromForgot ?ApiConfig.sendVerificationCodeForgot:ApiConfig.sendVerificationCode, data: {"mobile": mobile,});
  }

  Future<Response<GenericResponse>> verificationVerify(String mobile,String code) async {
    return postData(ApiConfig.sendVerificationCodeVerify, data: {"mobile": mobile,"code":code});
  }


  Future<Response<GenericResponse>> companyList(String search, String longitude, String latitude) async {
    return getData(ApiConfig.companyList, queryParameters: {
      "searchString": search,
      "longitude": longitude,
      "latitude": latitude
    });
  }

  Future<Response<GenericResponse>> getIndustry() async {
    return getData(ApiConfig.industryList, queryParameters: {
      "group": "facility_type",
    });
  }

  Future<Response<GenericResponse>> getFacilityTypeByIndustry(String id) async {
    return getData(ApiConfig.getFacilityTypeByIndustry, queryParameters: {
      "industry_id": id,
    });
  }

  Future<Response<GenericResponse>> getTimezones() async {
    return getData(ApiConfig.timezones,);
  }

  Future<Response<GenericResponse>> getCompanyStates() async {
    return getData(ApiConfig.companyState,);
  }

  Future<Response<GenericResponse>> register(RegisterModel model) async {
    return postData(ApiConfig.register, data: await model.toFormData());
  }
}
