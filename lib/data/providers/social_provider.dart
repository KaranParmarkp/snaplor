import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/providers/base_provider.dart';
import 'package:jyotishee/data/sources/remote/repositories/social_repo/social_repository.dart';

import '../sources/remote/repositories/social_repo/social_repository_impl.dart';


class SocialProvider extends BaseProvider {
  final SocialRepository _repository = SocialRepositoryImpl();

  // Add Post api
  static String addPostKey = 'addPostKey';
  addPost({required String message}) async {
    setLoading(taskName: addPostKey,showDialogLoader: true);
    try {
      setData(taskName: addPostKey,data: await _repository.addPost(message),hideLoader: true);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: addPostKey,errorMessage:  e.toString(),showToast: true);
    }
  }

  // Get Posts api
  static String getPostKey = 'getPostKey';
  getPost() async {
    setLoading(taskName: getPostKey);
    try {
      setData(taskName: getPostKey,data: await _repository.getPosts());
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: getPostKey,errorMessage:  e.toString());
    }
  }

  // Like Post api
  static String likePostKey = 'likePostKey';
  likePost({required String id}) async {
    setLoading(taskName: likePostKey,showDialogLoader: true);
    try {
      setData(taskName: likePostKey,data: await _repository.likePost(id),hideLoader: true);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: likePostKey,errorMessage:  e.toString(),showToast: true);
    }
  }

  // Comments Post api
  static String commentPostKey = 'commentPostKey';
  addCommentPost({required String id,required String message,String? commentID}) async {
    setLoading(taskName: commentPostKey,showDialogLoader: true);
    try {
      setData(taskName: commentPostKey,data: await _repository.commentPost(id,message,commentID),hideLoader: true);
      getComments(id: id,showLoader: true);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: commentPostKey,errorMessage:  e.toString(),showToast: true);
    }
  }

  // Comments Post api
  static String getCommentsKey = 'getCommentsKey';
  getComments({required String id,bool showLoader = false}) async {
    setLoading(taskName: getCommentsKey,showDialogLoader: showLoader);
    try {
      setData(taskName: getCommentsKey,data: await _repository.getComments(id),hideLoader: true);
    } catch (e, s) {
      e.printDebug;
      s.printDebug;
      setError(taskName: getCommentsKey,errorMessage:  e.toString(),showToast: true);
    }
  }

}
