import 'dart:io';

import 'package:jyotishee/app/utils/enums.dart';
import 'package:jyotishee/app/utils/utils.dart';

import '../../../../models/models.dart';
import '../../network_services/abstract_api.dart';
import '../../services/social_service.dart';
import 'social_repository.dart';

class SocialRepositoryImpl extends AbstractApi implements SocialRepository {
  final SocialService service = SocialService();

  @override
  Future<GenericResponse> addPost(String message,File? file) {
    return serviceHandler(
      serviceFunction: () => service.addPost(message,file),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<List<SocialPostModel>> getPosts(int skip) {
    return serviceHandler(
      serviceFunction: () => service.getPosts(skip),
      successFunction: (response) async {
        List<SocialPostModel> list = [];
        list = List<SocialPostModel>.from(response.data!.map((x) => SocialPostModel.fromJson(x))).toList();
        return list;
      },
    );
  }
  @override
  Future<List<SocialPostModel>> getMyPosts(PostType? type) {
    return serviceHandler(
      serviceFunction: () => service.getMyPosts(type),
      successFunction: (response) async {
        List<SocialPostModel> list = [];
        list = List<SocialPostModel>.from(response.data!.map((x) => SocialPostModel.fromJson(x))).toList();
        return list;
      },
    );
  }

  @override
  Future<SocialPostModel> likePost(String id,bool isLike) {
    return serviceHandler(
      serviceFunction: () => service.likePost(id,isLike),
      successFunction: (response) async {
        return SocialPostModel.fromJson(response.data);
      },
    );
  }

  @override
  Future<List<PostCommentModel>> likedPostUsers(String id) {
    return serviceHandler(
      serviceFunction: () => service.likedPostUsers(id),
      successFunction: (response) async {
        List<PostCommentModel> list = [];
        list = List<PostCommentModel>.from(response.data!.map((x) => PostCommentModel.fromJson(x))).toList();
        return list;
      },
    );
  }


  @override
  Future<GenericResponse> commentPost(String id,String message,String? commentID) {
    return serviceHandler(
      serviceFunction: () => commentID.isNotNull ? service.commentPostReply(id,message,commentID!): service.commentPost(id,message),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<List<PostCommentModel>> getComments(String id,) {
    return serviceHandler(
      serviceFunction: () => service.getComments(id),
      successFunction: (response) async {
        List<PostCommentModel> list = [];
        list = List<PostCommentModel>.from(response.data!.map((x) => PostCommentModel.fromJson(x))).toList();
        return list;
      },
    );
  }

  @override
  Future<List<PostCommentModel>> getCommentsReplies(String id,String commentId) {
    return serviceHandler(
      serviceFunction: () => service.getCommentsReplies(id,commentId),
      successFunction: (response) async {
        List<PostCommentModel> list = [];
        list = List<PostCommentModel>.from(response.data!.map((x) => PostCommentModel.fromJson(x))).toList();
        return list;
      },
    );
  }

  @override
  Future<GenericResponse> deleteComment(String id) {
    return serviceHandler(
      serviceFunction: () => service.deleteComment(id),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<GenericResponse> deletePost(String id) {
    return serviceHandler(
      serviceFunction: () => service.deletePost(id),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<GenericResponse> deleteCommentReply(String postId,String commentId,String replyId) {
    return serviceHandler(
      serviceFunction: () => service.deleteCommentReply(postId, commentId, replyId),
      successFunction: (response) async {
        return response;
      },
    );
  }
}
