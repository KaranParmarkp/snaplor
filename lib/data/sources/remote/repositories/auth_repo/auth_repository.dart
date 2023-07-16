import 'package:jyotishee/data/models/generic_response_model.dart';
import '../../../../models/models.dart';

abstract class AuthRepository{
  Future<UserModel> login(String email,String password);
  Future<dynamic> forgotPasswordSendVerificationCode(String mobile);
  Future<GenericResponse> forgotPassword(String mobile,String code, String password);
  Future<GenericResponse> checkEmailOrMobile(String? mobile,String? email);
  Future<GenericResponse> sendVerificationCode(String mobile,bool fromForgot);
  Future<GenericResponse> verificationVerify(String mobile,String code);
  Future<List<CompanyModel>> companyList(String search, String longitude, String latitude);
  Future<List<ButtonModel>> getIndustry();
  Future<List<ButtonModel>> getFacilityTypeByIndustry(String id);
  Future<List<ButtonModel>> getTimeZones();
  Future<List<ButtonModel>> getCompanyStates();
  Future<GenericResponse> register(RegisterModel model);
}