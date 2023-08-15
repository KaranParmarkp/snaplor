import 'dart:convert';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/data/providers/base_provider.dart';
import 'package:jyotishee/presentation/screens/auth/login/login_screen.dart';
import 'package:jyotishee/presentation/screens/base/base_screen.dart';
import '../../app/utils/preferences/preferences.dart';
import '../../main.dart';
import '../sources/remote/repositories/auth_repo/auth_repository.dart';
import '../sources/remote/repositories/auth_repo/auth_repository_impl.dart';

enum AuthStatus { authenticated, unAuthenticated }

class AuthProvider extends BaseProvider {
  late AuthRepository _authRepo;

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  AuthStatus _authStatus = AuthStatus.unAuthenticated;
  AuthStatus get authStatus => _authStatus;

  AuthProvider.initialize() {
    _authRepo = AuthRepositoryImpl();
    checkUserIsLoggedIn();
  }

  checkUserIsLoggedIn() async {
    String? encodedMap = await preference.getData(PreferenceKeys.appPrefName);
    if (encodedMap == null) {
      _authStatus = AuthStatus.unAuthenticated;
      notifyListeners();
    } else {
      _authStatus = AuthStatus.authenticated;
      notifyListeners();
      loadUserData();
    }
  }

  loadUserData() async {
    String? encodedMap = await preference.getData(PreferenceKeys.appPrefName);
    if (encodedMap != null) {
      _userModel = UserModel.fromJson(jsonDecode(encodedMap));
    }
    notifyListeners();
  }

  saveDataToLocally(UserModel user) async {
    preference.removeString(PreferenceKeys.appPrefName);
    String encodedMap = json.encode(user.toJson());
    await preference.setString(PreferenceKeys.appPrefName, encodedMap);
  }

  logout() async{
    _authStatus = AuthStatus.unAuthenticated;
    notifyListeners();
    MyApp.navKey.currentContext!.pushReplace(LoginScreen());
  }

  // Login API
  Future<bool?> login({required String phone}) async {
    AppHelper.showLoading();
    try {
      GenericResponse response = await _authRepo.login(phone);
      AppHelper.hideLoading();
      return response.code;
    } catch (e, s) {
      AppHelper.hideLoading();
      AppHelper.showToast(message: e.toString(),);
      e.printDebug;
      s.printDebug;
    }
    return null;
  }

  // Verify code  API
  verificationVerify({required String mobile,required String code}) async {
    AppHelper.showLoading();
    try {
      UserModel? model = await _authRepo.verificationVerify(mobile,code);
      AppHelper.showToast(message: "Login Successfully");
      _authStatus = AuthStatus.authenticated;
      _userModel = model;
      notifyListeners();
      await saveDataToLocally(model);
      loadUserData();
      AppHelper.hideLoading();
      MyApp.navKey.currentContext!.pushReplace(BaseScreen());
      notifyListeners();
    } catch (e, s) {
      AppHelper.hideLoading();
      AppHelper.showToast(message: e.toString(),);
      e.printDebug;
      s.printDebug;
    }
  }

  // User home api
  static String userDataKey = 'userDataDetailsKey';
  Future<bool?> userData({bool refresh = false,UserModel? updateModel}) async {
    setLoading(taskName: userDataKey,showDialogLoader: refresh);
    try {
      UserModel model = await _authRepo.userData(updateModel);
      final modelNew = model.copyWith(accessToken: _userModel?.accessToken);
      _userModel = modelNew;
      notifyListeners();
      setData( taskName: userDataKey,data: userModel);
      return true;
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: userDataKey,errorMessage:  e.toString(),showToast: true);
    }
    return null;
  }

  // Offer list api
  static String offerListKey = 'offerListKey';
   offerList() async {
    setLoading(taskName: offerListKey);
    try {
      setData(taskName: offerListKey,data: await _authRepo.offerList());
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: offerListKey,errorMessage:  e.toString(),);
    }
  }

  // Order list api
  static String orderListKey = 'orderListKey';
  orderList(ComType type) async {
    setLoading(taskName: orderListKey);
    try {
      setData(taskName: orderListKey,data: await _authRepo.orderList(type));
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: orderListKey,errorMessage:  e.toString(),);
    }
  }

  // Delete Review api
  static String refundAmountKey = 'refundAmountKey';
  refundAmount({required String id}) async {
    setLoading(taskName: refundAmountKey,showDialogLoader: true);
    try {
      setData(taskName: refundAmountKey,data: await _authRepo.refundAmount(id),hideLoader: true);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: refundAmountKey,errorMessage:  e.toString(),showToast: true);
    }
  }


  // Reviews list api
  static String reviewListKey = 'reviewListKey';
  reviewList() async {
    setLoading(taskName: reviewListKey);
    try {
      setData(taskName: reviewListKey,data: await _authRepo.reviewList());
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: reviewListKey,errorMessage:  e.toString(),);
    }
  }

  // Add Review api
  static String addReviewKey = 'addReviewKey';
  addReview({required String id,required String message}) async {
    setLoading(taskName: addReviewKey,showDialogLoader: true);
    try {
      setData(taskName: addReviewKey,data: await _authRepo.addReview(id,message),hideLoader: true);
      reviewList();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: addReviewKey,errorMessage:  e.toString(),);
    }
  }

  // Delete Review api
  static String deleteReviewKey = 'deleteReviewKey';
  deleteReview({required String id}) async {
    setLoading(taskName: deleteReviewKey,showDialogLoader: true);
    try {
      setData(taskName: deleteReviewKey,data: await _authRepo.deleteReview(id),hideLoader: true);
      reviewList();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: deleteReviewKey,errorMessage:  e.toString(),);
    }
  }

  // WaitList list api
  static String waitListKey = 'waitListKey';
  waitList(ComType type) async {
    setLoading(taskName: waitListKey);
    try {
      setData(taskName: waitListKey,data: await _authRepo.waitList(type));
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: waitListKey,errorMessage:  e.toString(),);
    }
  }

  // Wallet list api
  static String walletKey = 'walletKey';
  wallet() async {
    setLoading(taskName: walletKey);
    try {
      setData(taskName: walletKey,data: await _authRepo.wallet());
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: walletKey,errorMessage:  e.toString(),);
    }
  }


  // Wallet list api
  static String searchProductKey = 'searchProductKey';
  searchProduct({required FilterModel filterModel}) async {
    setLoading(taskName: searchProductKey);
    try {
      setData(taskName: searchProductKey,data: await _authRepo.searchProduct(filterModel));
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: searchProductKey,errorMessage:  e.toString(),);
    }
  }

}
