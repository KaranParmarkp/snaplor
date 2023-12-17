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
            Column(
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
                AppConsumer<SocialProvider, List<PostCommentModel>>(
                  taskName: SocialProvider.getCommentsKey,
                  load: (provider) => provider.getComments(id: widget.id),
                  successBuilder: (data, provider) => Container(
                    padding: EdgeInsets.only(right: 0),
                    margin: EdgeInsets.only(
                        left: 15, right: 15, bottom: 0, top: 15),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) => CommentCard(
                        model: data[index],
                        onCloseTap: () {
                         // replyModel = null;
                         // if(mounted)setState(() {});
                        },
                        onReplyTap: (model) {
                         // replyModel = model;
                         // if(mounted)setState(() {});
                        },
                        provider: provider,
                      ),
                      itemCount: data.length,
                      shrinkWrap: true,
                    ),
                  ),
                ),
              ],
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
      {super.key, required this.model, this.onCloseTap, this.onReplyTap, required this.provider,this.isReply=false});

  final PostCommentModel model;
  final VoidCallback? onCloseTap;
  final Function(PostCommentModel? model)? onReplyTap;
  final SocialProvider provider;
  final bool isReply;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserDP(radius: 18, image: model.user?.image),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                model.user!.name!.toCapitalized(),
                                style: AppStyle.black12w700,
                              ),
                              10.width,
                              Text(model.createdAt!.formatElapsedTimeString(),
                                  style: AppStyle.grey10w400),
                            ],
                          ),
                          4.height,
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
                                onTap: onReplyTap!(model),
                                child: Text(
                                  AppStrings.reply,
                                  style: AppStyle.grey10w400,
                                ),
                              ),
                            ],
                          ),
                          6.height,
                          if (model.totalReplies != 0)InkWell(
                            onTap: () {
                              if (provider.getStatus(
                                  taskName: SocialProvider
                                      .getCommentsRepliesKey) !=
                                  Status.Loading)
                                provider.getCommentsReplies(
                                    id: model.postId!, commentId: model.id!);
                            },
                            child: provider.getStatus(
                                taskName: SocialProvider
                                    .getCommentsRepliesKey) ==
                                Status.Loading
                                ? SizedBox(
                              height: 20,
                              width: 70,
                              child: CupertinoActivityIndicator(),
                            )
                                : Row(
                              children: [
                                SizedBox(
                                    width: 25,
                                    child: AppDivider(
                                      thickness: 1,
                                    )),
                                6.width,
                                Text(
                                  AppStrings.view +
                                      " ${model.totalReplies} " +
                                      AppStrings.moreReplies,
                                  style: AppStyle.grey10w400,
                                ),
                              ],
                            ),
                          ),
                          AppConsumer<SocialProvider, List<PostCommentModel>>(
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
                                  left: 15, right: 15, bottom: 0, top: 15),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => CommentCard(
                                  model: data[index],
                                  onCloseTap: onCloseTap,
                                  onReplyTap: onReplyTap!(data[index]),
                                  provider: provider,
                                ),
                                itemCount: data.length,
                                shrinkWrap: true,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    10.width,
                    PopupMenuButton(
                      padding: EdgeInsets.zero,
                      offset: Offset(20, 40),
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
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
