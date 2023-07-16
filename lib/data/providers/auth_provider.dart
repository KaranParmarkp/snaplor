import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/presentation/screens/auth/login/login_screen.dart';
import 'package:jyotishee/presentation/screens/auth/register/create_account_screen.dart';
import 'package:jyotishee/presentation/screens/auth/register/register_successfully.dart';
import 'package:jyotishee/presentation/screens/base/base_screen.dart';
import '../../app/utils/preferences/preferences.dart';
import '../../main.dart';
import '../sources/remote/repositories/auth_repo/auth_repository.dart';
import '../sources/remote/repositories/auth_repo/auth_repository_impl.dart';

enum AuthStatus { authenticated, unAuthenticated }

class AuthProvider with ChangeNotifier {
  late AuthRepository _authRepo;

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  AuthStatus _status = AuthStatus.unAuthenticated;
  AuthStatus get status => _status;

  AuthProvider.initialize() {
    _authRepo = AuthRepositoryImpl();
    checkUserIsLoggedIn();
  }

  checkUserIsLoggedIn() async {
    String? encodedMap = await preference.getData(AppStrings.appPrefName);
    if (encodedMap == null) {
      _status = AuthStatus.unAuthenticated;
      notifyListeners();
    } else {
      _status = AuthStatus.authenticated;
      notifyListeners();
      loadUserData();
    }
  }

  loadUserData() async {
    String? encodedMap = await preference.getData(AppStrings.appPrefName);
    if (encodedMap != null) {
      _userModel = UserModel.fromJson(jsonDecode(encodedMap));
    }
    notifyListeners();
  }

  saveDataToLocally(UserModel user) async {
    preference.removeString(AppStrings.appPrefName);
    preference.clearPref();
    String encodedMap = json.encode(user.toJson());
    await preference.setString(PreferenceKeys.appPrefName, encodedMap);
  }

  logout() async{
    bool isBiometric = await preference.getBoolData(PreferenceKeys.isBiometric) ?? false;
    print(_userModel?.email);
    print(_userModel?.password);
    if(isBiometric){
      UserModel? user = _userModel;
      user?.accessToken = null;
      notifyListeners();
      await saveDataToLocally(user!);
      await loadUserData();
    }
    await preference.setBool(PreferenceKeys.isBiometric, isBiometric);
    _status = AuthStatus.unAuthenticated;
    notifyListeners();
    MyApp.navKey.currentContext!.pushReplace(LoginScreen());
  }

  // Login API
  login({required fromTouchId,required String email, required String password}) async {
    AppHelper.showLoading();
    try {
      UserModel userModel = await _authRepo.login(email, password);
      AppHelper.showToast(message: "Login Successfully");
      _status = AuthStatus.authenticated;
      userModel.email = email;
      userModel.password = password;
      notifyListeners();
      print(userModel.email);
      print(userModel.password);
      await saveDataToLocally(userModel);
      loadUserData();
      AppHelper.hideLoading();
      MyApp.navKey.currentContext!.pushReplace(BaseScreen());
      notifyListeners();
    } catch (e, s) {
      AppHelper.hideLoading();
      AppHelper.showImageToast(message: e.toString(),);
      e.printDebug;
      s.printDebug;
    }
  }

  // Forgot password API
  forgotPassword({required String mobile, required String code,required String password}) async {
    AppHelper.showLoading();
    try {
      GenericResponse response = await _authRepo.forgotPassword(mobile,code,password);
      AppHelper.hideLoading();
      if(response.code)AppHelper.showImageToast(message: "Password Reset Successfully",success: true);
      MyApp.navKey.currentContext!.pop();
      notifyListeners();
    } catch (e, s) {
      AppHelper.hideLoading();
      AppHelper.showImageToast(message: e.toString(),);
      e.printDebug;
      s.printDebug;
    }
  }

  // Mobile check  API
  Future<bool?> checkEmailOrMobile({String? mobile,String? email}) async {
    AppHelper.showLoading();
    try {
      GenericResponse response = await _authRepo.checkEmailOrMobile(mobile,email);
      if(response.code && mobile.isNotNull)await _authRepo.sendVerificationCode(mobile!,false);
      AppHelper.hideLoading();
      notifyListeners();
      return response.code;
    } catch (e, s) {
      AppHelper.hideLoading();
      AppHelper.showImageToast(message: e.isNotNull && e!="" ? e.toString() : "The ${mobile.isNotNull ? "mobile" : "email"} has already been taken",);
      s.printDebug;
    }
    return null;
  }

  // Mobile check  API
  Future<bool?> sendVerification({required String mobile,required bool fromForgot}) async {
    AppHelper.showLoading();
    try {
      GenericResponse response = await _authRepo.sendVerificationCode(mobile,fromForgot);
      AppHelper.hideLoading();
      notifyListeners();
      return response.code;
    } catch (e, s) {
      AppHelper.hideLoading();
      AppHelper.showImageToast(message: e.toString());
      s.printDebug;
    }
    return null;
  }

  // Verify code  API
  verificationVerify({required String mobile,required String code}) async {
    AppHelper.showLoading();
    try {
      GenericResponse response = await _authRepo.verificationVerify(mobile,code);
      if(response.code)MyApp.navKey.currentContext!.push(CreateAccountScreen(mobile: mobile,));
      AppHelper.hideLoading();
      notifyListeners();
      return response.code;
    } catch (e, s) {
      AppHelper.hideLoading();
      AppHelper.showImageToast(message: e.toString());
      e.printDebug;
      s.printDebug;
    }
    return null;
  }

  // Company list api
  bool _loadingCompanyList = false;
  bool get loadingCompanyList => _loadingCompanyList;
  List<CompanyModel> _companyList=[];
  List<CompanyModel> get companyList => _companyList;

  getCompanyList({String search="",String longitude="",String latitude=""}) async {
    _loadingCompanyList = true;
    notifyListeners();
    try {
      _companyList = [];
      _companyList = await _authRepo.companyList(search, longitude, latitude);
      notifyListeners();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
    }
    _loadingCompanyList = false;
    notifyListeners();
  }

  // Industry list api
  bool _loadingIndustryList = false;
  bool get loadingIndustryList => _loadingIndustryList;
  List<ButtonModel> _industryList=[];
  List<ButtonModel> get industryList => _industryList;

  getIndustryList() async {
    AppHelper.showLoading();
    _loadingIndustryList = true;
    notifyListeners();
    try {
      _industryList = [];
      _industryList = await _authRepo.getIndustry();
      notifyListeners();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
    }
    AppHelper.hideLoading();
    _loadingIndustryList = false;
    notifyListeners();
  }

  // Facility list api
  bool _loadingFacilityList = false;
  bool get loadingFacilityList => _loadingFacilityList;
  List<ButtonModel> _facilityList=[];
  List<ButtonModel> get facilityList => _facilityList;

  getFacilityTypeByIndustry({required String id, required Function() onSuccess}) async {
    AppHelper.showLoading();
    _loadingFacilityList = true;
    notifyListeners();
    try {
      _facilityList = [];
      _facilityList = await _authRepo.getFacilityTypeByIndustry(id);
      notifyListeners();
      onSuccess();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
    }
    AppHelper.hideLoading();
    _loadingFacilityList = false;
    notifyListeners();
  }

  // Timezone list api
  bool _loadingTimezones = false;
  bool get loadingTimezones => _loadingTimezones;
  List<ButtonModel> _timezoneList=[];
  List<ButtonModel> get timezoneList => _timezoneList;

  getTimezones({required Function() onSuccess}) async {
    AppHelper.showLoading();
    _loadingTimezones = true;
    notifyListeners();
    try {
      _timezoneList = [];
      _timezoneList = await _authRepo.getTimeZones();
      notifyListeners();
      onSuccess();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
    }
    AppHelper.hideLoading();
    _loadingTimezones = false;
    notifyListeners();
  }

  // Industry list api
  bool _loadingCompanyStates = false;
  bool get loadingCompanyStates => _loadingCompanyStates;
  List<ButtonModel> _companyStatesList=[];
  List<ButtonModel> get companyStatesList => _companyStatesList;

  getCompanyStates({required Function() onSuccess}) async {
    AppHelper.showLoading();
    _loadingCompanyStates = true;
    notifyListeners();
    try {
      _companyStatesList = [];
      _companyStatesList = await _authRepo.getTimeZones();
      notifyListeners();
      onSuccess();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
    }
    AppHelper.hideLoading();
    _loadingCompanyStates = false;
    notifyListeners();
  }

  //Register user  API
  register({required RegisterModel model}) async {
    AppHelper.showLoading();
    try {
      GenericResponse response = await _authRepo.register(model);
      if(response.code)MyApp.navKey.currentContext!.push(RegisterSuccessfully());
      AppHelper.hideLoading();
      //notifyListeners();
    } catch (e, s) {
      AppHelper.hideLoading();
      AppHelper.showImageToast(message: e.toString());
      e.printDebug;
      s.printDebug;
    }
    return null;
  }
}
