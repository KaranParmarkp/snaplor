import 'package:jyotishee/app/utils/app_helper.dart';
import 'package:jyotishee/app/utils/enums.dart';
import 'package:jyotishee/app/utils/extensions.dart';
import 'package:jyotishee/data/providers/base_provider.dart';
import 'package:jyotishee/presentation/screens/base/base_screen.dart';
import '../../main.dart';
import '../models/models.dart';
import '../sources/remote/repositories/shifts_repo/shifts_repository.dart';
import '../sources/remote/repositories/shifts_repo/shifts_repository_impl.dart';

class ShiftsProvider extends BaseProvider {
  ShiftsRepository _repository = ShiftsRepositoryImpl();
  bool isFirstTimeOpenApp = true;

  // Credit profile api
  bool _loadingCreditProfile = false;

  bool get loadingCreditProfile => _loadingCreditProfile;
  CreditAvailableModel? _creditModel;

  CreditAvailableModel? get creditModel => _creditModel;

  getCreditProfile() async {
    _loadingCreditProfile = true;
    notifyListeners();
    try {
      _creditModel = await _repository.creditProfile();
      notifyListeners();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
    }
    _loadingCreditProfile = false;
    notifyListeners();
  }

  // Dashboard list api
  static String dashboard = 'Dashboard';
  DashBoardModel? _dashboardModel;

  DashBoardModel? get dashboardModel => _dashboardModel;
  Status dashboardStatus = Status.Idle;

  getDashboard() async {
    setStatus(dashboard, Status.Loading);
    try {
      _dashboardModel = await _repository.getDashboard();
      setData(dashboard, _dashboardModel);
      setStatus(dashboard, Status.Done);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(dashboard, e.toString(),);
    }
    notifyListeners();
  }

  // Dashboard list api
  static String creditProfile = 'CreditProfile';
  CreditAvailableModel? _creditProfileModel;

  CreditAvailableModel? get creditProfileModel => _creditProfileModel;
  Status creditProfileStatus = Status.Idle;

  getCredit() async {
    setStatus(creditProfile, Status.Loading);
    try {
      _creditProfileModel = await _repository.creditProfile();
      setData(creditProfile, _creditProfileModel);
      setStatus(creditProfile, Status.Done);
      if (_creditProfileModel?.spendingPowerMessage != "" && isFirstTimeOpenApp) {
        AppHelper.showNoticeDialog(context: MyApp.navKey.currentState!.context, text: _creditProfileModel!.spendingPowerMessage);
        isFirstTimeOpenApp=false;
        notifyListeners();
      }
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(creditProfile, e.toString(),);
    }
    notifyListeners();
  }

  // Shift list api
  static String shiftListKey = 'shiftListKey';
  shiftLists(ShiftListRequestModel model) async {
    setStatus(shiftListKey, Status.Loading);
    try {
      List<ModelShiftCalenderList> _shiftList = await _repository.shiftList(model);
      setData(shiftListKey, _shiftList);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(shiftListKey, e.toString(),);
    }
  }

  shiftListsRefresh(ShiftListRequestModel model) async {
    AppHelper.showLoading();
    try {
      List<ModelShiftCalenderList> _shiftList = await _repository.shiftList(model);
      if(data[shiftDetailsKey]!=_shiftList){
      setData(shiftListKey, _shiftList);
      }
      AppHelper.hideLoading();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      AppHelper.hideLoading();
    }
  }


  // Shift Details api
  static String shiftDetailsKey = 'shiftDetailsKey';
  shiftDetails(String id) async {
    setStatus(shiftDetailsKey, Status.Loading);
    try {
      setData(shiftDetailsKey, await _repository.getShiftDetails(id));
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(shiftDetailsKey, e.toString(),);
    }
  }


  // Shift Cancel  api
  shiftCancel(String id) async {
    AppHelper.showLoading();
    try {
      GenericResponse response = await  _repository.cancelShift(id);
      AppHelper.hideLoading();
      if(response.code) {
        MyApp.navKey.currentState!.context.pop(true);
        //await getSuspendedProviders();
      }
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      AppHelper.hideLoading();
      AppHelper.showImageToast(message: e.toString());
    }
  }


  // Shift Publish  api
  shiftPublish(String id) async {
    AppHelper.showLoading();
    try {
      GenericResponse response = await  _repository.publishShift(id);
      AppHelper.hideLoading();
      if(response.code) {
        MyApp.navKey.currentState!.context.pushReplace(BaseScreen());
      }
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      AppHelper.hideLoading();
      AppHelper.showImageToast(message: e.toString());
    }
  }

  // Shift filters options api
  static String shiftOptionsKey = 'shiftOptionsKey';
  PostShiftModel? _postShiftModel;
  List<ButtonModel> _locationOptions=[];
  List<ButtonModel> _shiftOptions=[];
  PostShiftModel? get postShiftModel => _postShiftModel;
  List<ButtonModel> get locationOptions => _locationOptions;
  List<ButtonModel> get shiftOptionsList  => _shiftOptions;
  shiftOptions() async {
    AppHelper.showLoading();
    setStatus(shiftOptionsKey, Status.Loading);
    try {
      _postShiftModel = await _repository.shiftOptions();
      notifyListeners();
      if(_postShiftModel.isNotNull){
        for (var value in _postShiftModel!.keywords!) {
          _shiftOptions.add(ButtonModel(id: value.id,value: value.value));
          notifyListeners();
        }
        for (var value in _postShiftModel!.locations!) {
          _locationOptions.add(ButtonModel(id: value.id,value: value.name));
          notifyListeners();
        }
      }
      notifyListeners();
      setData(shiftOptionsKey, _postShiftModel);
      AppHelper.hideLoading();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(shiftOptionsKey, e.toString(),);
      AppHelper.hideLoading();
    }
  }

  // Approve times api
  static String approveTimesListKey = 'approveTimesListKey';
  approveTimesList({bool? refresh,String? status}) async {
    if(refresh==true){
      AppHelper.showLoading();
    }else{
    setStatus(approveTimesListKey, Status.Loading);
    }
    try {
      List<CallOffModel> list = await _repository.getApproveTimesList(status);
      setData(approveTimesListKey,list);
      notifyListeners();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(approveTimesListKey, e.toString(),);
    }
    AppHelper.hideLoading();
  }

  // Approve times api
  static String approveBidKey = 'approveBidKey';
  approveBid(ApproveBidRequestModel model) async {
    AppHelper.showLoading();
    try {
      GenericResponse response = await _repository.approveBid(model);
      if(response.code){
        approveTimesList(refresh: true);
      }
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      AppHelper.showImageToast(message: e.toString());
      AppHelper.hideLoading();
    }
  }

  // Reject times api
  static String rejectBidKey = 'rejectBidKey';
  rejectBid(String id,String reason,String? status) async {
    AppHelper.showLoading();
    try {
      GenericResponse response = await _repository.rejectBid(id, reason);
      if(response.code){
        approveTimesList(refresh: true,status: status);
      }
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      AppHelper.showImageToast(message: e.toString());
      AppHelper.hideLoading();
    }
  }

  // Approve times api
  static String approveTimeNCNSStatusKey = 'approveTimeNCNSStatusKey';
  approveTimeNCNSStatus({required String id, required String status}) async {
    AppHelper.showLoading();
    try {
      GenericResponse response = await _repository.approveTimeNCNSStatus(id,status);
      AppHelper.hideLoading();
      if(response.code){
        approveTimesList(refresh: true);
      }
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      AppHelper.hideLoading();
      AppHelper.showImageToast(message: e.toString());
    }

  }

  // Approve times Details api
  static String approveBidDetailsKey = 'approveTimesDetailsKey';
  Future<CallOffModel?> approveBidDetails(String id) async {
    AppHelper.showLoading();
    try {
      CallOffModel model = await _repository.approveBidDetails(id);
      setData(approveBidDetailsKey,model);
      AppHelper.hideLoading();
      return model;
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      AppHelper.hideLoading();
      setError(approveBidDetailsKey, e.toString(),);
    }
    return null;
  }

  static String addTimePreviewKey = 'addTimePreviewKey';
  Future<PreviewModel?> addTimePreview(
      {required AddTimePreviewRequestModel model, required bool preview}) async {
    AppHelper.showLoading();
    try {
      GenericResponse<PreviewModel?> previewModel = await _repository.addTimePreview(model,preview);
      AppHelper.hideLoading();
      if(!preview && previewModel.code){
        MyApp.navKey.currentState?.context.pop();
        MyApp.navKey.currentState?.context.pop();
        return previewModel.data.isNotNull ? previewModel.data : null;
      }else{
        return previewModel.data.isNotNull ? previewModel.data : null;
      }
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      AppHelper.hideLoading();
      AppHelper.showImageToast(message: e.toString());
      setError(addTimePreviewKey, e.toString(),);
    }
    return null;
  }

  Future<PreviewModel?> updateApproveTime(
      {required AddTimePreviewRequestModel model, required String  id}) async {
    AppHelper.showLoading();
    try {
      GenericResponse<PreviewModel?> previewModel = await _repository.updateApproveTime(id,model);
      AppHelper.hideLoading();
      if(previewModel.code){
        AppHelper.showImageToast(message: "success",success: true,duration: 2000);
        MyApp.navKey.currentState?.context.pop();
        return previewModel.data.isNotNull ? previewModel.data : null;
      }else{
        return previewModel.data.isNotNull ? previewModel.data : null;
      }
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      AppHelper.hideLoading();
      AppHelper.showImageToast(message: e.toString());
      setError(addTimePreviewKey, e.toString(),);
    }
    return null;
  }


  // Call offs list api
  static String callOffsListKey = 'callOffsListKey';
  callOffsList({bool? refresh}) async {
    if(refresh==true){
      AppHelper.showLoading();
    }else{
      setStatus(callOffsListKey, Status.Loading);
    }
    try {
      List<CallOffModel> list = await _repository.needToProcessCallOffs();
      setData(callOffsListKey,list);
      notifyListeners();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(callOffsListKey, e.toString(),);
    }
    AppHelper.hideLoading();
  }

  // Shift Details api
  static String creditSpendKey = 'creditSpendDetailsKey';
   creditSpend(CreditSpend creditSpend) async {
    setStatus(creditSpendKey, Status.Loading);
    try {
      setData(creditSpendKey,await _repository.creditProfileDetails(creditSpend));
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(creditSpendKey, e.toString(),);
    }
  }


}