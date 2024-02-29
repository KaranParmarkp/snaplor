import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../app/utils/utils.dart';
import '../../../data/models/models.dart';
import '../../../data/providers/providers.dart';
import '../../widgets/widgets.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key, required this.id});

  final String id;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final commentController = TextEditingController();
  final commentFocus = FocusNode();
  PostCommentModel? replyModel;
  double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: commentFocus.hasFocus
            ? context.screenHeight * (0.50)
            : context.screenHeight * (0.90),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: commentFocus.hasFocus
                  ? context.screenHeight * (0.50)
                  : context.screenHeight * (0.90),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          AppStrings.comments,
                          style: AppStyle.black14,
                        ),
                      ),
                      AppDivider(color: Colors.black),
                    ],
                  ),
                  Expanded(
                    child: AppConsumer<SocialProvider, List<PostCommentModel>>(
                      taskName: SocialProvider.getCommentsKey,
                      load: (provider) => provider.getComments(id: widget.id),
                      successBuilder: (data, provider) => Container(
                        padding: EdgeInsets.only(right: 0),
                        margin: EdgeInsets.only(left: 15, right: 0, bottom: 0, top: 15),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) => CommentCard(
                            onShowMoreTap: () {
                              if (provider.getStatus(taskName: SocialProvider.getCommentsRepliesKey) != Status.loading && !data[index].showReplyMore) {
                                provider.getCommentsReplies(
                                    id: data[index].postId!,
                                    commentId: data[index].id!);
                              }
                              data.forEach((element) {
                                element.showReplyMore = element.id==data[index].id ? !data[index].showReplyMore:false;
                              });
                              provider.notify();
                              print(data[index].showReplyMore);
                            },
                            model: data[index],
                            onCloseTap: () {
                              replyModel = null;
                              if(mounted)setState(() {});
                            },
                            onReplyTap: () {
                              replyModel = data[index];
                              if(mounted)setState(() {});
                            },
                            provider: provider,
                            replyWidget: AppConsumer<SocialProvider, List<PostCommentModel>>(
                              taskName: SocialProvider.getCommentsRepliesKey,
                              load: (provider){},
                              loaderBuilder: (p0) => SizedBox(
                                height: 20,
                                width: 70,
                                child: CupertinoActivityIndicator(),
                              ),
                              successBuilder: (data, provider) => Container(
                                padding: EdgeInsets.only(right: 0),
                                margin: EdgeInsets.only(
                                    left: 15, right: 0, bottom: 0, top: 15),
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) => CommentCard(
                                    isReply: true,
                                    model: data[index],
                                    onCloseTap: () {
                                      //replyModel = null;
                                      //if(mounted)setState(() {});
                                    },
                                    onReplyTap: () {
                                      replyModel = data[index];
                                      if(mounted)setState(() {});
                                    },
                                    provider: provider,
                                  ),
                                  itemCount: data.length,
                                  shrinkWrap: true,
                                ),
                              ),
                            ),
                          ),
                          itemCount: data.length,
                          //shrinkWrap: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: replyModel == null ? 80 : 120,
              decoration: AppDecoration.whiteShadow,
              padding:
                  EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
              child: Column(
                children: [
                  if (replyModel != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            AppStrings.replying +
                                " ${replyModel?.user?.name.toStringOrEmpty}",
                            style: AppStyle.black12w400,
                          )),
                          InkWell(
                              onTap: () {
                                replyModel = null;
                                setState(() {});
                              },
                              child: Icon(Icons.close))
                        ],
                      ),
                    ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UserDP(
                          radius: 18,
                          image: context
                              .read<AuthProvider>()
                              .userModel
                              ?.profileImage),
                      10.width,
                      Expanded(
                        child: HeaderTextField(
                          hint: AppStrings.addComment,
                          focusNode: commentFocus,
                          controller: commentController,
                          borderRadius: 30,
                          bottomPadding: 0,
                        ),
                      ),
                      10.width,
                      AppRoundedButton(
                          text: AppStrings.post,
                          color: AppColors.colorPrimary,
                          radius: 30,
                          onTap: () async {
                            AppHelper.hideKeyboard();
                            if (commentController.isEmpty()) {
                              AppHelper.showToast(
                                  message: "Please enter comment");
                              commentFocus.requestFocus();
                            } else {
                              await context
                                  .read<SocialProvider>()
                                  .addCommentPost(
                                      id: widget.id,
                                      message: commentController.text,
                                      commentID: replyModel?.id);
                              commentController.clear();
                              replyModel = null;
                              setState(() {});
                            }
                          },
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class CommentCard extends StatelessWidget {
  const CommentCard(
      {super.key, required this.model, this.onCloseTap, this.onReplyTap, required this.provider,this.isReply=false, this.replyWidget, this.onShowMoreTap});

  final PostCommentModel model;
  final VoidCallback? onCloseTap;
  final Function()? onReplyTap;
  final Function()? onShowMoreTap;
  final SocialProvider provider;
  final bool isReply;
  final Widget? replyWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserDP(radius: 16, image: model.user?.image),
          10.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      model.user!.name.toStringOrEmpty.toCapitalized(),
                      style: AppStyle.black12w700,
                    ),
                    10.width,
                    Text(model.createdAt!.formatElapsedTimeString(),
                        style: AppStyle.grey10w400),
                    Spacer(),
                    PopupMenuButton(
                      child: Container(
                        height: 30,
                        width: 42,
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.more_vert,
                        ),
                      ),
                      iconSize: 10,
                      padding: EdgeInsets.zero,
                      offset: Offset(15, 34),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            child: Row(
                              children: [
                                SvgImage(image: AppSvg.pin),
                                10.width,
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
                                SvgImage(image: AppSvg.eye),
                                10.width,
                                Text(
                                  AppStrings.hide,
                                  style: AppStyle.black12,
                                )
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            onTap: () {
                              provider.deleteComment(
                                  id: model.id.toStringOrEmpty,
                                  postId: model.postId.toStringOrEmpty);
                            },
                            child: Row(
                              children: [
                                SvgImage(image: AppSvg.deleteRed),
                                10.width,
                                Text(
                                  AppStrings.delete,
                                  style: AppStyle.red12,
                                )
                              ],
                            ),
                          ),
                        ];
                      },
                    ),
                    10.width
                  ],
                ),
                Container(
                    width: double.infinity,
                    child: Text(model.comment ?? "",
                        style: AppStyle.black12w400,
                        textAlign: TextAlign.start)),
                6.height,
                Row(
                  children: [
                    SvgImage(image: AppSvg.unLike),
                    6.width,
                    Text(
                      "${model.totalLikes} likes",
                      style: AppStyle.grey10w400,
                    ),
                    20.width,
                    InkWell(
                      onTap: onReplyTap,
                      child: Text(
                        AppStrings.reply,
                        style: AppStyle.grey10w400,
                      ),
                    ),
                  ],
                ),
                6.height,
                if (model.totalReplies != 0 && !isReply /*&& provider.getStatus(taskName: SocialProvider.getCommentsRepliesKey)!= Status.loading*/)InkWell(
                  onTap: onShowMoreTap,
                  child:Row(
                    children: [
                      SizedBox(
                          width: 25,
                          child: AppDivider(
                            thickness: 1,
                          )),
                      6.width,
                      Text(
                        !model.showReplyMore ? AppStrings.view + " ${model.totalReplies} " + AppStrings.moreReplies : "Hide replies",
                        style: AppStyle.grey10w400,
                      ),
                    ],
                  ),
                ),
                if (model.totalReplies != 0 && !isReply && model.showReplyMore)replyWidget ?? SizedBox()

              ],
            ),
          ),
        ],
      ),
    );
  }
}
