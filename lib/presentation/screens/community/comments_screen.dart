import 'package:flutter/material.dart';

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
  double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height:commentFocus.hasFocus ? context.screenHeight * (0.50): context.screenHeight * (0.90),
        child : Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(AppStrings.comments,style: AppStyle.black14,),
                    ),
                    AppDivider(color: Colors.black),
                  ],
                ),
                AppConsumer<SocialProvider, List<PostCommentModel>>(
                  taskName: SocialProvider.getCommentsKey,
                  load: (provider) => provider.getComments(id: widget.id),
                  successBuilder: (data, provider) =>  Container(
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
                            UserDP(radius: 18,image: data[index].user?.image),
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
                                                Text(data[index].user!.name!.toCapitalized(),style: AppStyle.black12w700,),
                                                10.width,
                                                Text(data[index].createdAt!.formatElapsedTimeString(),style: AppStyle.grey10w400),
                                              ],
                                            ),
                                            4.height,
                                            Container(
                                                width: double.infinity,
                                                child: Text(data[index].comment??"",style: AppStyle.black12w400,textAlign: TextAlign.start)),
                                            6.height,
                                            Row(
                                              children: [
                                                SvgImage(image: AppSvg.unLike),
                                                6.width,
                                                Text(
                                                  "${data[index].totalLikes} likes",
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
                                            if(data[index].totalReplies!=0)Row(
                                              children: [
                                                SizedBox(
                                                    width: 25,
                                                    child: AppDivider(thickness: 1,)),
                                                6.width,
                                                Text(
                                                  AppStrings.view+" ${data[index].totalReplies} "+AppStrings.moreReplies,
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
                                            PopupMenuItem(child: Row(children: [SvgImage(image: AppSvg.deleteRed),10.width, Text(AppStrings.delete,style: AppStyle.red12,)],),),
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
                      itemCount: data.length,
                      shrinkWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 80,
              decoration: AppDecoration.whiteShadow,
              padding: EdgeInsets.only(left: 15,right: 15,bottom: 15,top: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UserDP(radius: 18,image: context.read<AuthProvider>().userModel?.profileImage),
                  10.width,
                  Expanded(
                    child: HeaderTextField(
                      hint: AppStrings.addComment,
                      focusNode: commentFocus,
                      controller: commentController,
                      borderRadius: 30,bottomPadding: 0,
                    ),
                  ),
                  10.width,
                  AppRoundedButton(
                      text: AppStrings.post,
                      color: AppColors.colorPrimary,
                      radius: 30,
                      onTap: () async {
                        AppHelper.hideKeyboard();
                        if(commentController.isEmpty()){
                          AppHelper.showToast(message: "Please enter comment");
                          commentFocus.requestFocus();
                        }else{
                          await context.read<SocialProvider>().addCommentPost(id: widget.id, message: commentController.text);
                          commentController.clear();
                        }
                      },
                      padding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                ],
              ),
            )
          ],
        )
    );
  }
}
