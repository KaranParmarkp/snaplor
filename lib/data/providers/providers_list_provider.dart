import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/main.dart';
import '../models/models.dart';
import '../sources/remote/repositories/providers_list_repo/providers_list_repository_impl.dart';
import '../sources/remote/repositories/providers_list_repo/providers_list_repository.dart';

class ProvidersListProvider extends BaseProvider{
  ProvidersListRepository _repository = ProvidersListRepositoryImpl();

  // Provider list api
  static String providerListKey = 'providerList';
  providerLists({String? search}) async {
    setStatus(providerListKey, Status.Loading);
    try {
      List<ProviderListModel> _providerList = await _repository.providerList(search);
      setData(providerListKey, _providerList);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(providerListKey, e.toString(),);
    }
  }

  // Provider details api
  static String providerDetailKey = 'providerDetails';
  providerDetails({required String id}) async {
    setStatus(providerDetailKey, Status.Loading);
    try {
      ProviderDetailModel _model = await _repository.providerDetails(id);
      setData(providerDetailKey, _model);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(providerDetailKey, e.toString(),);
    }
  }

  // Favorite Provider list api
  static String favProvidersKey = 'favProvidersKey';
  favoriteProviders({bool showLoader = false}) async {
    if(showLoader)AppHelper.showLoading();
    setStatus(favProvidersKey, Status.Loading);
    try {
      setData(favProvidersKey, await  _repository.favoriteProvidersList());
      if(showLoader)AppHelper.hideLoading();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(favProvidersKey, e.toString(),);
      if(showLoader)AppHelper.hideLoading();
    }
  }

  // Favorite Provider list api
  static String addFavProvidersKey = 'addFavProvidersKey';
  addFavoriteProvider({required String providerId, required String groupId}) async {
    AppHelper.showLoading();
    try {
      GenericResponse response = await  _repository.addFavoriteProvider(providerId,groupId);
      AppHelper.hideLoading();
      AppHelper.showImageToast(message: AppStrings.favListSuccess,success: true);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      AppHelper.hideLoading();
      AppHelper.showImageToast(message: e.toString());
    }
  }

  // Add Favorite Group list api
  static String addFavGroupKey = 'addFavGroupKey';
  addFavGroup({required String name}) async {
    AppHelper.showLoading();
    try {
      GenericResponse response = await  _repository.addFavoriteGroup(name);
        AppHelper.hideLoading();
        if(response.code) {
        AppHelper.showImageToast(message: AppStrings.favListSuccess, success: true,duration: 2500);
        await favoriteProviders();
      }
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      AppHelper.hideLoading();
      AppHelper.showImageToast(message: e.toString());
    }
  }

  // Update Favorite Group list api
  static String updateFavGroupKey = 'updateFavGroupKey';
  updateFavGroup({required String id,required String name}) async {
    AppHelper.showLoading();
    try {
      GenericResponse response = await  _repository.updateFavoriteGroup(id,name);
      AppHelper.hideLoading();
      if(response.code) {
        await favoriteProviders();
      }
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      AppHelper.hideLoading();
      AppHelper.showImageToast(message: e.toString());
    }
  }

  // Delete Favorite Group list api
  static String deleteFavGroupKey = 'deleteFavGroupKey';
  deleteFavGroup({required String id}) async {
    AppHelper.showLoading();
    try {
      GenericResponse response = await  _repository.deleteFavoriteGroup(id);
      AppHelper.hideLoading();
      if(response.code) {
        await favoriteProviders();
      }
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      AppHelper.hideLoading();
      AppHelper.showImageToast(message: e.toString());
    }
  }

  // Favorite Provider list from ID api
  static String favProvidersIDKey = 'favProvidersIDKey';
  favoriteProvidersFromId({required String id,bool showLoader = false}) async {
    if(showLoader)AppHelper.showLoading();
    setStatus(favProvidersIDKey, Status.Loading);
    try {
      setData(favProvidersIDKey, await  _repository.favoriteProvidersListFromId(id));
      if(showLoader)AppHelper.hideLoading();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(favProvidersIDKey, e.toString(),);
      if(showLoader)AppHelper.hideLoading();
    }
  }

  // Delete Favorite Group list api
  static String deleteFavProviderKey = 'deleteFavProviderKey';
  deleteFavProvider({required String id,required String groupId}) async {
    AppHelper.showLoading();
    try {
      GenericResponse response = await  _repository.deleteFavoriteProvider(id);
      AppHelper.hideLoading();
      if(response.code) {
        await favoriteProvidersFromId(id: groupId);
      }
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      AppHelper.hideLoading();
      AppHelper.showImageToast(message: e.toString());
    }
  }

  // Add Provider to Suspend list api
  static String addSuspendProviderKey = 'addSuspendProviderKey';
  addSuspendProvider({required AddSuspendedProviderRequestModel model}) async {
    AppHelper.showLoading();
    try {
      GenericResponse response = await  _repository.addSuspendedProvider(model);
      AppHelper.hideLoading();
      if(response.code) {
        AppHelper.showImageToast(message: AppStrings.providerSuspended, success: true,duration: 2500);
        MyApp.navKey.currentState!.context.pop();
        await providerDetails(id: model.providerId.toString());
      }
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      AppHelper.hideLoading();
      AppHelper.showImageToast(message: e.toString());
    }
  }

  // Delete Favorite Group list api
  static String deleteSuspendedProviderKey = 'deleteSuspendedProviderKey';
  deleteSuspendedProvider({required String id}) async {
    AppHelper.showLoading();
    try {
      GenericResponse response = await  _repository.deleteSuspendedProvider(id);
      AppHelper.hideLoading();
      if(response.code) {
        await getSuspendedProviders();
      }
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      AppHelper.hideLoading();
      AppHelper.showImageToast(message: e.toString());
    }
  }

  // Favorite Provider list api
  static String getSuspendedProvidersKey = 'getSuspendedProvidersKey';
  getSuspendedProviders({bool showLoader = false}) async {
    if(showLoader)AppHelper.showLoading();
    setStatus(getSuspendedProvidersKey, Status.Loading);
    try {
      setData(getSuspendedProvidersKey, await  _repository.getSuspendedProviders());
      if(showLoader)AppHelper.hideLoading();
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(getSuspendedProvidersKey, e.toString(),);
      if(showLoader)AppHelper.hideLoading();
    }
  }

  // Provider list api
  static String recommendedListKey = 'recommendedList';
  recommendedLists({required String shiftId}) async {
    setStatus(recommendedListKey, Status.Loading);
    try {
      setData(recommendedListKey, await _repository.recommendedProvidersList(shiftId));
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(recommendedListKey, e.toString(),);
    }
  }


}