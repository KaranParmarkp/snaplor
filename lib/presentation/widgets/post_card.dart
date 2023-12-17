import 'package:flutter/material.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/data/providers/providers.dart';

import '../../app/utils/utils.dart';
import '../screens/community/comments_screen.dart';
import 'widgets.dart';
/// Video post is commented in this phase.
class PostCard extends StatelessWidget {
  const PostCard(
      {super.key,
      this.showShadow = false,
      this.showSave = false,
      required this.model,
      this.fromMyPost = false});

  final bool showShadow;
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
    return Container(
      decoration:
          showShadow ? AppDecoration.whiteShadowRounded : BoxDecoration(),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: showShadow ? 10 : 2),
      child: Column(
        children: [
          Row(
            children: [
              UserDP(image: model.user?.image),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NameVerified(
                          name: model.user?.name,
                          verified: model.user?.isVerified ?? false),
                      Text(
                        "Exp : ${model.user?.experience.toStringOrEmpty} years | ${model.user?.order} Orders",
                        style: AppStyle.grey12.copyWith(
                            color: AppColors.hintGrey2,
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
              PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Text(
                            AppStrings.pinToTop,
                            style: AppStyle.black12,
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Text(
                            AppStrings.pinToTop,
                            style: AppStyle.black12,
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Text(
                            AppStrings.pinToTop,
                            style: AppStyle.black12,
                          )
                        ],
                      ),
                    ),
                  ];
                },
              )
            ],
          ),
          if (model.type != PostType.text)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.passthrough,
                clipBehavior: Clip.none,
                children: [
                  if(model.type==PostType.image)SquareNetworkImageAvatar(
                    radius: 12,
                    height: 150,
                    width: double.infinity,
                    image:
                        "https://images.unsplash.com/photo-1567324216289-97cc4134f626?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
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
          if (model.type != PostType.text)
            LikeCommentShare(showSave: showSave, model: model),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextHashtag(
                name: model.type != PostType.text
                    ? model.user?.name ?? "Madhusudan"
                    : null,
                text: model.content ??
                    ""),
          ),
          //like comment and share widget
          if (model.type == PostType.text)
            LikeCommentShare(
              showSave: showSave,
              model: model,
            ),
          10.height,
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "View all ${model.totalComment} comments",
              style: AppStyle.grey12.copyWith(
                  color: AppColors.hintGrey1,
                  fontWeight: FontWeight.w500,
                  fontSize: 10),
            ),
          ),
          5.height,
          Align(
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
        ],
      ),
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
      children: [
        Row(
          children: [
            //TODO : updating icon on like
            SvgImage(
                image: model.isLiked.isTrue ? AppSvg.like: AppSvg.unLike,size: 24,
                onTap: () async {
                  await provider.likePost(id: model.id.toString(),isLike: model.isLiked.isFalse);
                  if(provider.getSuccessStatus(taskName: SocialProvider.likePostKey) && !fromMyPost)provider.getPost(refresh: false,showMainLoader: false);
                  if(provider.getSuccessStatus(taskName: SocialProvider.likePostKey) && fromMyPost)provider.getMyPost(refresh: false,type: model.type);
                }),
            10.width,
            Text(
              "${model.totalLikes ?? 0}",
              style: AppStyle.black12,
            )
          ],
        ),
        20.width,
        InkWell(
          onTap: () async {
            await _showCommentSheet(context, model.id!, provider);
          },
          child: Row(
            children: [
              SvgImage(image: AppSvg.msg,size: 24,),
              10.width,
              Text(
                "${model.totalComment ?? 0}",
                style: AppStyle.black12,
              )
            ],
          ),
        ),
        20.width,
        Row(
          children: [
            SvgImage(image: AppSvg.share,size: 24,),
            10.width,
            Text(
              "${model.totalShare ?? 0}",
              style: AppStyle.black12,
            )
          ],
        ),
        Spacer(),
        if (showSave)
          Row(
            children: [
              SvgImage(image: AppSvg.bookmark),
              10.width,
            ],
          ),
      ],
    );
  }

  _showCommentSheet(
      BuildContext context, String id, SocialProvider provider) async {
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
}
