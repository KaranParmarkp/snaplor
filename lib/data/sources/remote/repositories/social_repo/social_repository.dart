import 'dart:io';

import '../../../../../app/utils/utils.dart';
import '../../../../models/models.dart';

abstract class SocialRepository{
  Future<GenericResponse> addPost(String message,File? file);
  Future<List<SocialPostModel>> getPosts(int skip);
  Future<List<SocialPostModel>> getMyPosts(PostType? type);
  Future<SocialPostModel> likePost(String id,bool isLike);
  Future<List<PostCommentModel>> likedPostUsers(String id);
  Future<GenericResponse> commentPost(String id,String message,String? commentID,String? replyId);
  Future<List<PostCommentModel>> getComments(String id,);
  Future<List<PostCommentModel>> getCommentsReplies(String id,String commentId);
  Future<GenericResponse> deleteComment(String id);
  Future<GenericResponse> deletePost(String id);
  Future<GenericResponse> deleteCommentReply(String postId,String commentId,String replyId);
}