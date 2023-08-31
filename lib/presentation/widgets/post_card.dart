import 'package:flutter/material.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:video_player/video_player.dart';

import '../../app/utils/utils.dart';
import '../screens/social_profile/comments_screen.dart';
import 'widgets.dart';

class PostCard extends StatefulWidget {
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

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    if(widget.model.type==PostType.video)_controller = VideoPlayerController.networkUrl(Uri.parse(
        widget.model.videoUrl!))
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
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          widget.showShadow ? AppDecoration.whiteShadowRounded : BoxDecoration(),
      padding: EdgeInsets.all(15),
      margin:
          EdgeInsets.symmetric(horizontal: 12, vertical: widget.showShadow ? 10 : 2),
      child: Column(
        children: [
          Row(
            children: [
              UserDP(image: widget.model.user?.image),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NameVerified(
                          name: widget.model.user?.name,
                          verified: widget.model.user?.isVerified ?? false),
                      Text(
                        "pending Exp : 10+ years | 125486 Orders",
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
          if (widget.model.type != PostType.text)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.passthrough,
                clipBehavior: Clip.none,
                children: [
                  if(widget.model.type==PostType.image)SquareNetworkImageAvatar(
                    radius: 12,
                    height: 150,
                    width: double.infinity,
                    image:
                        "https://images.unsplash.com/photo-1567324216289-97cc4134f626?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
                  ),
                  if(widget.model.type==PostType.video) Container(
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
                  if (widget.model.type == PostType.video) InkWell(
                      onTap: () => !_controller!.value.isPlaying ? _controller!.play() : _controller!.pause(),
                      child: PlayButton(playing: _controller!.value.isPlaying,))
                ],
              ),
            ),
          if (widget.model.type != PostType.text)
            LikeCommentShare(showSave: widget.showSave, model: widget.model),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextHashtag(
                name: widget.model.type != PostType.text
                    ? widget.model.user?.name ?? "Madhusudan"
                    : null,
                text: widget.model.content ??
                    ""),
          ),
          //like comment and share widget
          if (widget.model.type == PostType.text)
            LikeCommentShare(
              showSave: widget.showSave,
              model: widget.model,
            ),
          10.height,
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "View all ${widget.model.totalComment} comments",
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
              widget.model.createdAt.isNotNull
                  ? widget.model.createdAt!.formatElapsedTimeString()
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
                image: AppSvg.unLike,
                onTap: () {
                  provider.likePost(id: model.id.toString());
                  if(provider.getSuccessStatus(taskName: SocialProvider.likePostKey) && !fromMyPost)provider.getPost(refresh: true);
                  if(provider.getSuccessStatus(taskName: SocialProvider.likePostKey) && fromMyPost)provider.getMyPost(refresh: true,type: model.type);

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
              SvgImage(image: AppSvg.msg),
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
            SvgImage(image: AppSvg.share),
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
