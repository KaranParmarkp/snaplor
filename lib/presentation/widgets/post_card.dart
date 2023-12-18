import 'package:flutter/material.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/screens/community/liked_users_screen.dart';

import '../../app/utils/utils.dart';
import '../screens/community/comments_screen.dart';
import 'widgets.dart';

/// Video post is commented in this phase.
class PostCard extends StatelessWidget {
  const PostCard({super.key,
    this.showSave = false,
    required this.model,
    this.fromMyPost = false});

  final bool showSave;
  final SocialPostModel model;
  final bool fromMyPost;

/*  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    if(model.type==PostType.video)_controller = VideoPlayerController.networkUrl(Uri.parse(
        model.videoUrl!))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }
  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
  */
  @override
  Widget build(BuildContext context) {
    return Consumer<SocialProvider>(
  builder: (context, provider, child) {
  return Container(
      padding: EdgeInsets.only(top: 15,bottom: 15),
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Column(
        children: [

          /// header title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                UserDP(image: model.user?.image,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NameVerified(
                          name: model.user?.name,
                          verified: model.user?.isVerified.isTrue,
                          showAst: model.user?.role == "astrologer",
                        ),
                        Text(
                          "Exp : ${model.user?.experience} years | ${model.user
                              ?.order} Orders",
                          style: AppStyle.grey12.copyWith(
                              color: AppColors.hintGrey2,
                              fontWeight: FontWeight.w500,
                              fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
                if(model.user?.id == context
                    .read<AuthProvider>()
                    .userModel
                    ?.id)PopupMenuButton(
                  //icon: Icon(Icons.met),
                  offset: Offset(20, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: Row(children: [SvgImage(image: AppSvg.edit),10.width,Text(AppStrings.editPost,style: AppStyle.black12,)],),
                      ),
                      PopupMenuItem(
                          onTap: () {
                            provider.deletePost(id: model.id.toStringOrEmpty,fromMyPost: fromMyPost,showLoader: true);
                          },
                          child: Row(children: [SvgImage(image: AppSvg.deleteRed),10.width, Text(AppStrings.delete,style: AppStyle.red12,)],)
                    ,
                    )
                    ,

                    ];
                  },
                )
              ],
            ),
          ),
          if (model.type != PostType.text)Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.passthrough,
              clipBehavior: Clip.none,
              children: [
                if (model.type == PostType.image)
                  SquareNetworkImageAvatar(
                    radius: 0,
                    height: 350,
                    width: double.infinity,
                    image: model.imageUrl,
                  ),
                /*if(model.type==PostType.video) Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.shimmerColor
                    ),
                    child: _controller?.value.isInitialized==true ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: VideoPlayer(_controller!),
                      ),
                    ) : Container(),
                  ),
                  if (model.type == PostType.video) InkWell(
                      onTap: () => !_controller!.value.isPlaying ? _controller!.play() : _controller!.pause(),
                      child: PlayButton(playing: _controller!.value.isPlaying,))*/
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            child: TextHashtag(
                name: model.type != PostType.text
                    ? model.user?.name ?? "Madhusudan"
                    : null,
                text: model.content ?? ""),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: LikeCommentShare(
              showSave: showSave,
              model: model,
            ),
          ),
          10.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                model.createdAt.isNotNull
                    ? model.createdAt!.formatElapsedTimeString()
                    : "",
                style: AppStyle.grey12.copyWith(
                    color: AppColors.hintGrey2,
                    fontWeight: FontWeight.w500,
                    fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  },
);
  }
}

class LikeCommentShare extends StatelessWidget {
  const LikeCommentShare({
    super.key,
    required this.showSave,
    required this.model,
    this.fromMyPost = false,
  });

  final bool showSave;
  final bool fromMyPost;
  final SocialPostModel model;

  @override
  Widget build(BuildContext context) {
    var provider = context.read<SocialProvider>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconTitle(
          icon: AppSvg.msg,
          title: "${model.totalComment ?? 0}",
          iconTap: () async =>
          await _showCommentSheet(context, model.id!, provider),
          titleTap: () async =>
          await _showCommentSheet(context, model.id!, provider),
        ),
        IconTitle(
          icon: model.isLiked.isTrue ? AppSvg.like : AppSvg.unLike,
          title: "${model.totalLikes ?? 0}",
          iconTap: () async {
            await provider.likePost(id: model.id.toString(), isLike: model.isLiked.isFalse,fromMyPost: fromMyPost);
          },
          titleTap: () async =>
          await _showLikedUsersSheet(context, model.id!, provider),
        ),
        IconTitle(
          icon: AppSvg.repost,
          title: "${model.totalShare ?? 0}",
          //iconTap: () async => await _showCommentSheet(context, model.id!, provider),
          //titleTap: () async => await _showCommentSheet(context, model.id!, provider),
        ),
        IconTitle(
          icon: AppSvg.eyeOpen,
          iconColor: AppColors.hintGrey1,
          title: "${model.totalShare ?? 0}",
          //iconTap: () async => await _showCommentSheet(context, model.id!, provider),
          //titleTap: () async => await _showCommentSheet(context, model.id!, provider),
        ),
        IconTitle(
          icon: AppSvg.share,
          title: "${model.totalShare ?? 0}",
          //iconTap: () async => await _showCommentSheet(context, model.id!, provider),
          //titleTap: () async => await _showCommentSheet(context, model.id!, provider),
        ),
      ],
    );
  }

  _showCommentSheet(BuildContext context, String id,
      SocialProvider provider) async {
    await AppHelper.showBottomSheet(
        context: context,
        isScrollControlled: true,
        padding: EdgeInsets.zero,
        innerPadding: EdgeInsets.zero,
        child: StatefulBuilder(builder: (context, setState) {
          return CommentScreen(
            id: id,
          );
        }));
    provider.getPost(refresh: true);
  }
  _showLikedUsersSheet(BuildContext context, String id, SocialProvider provider) async {
    await AppHelper.showBottomSheet(
        context: context,
        isScrollControlled: true,
        padding: EdgeInsets.zero,
        innerPadding: EdgeInsets.zero,
        child: StatefulBuilder(builder: (context, setState) {
          return LikedUsersScreen(
            id: id,
          );
        }));
    provider.getPost(refresh: true);
  }
}

class IconTitle extends StatelessWidget {
  const IconTitle({super.key,
    required this.icon,
    required this.title,
    this.iconTap,
    this.titleTap, this.iconColor});

  final String icon;
  final String title;
  final VoidCallback? iconTap;
  final VoidCallback? titleTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          InkWell(
              onTap: iconTap,
              child: SvgImage(
                image: icon,
                size: 24, color: iconColor,
              )),
          10.width,
          InkWell(
            onTap: titleTap,
            child: Text(
              title,
              style: AppStyle.greyHint14w500,
            ),
          )
        ],
      ),
    );
  }
}
