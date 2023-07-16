import '../../../../models/models.dart';

abstract class ProvidersListRepository{
  Future<List<ProviderListModel>> providerList(String? search);
  Future<ProviderDetailModel> providerDetails(String id);
  Future<List<ButtonModel>> favoriteProvidersList();
  Future<GenericResponse> addFavoriteGroup(String name);
  Future<GenericResponse> updateFavoriteGroup(String id,String name);
  Future<GenericResponse> deleteFavoriteGroup(String id);
  Future<List<FavoriteProviderModel>> favoriteProvidersListFromId(String id);
  Future<GenericResponse> addFavoriteProvider(String providerId,String groupId);
  Future<GenericResponse> deleteFavoriteProvider(String id);
  Future<GenericResponse> deleteSuspendedProvider(String id);
  Future<List<ModelSuspendedList>> getSuspendedProviders();
  Future<GenericResponse> addSuspendedProvider(AddSuspendedProviderRequestModel model);
  Future<List<ProviderListModel>> recommendedProvidersList(String shiftId);
}
