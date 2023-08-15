import 'package:jyotishee/data/models/post_comments_model.dart';

import '../../../../../app/utils/utils.dart';
import '../../../../models/models.dart';
import '../../network_services/abstract_api.dart';
import '../../services/auth_service.dart';
import '../../services/social_service.dart';
import 'social_repository.dart';

class SocialRepositoryImpl extends AbstractApi implements SocialRepository {
  final SocialService service = SocialService();

  @override
  Future<GenericResponse> addPost(String phone) {
    return serviceHandler(
      serviceFunction: () => service.addPost(phone),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<List<SocialPostModel>> getPosts() {
    return serviceHandler(
      serviceFunction: () => service.getPosts(),
      successFunction: (response) async {
        List<SocialPostModel> list = [];
        list = List<SocialPostModel>.from(response.data!.map((x) => SocialPostModel.fromJson(x))).toList();
        return list;
      },
    );
  }

  @override
  Future<GenericResponse> likePost(String id) {
    return serviceHandler(
      serviceFunction: () => service.likePost(id),
      successFunction: (response) async {
        return response;
      },
    );
  }

  @override
  Future<GenericResponse> commentPost(String id,String message) {
    return serviceHandler(
      serviceFunction: () => service.commentPost(id,message),
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

}
