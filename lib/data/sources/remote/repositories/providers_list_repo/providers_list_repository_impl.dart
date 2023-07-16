import 'package:jyotishee/data/models/generic_response_model.dart';
import 'package:jyotishee/data/sources/remote/services/providers_list_service.dart';
import '../../../../models/models.dart';
import '../../network_services/abstract_api.dart';
import 'providers_list_repository.dart';

class ProvidersListRepositoryImpl extends AbstractApi implements ProvidersListRepository {
  final ProvidersListService service = ProvidersListService();

  @override
  Future<List<ProviderListModel>> providerList(String? search) {
    return serviceHandler(
      serviceFunction: () => service.providerList(search),
      successFunction: (response) async {
        List<ProviderListModel> list = [];
        if (response.data.isNotEmpty) list = List<ProviderListModel>.from(response.data.map((x) => ProviderListModel.fromJson(x)));
        return list;
      },
    );
  }

  @override
  Future<ProviderDetailModel> providerDetails(String id) {
    return serviceHandler(
      serviceFunction: () => service.providerDetails(id),
      successFunction: (response) async {
        return await ProviderDetailModel.fromJson(response.data);
      },
    );
  }

  @override
  Future<List<ButtonModel>> favoriteProvidersList() {
    return serviceHandler(
      serviceFunction: () => service.favoriteProvidersList(),
      successFunction: (response) async {
        List<ButtonModel> list = [];
        if (response.data.isNotEmpty) list = List<ButtonModel>.from(response.data.map((x) => ButtonModel.fromJson(x)));
        return list;
      },
    );
  }

  @override
  Future<GenericResponse> addFavoriteProvider(String providerId,String groupId) {
    return serviceHandler(
      serviceFunction: () => service.addFavoriteProvider(providerId,groupId),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<GenericResponse> addFavoriteGroup(String name) {
    return serviceHandler(
      serviceFunction: () => service.addFavoriteGroup(name),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<GenericResponse> updateFavoriteGroup(String id,String name){
    return serviceHandler(
      serviceFunction: () => service.updateFavoriteGroup(id,name),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<GenericResponse> deleteFavoriteGroup(String id) {
    return serviceHandler(
      serviceFunction: () => service.deleteFavoriteGroup(id),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<List<FavoriteProviderModel>> favoriteProvidersListFromId(String id) {
    return serviceHandler(
      serviceFunction: () => service.favoriteProvidersListFromId(id),
      successFunction: (response) async {
        List<FavoriteProviderModel> list = [];
        if (response.data.isNotEmpty) list = List<FavoriteProviderModel>.from(response.data.map((x) => FavoriteProviderModel.fromJson(x)));
        return list;
      },
    );
  }
  @override
  Future<GenericResponse> deleteFavoriteProvider(String id) {
    return serviceHandler(
      serviceFunction: () => service.deleteFavoriteProvider(id),
      successFunction: (response) async {
        return response;
      },
    );
  }



  @override
  Future<GenericResponse> deleteSuspendedProvider(String id) {
    return serviceHandler(
      serviceFunction: () => service.deleteSuspendedProvider(id),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<List<ModelSuspendedList>> getSuspendedProviders() {
    return serviceHandler(
      serviceFunction: () => service.getSuspendedProviders(),
      successFunction: (response) async {
        List<ModelSuspendedList> list = [];
        if (response.data.isNotEmpty) list = List<ModelSuspendedList>.from(response.data.map((x) => ModelSuspendedList.fromJson(x)));
        return list;
      },
    );
  }

  @override
  Future<GenericResponse> addSuspendedProvider(AddSuspendedProviderRequestModel model) {
    return serviceHandler(
      serviceFunction: () => service.addSuspendedProvider(model),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<List<ProviderListModel>> recommendedProvidersList(String shiftId) {
    return serviceHandler(
      serviceFunction: () => service.recommendedProvidersList(shiftId),
      successFunction: (response) async {
        List<ProviderListModel> list = [];
        if (response.data.isNotEmpty) list = List<ProviderListModel>.from(response.data.map((x) => ProviderListModel.fromJson(x)));
        return list;
      },
    );
  }



}
