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
  addPost({required String message,File? file,UploadFileType? type,required bool fromMyPost,String? postId}) async {
    setLoading(taskName: addPostKey,showDialogLoader: true);
    try {
      setData(taskName: addPostKey,data: await _repository.addPost(message,file,postId),hideLoader: true);
      if(fromMyPost){
        reset(getMyPostKey);
        getMyPost(refresh: false,);
      }else{
        reset(getPostKey);
      getPost(showMainLoader: false,refresh: false);
      }
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: addPostKey,errorMessage:  e.toString(),showToast: true);
    }
  }

  // RePost api
  static String rePostKey = 'rePostKey';
  rePost({required String message,File? file,UploadFileType? type,required bool fromMyPost,required String postId,bool isEdit=false}) async {
    setLoading(taskName: rePostKey,showDialogLoader: true);
    try {
      setData(taskName: rePostKey,data: await _repository.rePost(message,postId,isEdit),hideLoader: true);
      if(fromMyPost){
        reset(getMyPostKey);
        getMyPost(refresh: false,);
      }else{
        reset(getPostKey);
        getPost(showMainLoader: false,refresh: false);
      }
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: rePostKey,errorMessage:  e.toString(),showToast: true);
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
  deleteCommentReply({bool showLoader=false,required String postId,required String commentId}) async {
    setLoading(taskName: deleteCommentReplyKey,showDialogLoader: showLoader);
    try {
      setData(taskName: deleteCommentReplyKey,data: await _repository.deleteCommentReply( commentId),hideLoader: showLoader);
      getComments(id: postId,showLoader: false);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: deleteCommentReplyKey,errorMessage:  e.toString(),showToast: showLoader);
    }
  }

  // Like comment reply Post api
  static String likeCommentReplyKey = 'likeCommentReplyKey';
  likeCommentReply({bool showLoader=false,required String commentId,required bool isLike,required postId}) async {
    setLoading(taskName: likeCommentReplyKey,showDialogLoader: showLoader);
    try {
      setData(taskName: likeCommentReplyKey,data: await _repository.likeCommentReplay(commentId,isLike),hideLoader: showLoader);
      getComments(id: postId,showLoader: false);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: likeCommentReplyKey,errorMessage:  e.toString(),showToast: showLoader);
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

  // Comment Liked users api
  static String getLikedCommentUsersKey = 'getLikedCommentUsersKey';
  getLikedCommentUsers({required String id,bool showLoader = false}) async {
    setLoading(taskName: getLikedCommentUsersKey,showDialogLoader: showLoader);
    try {
      setData(taskName: getLikedCommentUsersKey,data: await _repository.likedCommentUsers(id),hideLoader: true);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: getLikedCommentUsersKey,errorMessage:  e.toString(),showToast: true);
    }
  }
  //Comment Like Post api
  static String likeCommentKey = 'likeCommentKey';
  likeComment({required String id,bool showLoader=false,bool isLike=false,required bool fromMyPost,Function(SocialPostModel? data)? onSuccess,required String postId}) async {
    setLoading(taskName: likeCommentKey,showDialogLoader: showLoader);
    try {
      setData(taskName: likeCommentKey,data: await _repository.likeComment(id,isLike),hideLoader: showLoader,onSuccess: (data) => onSuccess?.call(data),);
      getComments(id: postId,showLoader: false);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: likeCommentKey,errorMessage:  e.toString(),showToast: showLoader);
    }
  }

  //Who to follow  api
  static String whoToFollowKey = 'whoToFollowKey';
  whoToFollow({Function(SocialPostModel? data)? onSuccess}) async {
    setLoading(taskName: whoToFollowKey);
    try {
      setData(taskName: whoToFollowKey,data: await _repository.whoToFollow(),onSuccess: (data) => onSuccess?.call(data),);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: whoToFollowKey,errorMessage:  e.toString(),);
    }
  }

  //Who to follow  api
  static String followUnFollowKey = 'followUnFollowKey';
  followUnFollow({required String id,bool isFollow=true}) async {
    setLoading(taskName: followUnFollowKey,showDialogLoader: true);
    try {
      setData(taskName: followUnFollowKey,data: await _repository.followUnFollow(id,isFollow),onSuccess: (data) => whoToFollow(),hideLoader: true);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: followUnFollowKey,errorMessage:  e.toString(),);
    }
  }
}
