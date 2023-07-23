import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';
import 'widgets.dart';

class Post extends StatelessWidget {
  const Post({
    super.key,  this.showShadow=false, this.type=PostType.text,this.showSave=false
  });
  final bool showShadow;
  final bool showSave;
  final PostType type;
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
              CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.colorPrimary,
                child: CircleNetworkImageAvatar(
                    radius: 20,
                    image:
                    "https://images.unsplash.com/photo-1567324216289-97cc4134f626?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      NameVerified(),
                      Text(
                        "Exp : 10+ years | 125486 Orders",
                        style: AppStyle.grey12.copyWith(
                            color: AppColors.hintGrey2,
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
              Icon(
                Icons.more_vert_rounded,
                color: AppColors.greyDark,
              )
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
          if(type!=PostType.text)Row(
            children: [
              Row(
                children: [
                  SvgImage(image: AppSvg.unLike),
                  10.width,
                  Text(
                    "525",
                    style: AppStyle.black12,
                  )
                ],
              ),
              20.width,
              Row(
                children: [
                  SvgImage(image: AppSvg.msg),
                  10.width,
                  Text(
                    "145",
                    style: AppStyle.black12,
                  )
                ],
              ),
              20.width,
              Row(
                children: [
                  SvgImage(image: AppSvg.share),
                  10.width,
                  Text(
                    "25",
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextHashtag(
                name:  type!=PostType.text ? "Madhusudan" : null,
                text: ''' You can write your caption here, so just write blah blah blah and bleh bleh bleh  more of the caption part blah blah blah. The fiery planet is known as the factor of the father. A well-positioned Sun would benefit the native in multiple ways. In July 2022, Sun will transit from the dual sign. It will move in the moon sign of its friend, i.e., Cancer. This combination of fire and water possesses the potential to bring about huge changes in the life of the native.
 #Caption #CaptionForLife #CaptionZindagi'''),
          ),
          //like comment and share widget
          if(type==PostType.text)Row(
            children: [
              Row(
                children: [
                  SvgImage(image: AppSvg.unLike),
                  10.width,
                  Text(
                    "525",
                    style: AppStyle.black12,
                  )
                ],
              ),
              20.width,
              Row(
                children: [
                  SvgImage(image: AppSvg.msg),
                  10.width,
                  Text(
                    "145",
                    style: AppStyle.black12,
                  )
                ],
              ),
              20.width,
              Row(
                children: [
                  SvgImage(image: AppSvg.share),
                  10.width,
                  Text(
                    "25",
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
          ),
          10.height,
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "View all 145 comments",
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
              "7 Hour ago",
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