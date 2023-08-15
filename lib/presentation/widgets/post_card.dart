import 'package:flutter/material.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/data/providers/providers.dart';

import '../../app/utils/utils.dart';
import '../screens/social_profile/comments_screen.dart';
import 'widgets.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,  this.showShadow=false, this.type=PostType.text,this.showSave=false, required this.model
  });
  final bool showShadow;
  final bool showSave;
  final PostType type;
  final SocialPostModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: showShadow ? AppDecoration.whiteShadowRounded:BoxDecoration(),
      padding: EdgeInsets.all(15),
      margin:
      EdgeInsets.symmetric(horizontal: 8, vertical: showShadow ? 10 : 2),
      child: Column(
        children: [
          Row(
            children: [
              UserDP(image: model.user?.image),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      NameVerified(name: model.user?.name,verified: model.user?.isVerified ?? false),
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
                    PopupMenuItem(child: Row(children: [Text(AppStrings.pinToTop,style: AppStyle.black12,)],),),
                    PopupMenuItem(child: Row(children: [Text(AppStrings.pinToTop,style: AppStyle.black12,)],),),
                    PopupMenuItem(child: Row(children: [Text(AppStrings.pinToTop,style: AppStyle.black12,)],),),
                  ];
                },)
            ],
          ),
          if(type!=PostType.text)Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.passthrough,
              clipBehavior: Clip.none,
              children: [
                SquareNetworkImageAvatar(
                  radius: 12,
                  height: 150,
                  width: double.infinity,
                  image: "https://images.unsplash.com/photo-1567324216289-97cc4134f626?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
                ),
                if(type==PostType.video)PlayButton()
              ],
            ),
          ),
          if(type!=PostType.text)LikeCommentShare(showSave: showSave,model: model),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextHashtag(
                name:  type!=PostType.text ? model.user?.name ?? "Madhusudan" : null,
                text: model.content ?? ''' You can write your caption here, so just write blah blah blah and bleh bleh bleh  more of the caption part blah blah blah. The fiery planet is known as the factor of the father. A well-positioned Sun would benefit the native in multiple ways. In July 2022, Sun will transit from the dual sign. It will move in the moon sign of its friend, i.e., Cancer. This combination of fire and water possesses the potential to bring about huge changes in the life of the native.
 #Caption #CaptionForLife #CaptionZindagi'''),
          ),
          //like comment and share widget
          if(type==PostType.text)LikeCommentShare(showSave: showSave,model: model,),
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
              model.createdAt.isNotNull ? model.createdAt!.formatElapsedTimeString() : "",
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
    required this.showSave, required this.model,
  });

  final bool showSave;
  final SocialPostModel model;
  @override
  Widget build(BuildContext context) {
    var provider = context.read<SocialProvider>();
    return Row(
      children: [
        Row(
          children: [
            SvgImage(image: AppSvg.unLike,onTap: () => provider.likePost(id: model.id.toString()),),
            10.width,
            Text(
              "${model.totalLikes ?? 0}",
              style: AppStyle.black12,
            )
          ],
        ),
        20.width,
        InkWell(
          onTap: () {
            _showCommentSheet(context,model.id!);
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
        if(showSave)Row(
          children: [
            SvgImage(image: AppSvg.bookmark),
            10.width,
          ],
        ),
      ],
    );
  }
  _showCommentSheet(BuildContext context,String id){
    AppHelper.showBottomSheet(
        context: context,
        isScrollControlled: true,
        padding: EdgeInsets.zero,
        innerPadding: EdgeInsets.zero,
        child: StatefulBuilder(
            builder: (context,setState) {
              return CommentScreen(id: id,);
            }
        ));
  }
}

