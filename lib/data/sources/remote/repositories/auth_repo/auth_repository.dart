import 'package:jyotishee/data/models/generic_response_model.dart';
import '../../../../../app/utils/utils.dart';
import '../../../../models/models.dart';

abstract class AuthRepository{
  Future<GenericResponse> login(String phone);
  Future<UserModel> verificationVerify(String mobile,String code);
  Future<UserModel> userData(UserModel? model);
  Future<List<OfferModel>> offerList();
  Future<List<OrderModel>> orderList(ComType type);

}