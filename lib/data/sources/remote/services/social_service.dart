import 'package:dio/dio.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/main.dart';
import '../../../providers/providers.dart';
import '../network_services/api_service.dart';

class SocialService extends ApiService {

  Future<Response<GenericResponse>> addPost(String message) async {
    return postData(ApiConfig.addPost, data: {"content": message});
  }

  Future<Response<GenericResponse>> getPosts() async {
    return getData(ApiConfig.addPost,);
  }

  Future<Response<GenericResponse>> likePost(String id) async {
    return putData(ApiConfig.addPost+"/"+id+"/like");
  }

  Future<Response<GenericResponse>> commentPost(String id,String message) async {
    return putData(ApiConfig.addPost+"/"+id+"/comments");
  }


}
