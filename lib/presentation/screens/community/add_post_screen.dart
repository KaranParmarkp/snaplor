import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jyotishee/data/models/models.dart';

import '../../../app/utils/utils.dart';
import '../../../data/providers/providers.dart';
import '../../widgets/widgets.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen(
      {super.key, required this.fromMyPost, this.model, this.isRepost = false});

  final bool fromMyPost;
  final SocialPostModel? model;
  final bool isRepost;

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final commentController = TextEditingController();
  final commentFocus = FocusNode();
  File? imageFile;
  UploadFileType? fileType;

  @override
  void initState() {
    super.initState();
    if (widget.model.isNotNull && !widget.isRepost) {
      commentController.text = widget.model!.content.toStringOrEmpty;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              widget.model != null
                  ? widget.isRepost ? "New thought": AppStrings.editPost
                  : AppStrings.createPost,
              style: AppStyle.black14,
            ),
          ),
          AppDivider(color: Colors.black),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
            child: HeaderTextField(
              hint: AppStrings.shareThought,
              focusNode: commentFocus,
              controller: commentController,
              borderRadius: 15,
              bottomPadding: 0,
              maxLines: 5,
            ),
          ),
          if (widget.model == null)
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
                child: imageFile != null
                    ? fileType == UploadFileType.image
                        ? SizedBox(
                            height: 150,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.file(
                                        imageFile!,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0,right: 0),
                                    child: InkWell(
                                      onTap: () {
                                        imageFile=null;
                                        setState(() {

                                        });
                                      },
                                      child: CircleAvatar(
                                          radius: 20,
                                          backgroundColor: AppColors.colorPrimary,
                                          child: SvgImage(image: AppSvg.deleteRed,color: AppColors.white,)),
                                    ),
                                  ),
                                ),
                              ],
                            ))
                        : Container(
                            padding: EdgeInsets.all(15),
                            decoration: AppDecoration.skyBlueLightRounded
                                .copyWith(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.colorPrimary),
                            child: Row(
                              children: [
                                SvgImage(
                                    image: fileType == 1
                                        ? AppSvg.videoPost
                                        : AppSvg.attach,
                                    color: AppColors.white),
                                4.width,
                                Expanded(
                                    child: Text(
                                  imageFile!.path.split('/').last,
                                  style: AppStyle.white12,
                                )),
                              ],
                            ),
                          )
                    : Row(
                        children: [
                          Text(
                            AppStrings.add,
                            style: AppStyle.black12,
                          ),
                          20.width,
                          InkWell(
                              onTap: () => showSelectImageSheet(image: true),
                              child: SvgImage(image: AppSvg.addImage)),
                          10.width,
                          //InkWell(onTap: () async => await showSelectImageSheet(image: false),child: SvgImage(image: AppSvg.videoPost)),
                          //10.width,
                          /*InkWell(onTap: () async{
                    imageFile = await  AppHelper.pickFile();
                    if(imageFile!=null)fileType=UploadFileType.file;
                    setState(() {

                    });
                  },child: SvgImage(image: AppSvg.attach)),*/
                          //10.width,
                          //InkWell(onTap: () {},child: SvgImage(image: AppSvg.happy)),
                        ],
                      ),
              ),
            ),
          if (widget.model != null && widget.isRepost)Container(
              width: double.infinity,
              decoration: AppDecoration.roundedBorder,
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 08),
                    child: Row(
                      children: [
                        UserDP(image: widget.model!.user?.image,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: NameVerified(
                              name: widget.model!.user?.userName ?? "Anonymous",
                              verified: /*widget.model!.user?.isVerified==*/true,
                              showAst: widget.model!.user?.role == "astrologer",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (widget.model!.type != PostType.text)Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Stack(
                      alignment: Alignment.center,
                      fit: StackFit.passthrough,
                      clipBehavior: Clip.none,
                      children: [
                        if (widget.model!.type == PostType.image)
                          SquareNetworkImageAvatar(
                            radius: 0,
                            height: 300,
                            width: double.infinity,
                            image: widget.model!.imageUrl,
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0,right: 10,left: 10),
                    child: TextHashtag(
                        name: widget.model!.type != PostType.text
                            ? widget.model!.user?.name ?? "Madhusudan"
                            : null,
                        text: widget.model!.content ?? ""),
                  ),

                ],
              )
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 20),
            child: AppButton(
              title: widget.model != null
                   ? widget.isRepost ? "Repost": AppStrings.editPost
                  : AppStrings.createPost,
              borderRadius: BorderRadius.circular(30),
              onTap: () async {
                if (commentController.isEmpty()) {
                  AppHelper.showToast(message: "Please enter text");
                } else {
                  if (widget.isRepost) {
                    await context.read<SocialProvider>().rePost(
                        message: commentController.text,
                        file: imageFile,
                        type: fileType,
                        fromMyPost: widget.fromMyPost,
                        postId: widget.model!.id!);
                  } else {
                    await context.read<SocialProvider>().addPost(
                        message: commentController.text,
                        file: imageFile,
                        type: fileType,
                        fromMyPost: widget.fromMyPost,
                        postId: widget.model?.id);
                  }
                  context.read<AuthProvider>().userData();
                  context.pop();
                }
              },
            ),
          )
        ],
      ),
    );
  }

  showSelectImageSheet({required bool image}) async {
    await AppHelper.showBottomSheet(
        context: context,
        isDismissible: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_rounded),
              title: const Text('Camera'),
              onTap: () async {
                Navigator.pop(context);
                if (image)
                  await AppHelper.pickImage(fromCamera: true).then((value) {
                    if (value != null) {
                      imageFile = value;
                      fileType = UploadFileType.image;
                      setState(() {});
                    }
                  });
                else {
                  await AppHelper.pickVideo(fromCamera: true).then((value) {
                    if (value != null) {
                      imageFile = value;
                      fileType = UploadFileType.video;
                      setState(() {});
                    }
                  });
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Gallery'),
              onTap: () async {
                Navigator.pop(context);
                if (image)
                  await AppHelper.pickImage(fromCamera: false).then((value) {
                    if (value != null) {
                      imageFile = value;
                      fileType = UploadFileType.image;
                      setState(() {});
                    }
                  });
                else
                  await AppHelper.pickVideo(fromCamera: false).then((value) {
                    if (value != null) {
                      imageFile = value;
                      fileType = UploadFileType.video;
                      setState(() {});
                    }
                  });
              },
            ),
          ],
        ));
  }
}
