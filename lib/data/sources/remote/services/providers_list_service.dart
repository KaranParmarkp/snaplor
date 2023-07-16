import 'package:dio/dio.dart';
import 'package:jyotishee/app/utils/enums.dart';
import 'package:jyotishee/data/models/generic_response_model.dart';
import 'package:jyotishee/data/models/models.dart';
import '../../../../app/utils/constants/api_config.dart';
import '../network_services/api_service.dart';

class ProvidersListService extends ApiService {
  Future<Response<GenericResponse>> providerList(String? search) async {
    return getData(
      ApiConfig.providerList,
      queryParameters: {"name" : search}
    );
  }

  Future<Response<GenericResponse>> providerDetails(String id) async {
    return getData(
        ApiConfig.providerListDetails+id,
    );
  }

  Future<Response<GenericResponse>> favoriteProvidersList() async {
    return getData(
      ApiConfig.favoriteProvidersList,
    );
  }

  Future<Response<GenericResponse>> addFavoriteProvider(String providerId,String groupId) async {
    return postData(
      ApiConfig.favProvider,
      data: {
        "provider_id":providerId,
        "group_id":groupId,
      }
    );
  }

  Future<Response<GenericResponse>> deleteFavoriteProvider(String providerId) async {
    return deleteData(ApiConfig.favProvider+"/"+providerId,);
  }

  Future<Response<GenericResponse>> deleteFavoriteGroup(String id) async {
    return deleteData(ApiConfig.favoriteProvidersList+"/"+id);
  }

  Future<Response<GenericResponse>> addFavoriteGroup(String name) async {
    return postData(ApiConfig.favoriteProvidersList,data: {"name":name});
  }

  Future<Response<GenericResponse>> updateFavoriteGroup(String id,String name) async {
    return putData(ApiConfig.favoriteProvidersList+"/"+id,data: {"name":name});
  }

  Future<Response<GenericResponse>> favoriteProvidersListFromId(String id) async {
    return getData(
      ApiConfig.favProvider,queryParameters: {"group_id":id}
    );
  }

  Future<Response<GenericResponse>> getSuspendedProviders() async {
    return getData(
        ApiConfig.suspendedProvider,
    );
  }

  Future<Response<GenericResponse>> addSuspendedProvider(AddSuspendedProviderRequestModel model) async {
    return postData(
      ApiConfig.suspendedProvider,
      data: model.toJson()
    );
  }

  Future<Response<GenericResponse>> deleteSuspendedProvider(String id) async {
    return deleteData(ApiConfig.suspendedProvider+"/"+id);
  }

  Future<Response<GenericResponse>> recommendedProvidersList(String shiftId) async {
    return getData(
      ApiConfig.recommendedProvider,queryParameters: {"shift_id": shiftId}
    );
  }


}
