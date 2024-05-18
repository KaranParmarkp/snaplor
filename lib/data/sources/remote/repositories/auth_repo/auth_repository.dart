import '../../../../../app/utils/utils.dart';
import '../../../../models/models.dart';

abstract class AuthRepository{
  Future<GenericResponse> login(String phone);
  Future<UserModel> verificationVerify(String mobile,String code);
  Future<UserModel> userData(UserModel? model);
  Future<List<OfferModel>> offerList();
  Future<GenericResponse> offerStatus(String id,bool activate);
  Future<List<OrderModel>> orderList(ComType type);
  Future<GenericResponse> refundAmount(String id);
  Future<List<ReviewModel>> reviewList();
  Future<GenericResponse> addReview(String id,String message);
  Future<GenericResponse> deleteReview(String id);
  Future<GenericResponse> askReview(String id);
  Future<List<WaitListModel>> waitList(ComType type);
  Future<WaitListModel?> onGoingChat();
  Future<List<WalletModel>> wallet();
  Future<List<ProductModel>> searchProduct(FilterModel filterModel);
  Future<GenericResponse> acceptRequest(ComType type,String id);
  Future<GenericResponse> cancelRequest(ComType type,String id);
  Future<List<MessageModel>> getMessages(String id);
  Future<GenericResponse> endChat(String id);
  Future<GenericResponse> callCount();
  Future<GenericResponse> chatCount();
  Future<GenericResponse> fcmSave();
  Future<GenericResponse> logout();
}