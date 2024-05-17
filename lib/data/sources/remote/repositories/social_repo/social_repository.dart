import 'dart:io';

import '../../../../../app/utils/utils.dart';
import '../../../../models/models.dart';

abstract class SocialRepository{
  Future<GenericResponse> addPost(String message,File? file,String? postId);
  Future<GenericResponse> rePost(String message,String postId,bool isEdit);
  Future<List<SocialPostModel>> getPosts(int skip);
  Future<List<SocialPostModel>> getMyPosts(PostType? type);
  Future<SocialPostModel> likePost(String id,bool isLike);
  Future<List<PostCommentModel>> likedPostUsers(String id);
  Future<GenericResponse> commentPost(String id,String message,String? commentID,String? replyId);
  Future<List<PostCommentModel>> getComments(String id,);
  Future<List<PostCommentModel>> getCommentsReplies(String id,String commentId);
  Future<GenericResponse> deleteComment(String id);
  Future<GenericResponse> deletePost(String id);
  Future<GenericResponse> deleteCommentReply(String commentId);
  Future<PostCommentModel> likeComment(String id,bool isLike);
  Future<PostCommentModel> likeCommentReplay(String id,bool isLike);
  Future<List<PostCommentModel>> likedCommentUsers(String id);
  Future<List<UserModel>> whoToFollow();
  Future<GenericResponse> followUnFollow(String id,bool isFollow);
}