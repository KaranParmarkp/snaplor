import '../../../../../app/utils/utils.dart';
import '../../../../models/models.dart';

abstract class SocialRepository{
  Future<GenericResponse> addPost(String phone);
  Future<List<SocialPostModel>> getPosts();
  Future<List<SocialPostModel>> getMyPosts(PostType? type);
  Future<GenericResponse> likePost(String id);
  Future<GenericResponse> commentPost(String id,String message,String? commentID);
  Future<List<PostCommentModel>> getComments(String id,);
}