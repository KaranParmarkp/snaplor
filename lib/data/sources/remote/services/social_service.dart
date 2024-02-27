import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/models.dart';

import '../../../../main.dart';
import '../../../providers/providers.dart';
import '../network_services/api_service.dart';

class SocialService extends ApiService {
  Future<Response<GenericResponse>> uploadFile(File? file) async {
    return putData(ApiConfig.upload +
        "${MyApp.appContext.read<AuthProvider>().userModel!.id}/${file?.path}");
  }

  Future<Response<GenericResponse>> addPost(String message, File? file) async {
    String? signedUrl;
    if(file!=null){
      signedUrl = await getSignedUrl(isProfile: false, image: file);
    }
    return postData(ApiConfig.addPost, data: {"content": message,if(signedUrl!=null)"image_url":signedUrl});
  }

  Future<Response<GenericResponse>> getPosts(int skip) async {
    return getData(
      ApiConfig.addPost,
      queryParameters: {"skip" : skip,"limit":10}
    );
  }

  Future<Response<GenericResponse>> getMyPosts(PostType? type) async {
    if (type == PostType.video)
      return getData(ApiConfig.myPost + '''?filter={"video_url":true}''');
    if (type == PostType.image)
      return getData(ApiConfig.myPost + '''?filter={"image_url":true}''');
    if (type == PostType.text)
      return getData(ApiConfig.myPost + '''?filter={"content":true}''');
    else
      return getData(ApiConfig.myPost);
  }

  Future<Response<GenericResponse>> likePost(String id, bool isLike) async {
    return  putData(ApiConfig.addPost + "/action/" + id + (isLike ? "/like":"/unlike"));
  }

  Future<Response<GenericResponse>> likedPostUsers(String id,) async {
    return getData(ApiConfig.addPost + "/likes/" + id);
  }

  Future<Response<GenericResponse>> commentPost(String id, String message) async {
    return postData(ApiConfig.addPost + "/" + id + "/comments",
        data: {"comment": message});
  }

  Future<Response<GenericResponse>> commentPostReply(String id, String message, String commentID,String? replyId) async {
    return postData(ApiConfig.addPost + "/" + id + "/comments/"+commentID+"/replies",
        data: {"reply": message});
  }


  Future<Response<GenericResponse>> getComments(String id) async {
    return getData(ApiConfig.addPost + "/" + id + "/comments");
  }

  Future<Response<GenericResponse>> getCommentsReplies(String id,String commentId) async {
    return getData(ApiConfig.addPost + "/" + id + "/comments/"+commentId+"/replies");
  }

  Future<Response<GenericResponse>> deletePost(String id) async {
    return putData(ApiConfig.deletePost+id);
  }

  Future<Response<GenericResponse>> deleteComment(String id) async {
    return putData(ApiConfig.deleteComment+id);
  }

  Future<Response<GenericResponse>> deleteCommentReply(String postId,String commentId,String replyId) async {
    return deleteData(ApiConfig.addPost + "/" + postId + "/comments/"+commentId+"/"+replyId);
  }
}
