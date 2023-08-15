import '../../../../models/models.dart';

abstract class SocialRepository{
  Future<GenericResponse> addPost(String phone);
  Future<List<SocialPostModel>> getPosts();
  Future<GenericResponse> likePost(String id);
  Future<GenericResponse> commentPost(String id,String message);
}