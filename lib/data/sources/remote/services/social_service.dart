import 'package:dio/dio.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/models.dart';

import '../network_services/api_service.dart';

class SocialService extends ApiService {
  Future<Response<GenericResponse>> addPost(String message) async {
    return postData(ApiConfig.addPost, data: {"content": message});
  }

  Future<Response<GenericResponse>> getPosts() async {
    return getData(
      ApiConfig.addPost,
    );
  }

  Future<Response<GenericResponse>> getMyPosts(PostType? type) async {

      if(type==PostType.video)return  getData(ApiConfig.myPost+'''?filter={"video_url":true}''');
      if(type==PostType.image)return getData(ApiConfig.myPost+'''?filter={"image_url":true}''');
      else return getData(ApiConfig.myPost+'''?filter={"content":true}''');


  }

  Future<Response<GenericResponse>> likePost(String id) async {
    return putData(ApiConfig.addPost + "/" + id + "/like");
  }

  Future<Response<GenericResponse>> commentPost(
      String id, String message, String? commentID) async {
    return putData(ApiConfig.addPost + "/" + id + "/comments",
        data: {"comment": message});
  }

  Future<Response<GenericResponse>> getComments(String id) async {
    return getData(ApiConfig.addPost + "/" + id + "/comments");
  }

  /*Future<Response<GenericResponse>> uploadFile() async {
    return getData(ApiConfig.addPost + "/" + id + "/comments");
  }*/
}
