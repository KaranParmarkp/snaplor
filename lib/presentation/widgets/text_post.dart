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
              UserDP(),
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
          if(type!=PostType.text)LikeCommentShare(showSave: showSave),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextHashtag(
                name:  type!=PostType.text ? "Madhusudan" : null,
                text: ''' You can write your caption here, so just write blah blah blah and bleh bleh bleh  more of the caption part blah blah blah. The fiery planet is known as the factor of the father. A well-positioned Sun would benefit the native in multiple ways. In July 2022, Sun will transit from the dual sign. It will move in the moon sign of its friend, i.e., Cancer. This combination of fire and water possesses the potential to bring about huge changes in the life of the native.
 #Caption #CaptionForLife #CaptionZindagi'''),
          ),
          //like comment and share widget
          if(type==PostType.text)LikeCommentShare(showSave: showSave),
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

class LikeCommentShare extends StatelessWidget {
  const LikeCommentShare({
    super.key,
    required this.showSave,
  });

  final bool showSave;

  @override
  Widget build(BuildContext context) {
    return Row(
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
        InkWell(
          onTap: () {
            _showFilterSheet(context);
          },
          child: Row(
            children: [
              SvgImage(image: AppSvg.msg),
              10.width,
              Text(
                "145",
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
    );
  }
  _showFilterSheet(BuildContext context){
    AppHelper.showBottomSheet(
        context: context,
        isScrollControlled: true,
        padding: EdgeInsets.zero,
        innerPadding: EdgeInsets.zero,
        child: StatefulBuilder(
            builder: (context,setState) {
              return CommentScreen();
            }
        ));
  }
}

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {

  final commentController = TextEditingController();
  final commentFocus = FocusNode();
  double? height;
  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: commentFocus,
      onFocusChange: (value) {
          height = context.screenHeight * (value? 0.50 : 0.90);
          setState(() {

          });
      },
      child: SizedBox(
        height:context.screenHeight * (0.90),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(AppStrings.comments,style: AppStyle.black14,),
            ),
            AppDivider(color: Colors.black),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 0),
                margin: EdgeInsets.only(left: 15,right: 15,bottom: 0,top: 15),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UserDP(radius: 18),
                        10.width,
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text("RamGopalYadav",style: AppStyle.black12.copyWith(fontWeight: FontWeight.w700),),
                                            10.width,
                                            Text("52 min",style: AppStyle.grey10w400),
                                          ],
                                        ),
                                        4.height,
                                        Text("This is the comment part where user write their thoughts. Baki sab blah blah",style: AppStyle.black12.copyWith(fontWeight: FontWeight.w400),),
                                        6.height,
                                        Row(
                                          children: [
                                            SvgImage(image: AppSvg.unLike),
                                            6.width,
                                            Text(
                                              "52 likes",
                                              style: AppStyle.grey10w400,
                                            ),
                                            20.width,
                                            Text(
                                              AppStrings.reply,
                                              style: AppStyle.grey10w400,
                                            ),
                                          ],
                                        ),
                                        6.height,
                                        Row(
                                          children: [
                                            SizedBox(
                                                width: 25,
                                                child: AppDivider(thickness: 1,)),
                                            6.width,
                                            Text(
                                              AppStrings.view+" 4 "+AppStrings.moreReplies,
                                              style: AppStyle.grey10w400,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  10.width,
                                  PopupMenuButton(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                    itemBuilder: (context) {
                                      return [
                                        PopupMenuItem(child: Row(children: [SvgImage(image: AppSvg.pin),10.width,Text(AppStrings.pinToTop,style: AppStyle.black12,)],),),
                                        PopupMenuItem(child: Row(children: [SvgImage(image: AppSvg.eye),10.width,Text(AppStrings.hide,style: AppStyle.black12,)],),),
                                        PopupMenuItem(child: Row(children: [SvgImage(image: AppSvg.deleteRed),10.width, Text(AppStrings.delete,style: AppStyle.black12.copyWith(color: AppColors.red),)],),),
                                      ];
                                    },),

                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  itemCount: 25,
                  shrinkWrap: true,
                ),
              ),
            ),
            Container(
              height: 80,
              decoration: AppDecoration.whiteShadow,
              padding: EdgeInsets.only(left: 15,right: 15,bottom: 15,top: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UserDP(radius: 18),
                  10.width,
                  Expanded(
                    child: HeaderTextField(
                      hint: AppStrings.searchHere,
                      focusNode: commentFocus,
                      controller: commentController,
                      borderRadius: 30,bottomPadding: 0,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
