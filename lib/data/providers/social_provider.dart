import 'dart:io';

import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/providers/base_provider.dart';
import 'package:jyotishee/data/sources/remote/repositories/social_repo/social_repository.dart';

import '../models/social_post_model.dart';
import '../sources/remote/repositories/social_repo/social_repository_impl.dart';


class SocialProvider extends BaseProvider {
  final SocialRepository _repository = SocialRepositoryImpl();

  // Add Post api
  static String addPostKey = 'addPostKey';
  addPost({required String message,File? file,UploadFileType? type,required bool fromMyPost}) async {
    setLoading(taskName: addPostKey,showDialogLoader: true);
    try {
      setData(taskName: addPostKey,data: await _repository.addPost(message,file),hideLoader: true);
      if(fromMyPost){
        getMyPost(refresh: false,);
      }else{
      getPost(showMainLoader: false,refresh: false);
      }
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: addPostKey,errorMessage:  e.toString(),showToast: true);
    }
  }

  // Get Posts api
  static String getPostKey = 'getPostKey';
  getPost({bool refresh=false,bool showMainLoader = true,int skip=0,Function(List<SocialPostModel> data)? onSuccess,bool resetData=false}) async {
    if(resetData)reset(getPostKey);
    if(showMainLoader)setLoading(taskName: getPostKey,showDialogLoader: refresh);
    try {
      setData(taskName: getPostKey,data: await _repository.getPosts(skip),isPaginated: true,onSuccess: (data) => onSuccess?.call(data),);
    } catch (e, s) {
      setError(taskName: getPostKey,errorMessage:  e.toString(),s: s,e: e);
    }
  }
  // Get Posts api
  static String getMyPostKey = 'getMyPostKey';
  getMyPost({bool refresh=false,PostType? type}) async {
    setLoading(taskName: getMyPostKey,showDialogLoader: refresh);
    try {
      setData(taskName: getMyPostKey,data: await _repository.getMyPosts(type));
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: getMyPostKey,errorMessage:  e.toString());
    }
  }

  // Like Post api
  static String likePostKey = 'likePostKey';
  likePost({required String id,bool showLoader=false,bool isLike=false,required bool fromMyPost,Function(SocialPostModel? data)? onSuccess}) async {
    setLoading(taskName: likePostKey,showDialogLoader: showLoader);
    try {
      setData(taskName: likePostKey,data: await _repository.likePost(id,isLike),hideLoader: showLoader,onSuccess: (data) => onSuccess?.call(data),);
      /*if(fromMyPost){
        getMyPost(refresh: false,);
      }else{
        getPost(showMainLoader: false,refresh: false);
      }*/
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: likePostKey,errorMessage:  e.toString(),showToast: showLoader);
    }
  }

  // Comments Post api
  static String commentPostKey = 'commentPostKey';
  addCommentPost({required String id,required String message,String? commentID,String? replyId}) async {
    setLoading(taskName: commentPostKey,showDialogLoader: true);
    try {
      setData(taskName: commentPostKey,data: await _repository.commentPost(id,message,commentID,replyId),hideLoader: true);
      getComments(id: id,showLoader: false);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: commentPostKey,errorMessage:  e.toString(),showToast: true);
    }
  }

  // Comments get api
  static String getCommentsKey = 'getCommentsKey';
  getComments({required String id,bool showLoader = false}) async {
    reset(getCommentsRepliesKey);
    setLoading(taskName: getCommentsKey,showDialogLoader: showLoader);
    try {
      setData(taskName: getCommentsKey,data: await _repository.getComments(id),hideLoader: true);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: getCommentsKey,errorMessage:  e.toString(),showToast: true);
    }
  }

  // Replies Comments get api
  static String getCommentsRepliesKey = 'getCommentsRepliesKey';
  getCommentsReplies({required String id,bool showLoader = false,required String commentId}) async {
    setLoading(taskName: getCommentsRepliesKey,showDialogLoader: showLoader);
    try {
      setData(taskName: getCommentsRepliesKey,data: await _repository.getCommentsReplies(id,commentId),hideLoader: true);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: getCommentsRepliesKey,errorMessage:  e.toString(),showToast: true);
    }
  }


  // Delete Post api
  static String deletePostKey = 'deletePostKey';
  deletePost({required String id,bool showLoader=false,required bool fromMyPost}) async {
    setLoading(taskName: deletePostKey,showDialogLoader: showLoader);
    try {
      setData(taskName: deletePostKey,data: await _repository.deletePost(id),hideLoader: showLoader);
      if(fromMyPost){
        getMyPost(refresh: false,);
      }else{
        getPost(showMainLoader: false,refresh: false);
      }
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: deletePostKey,errorMessage:  e.toString(),showToast: showLoader);
    }
  }

  // Delete Comment api
  static String deleteCommentKey = 'deleteCommentKey';
  deleteComment({required String id,bool showLoader=false,required String postId}) async {
    setLoading(taskName: deleteCommentKey,showDialogLoader: showLoader);
    try {
      setData(taskName: deleteCommentKey,data: await _repository.deleteComment(id),hideLoader: showLoader);
      getComments(id: postId,showLoader: false);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: deleteCommentKey,errorMessage:  e.toString(),showToast: showLoader);
    }
  }


  // Delete comment reply Post api
  static String deleteCommentReplyKey = 'deleteCommentReplyKey';
  deleteCommentReply({required String id,bool showLoader=false,required String postId,required String commentId,required String replyId}) async {
    setLoading(taskName: deleteCommentReplyKey,showDialogLoader: showLoader);
    try {
      setData(taskName: deleteCommentReplyKey,data: await _repository.deleteCommentReply(postId, commentId, replyId),hideLoader: showLoader);
      getComments(id: postId,showLoader: false);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: deleteCommentReplyKey,errorMessage:  e.toString(),showToast: showLoader);
    }
  }


  // Liked users api
  static String getLikedUsersKey = 'getLikedUsersKey';
  getLikedUsers({required String id,bool showLoader = false}) async {
    setLoading(taskName: getLikedUsersKey,showDialogLoader: showLoader);
    try {
      setData(taskName: getLikedUsersKey,data: await _repository.likedPostUsers(id),hideLoader: true);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: getLikedUsersKey,errorMessage:  e.toString(),showToast: true);
    }
  }

}
