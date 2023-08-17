import 'dart:io';

import 'package:flutter/material.dart';

import '../../../app/utils/utils.dart';
import '../../../data/providers/providers.dart';
import '../../widgets/widgets.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final commentController = TextEditingController();
  final commentFocus = FocusNode();
  File? imageFile;
  UploadFileType? fileType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(AppStrings.createPost,style: AppStyle.black14,),
          ),
          AppDivider(color: Colors.black),

          Padding(
            padding: const EdgeInsets.only(top: 20,right: 15,left: 15),
            child: HeaderTextField(
              hint: AppStrings.whatsHappening,
              focusNode: commentFocus,
              controller: commentController,
              borderRadius: 30,bottomPadding: 0,
              maxLines: 5,
            ),
          ),
          Align(
alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 20,right: 15,left: 15),
              child: imageFile!= null ? fileType==1 ? SizedBox(
                  height: 90,width: 90,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(imageFile!,fit: BoxFit.fill,))): Container(
                padding: EdgeInsets.all(15),
                decoration: AppDecoration.skyBlueLightRounded.copyWith(borderRadius: BorderRadius.circular(8),color: AppColors.colorPrimary),
                child: Row(
                  children: [
                    SvgImage(image: fileType==1 ? AppSvg.videoPost : AppSvg.attach,color: AppColors.white),
                    4.width,
                    Expanded(child: Text(imageFile!.path.split('/').last,style: AppStyle.white12,)),
                  ],
                ),
              ):Row(
                children: [
                  Text(AppStrings.add,style: AppStyle.black12,),
                  20.width,
                  InkWell(onTap: () =>  showSelectImageSheet(image: true),child: SvgImage(image: AppSvg.addImage)),
                  10.width,
                  InkWell(onTap: () async => await showSelectImageSheet(image: false),child: SvgImage(image: AppSvg.videoPost)),
                  10.width,
                  InkWell(onTap: () async{
                    imageFile = await  AppHelper.pickFile();
                    if(imageFile!=null)fileType=UploadFileType.file;
                    setState(() {

                    });
                  },child: SvgImage(image: AppSvg.attach)),
                  //10.width,
                  //InkWell(onTap: () {},child: SvgImage(image: AppSvg.happy)),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 15,right: 15,left: 15,bottom: 20),
            child: AppButton(title: AppStrings.createPost,borderRadius: BorderRadius.circular(30),onTap: () {
              if(commentController.isEmpty()){
                AppHelper.showToast(message: "Please enter text");
              }else{
                context.read<SocialProvider>().addPost(message: commentController.text,file: imageFile,type: fileType);
                context.pop();
              }
            },),
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
              if(image)await AppHelper.pickImage(fromCamera: true).then((value) {
                if (value != null) {
                  imageFile = value;
                  fileType=UploadFileType.image;
                  setState(() {});
                }
              });
              else{
                await AppHelper.pickVideo(fromCamera: true).then((value) {
                  if (value != null) {
                    imageFile = value;
                    fileType=UploadFileType.video;
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
              if(image)await AppHelper.pickImage(fromCamera: false).then((value) {
                if (value != null) {
                  imageFile = value;
                  fileType=UploadFileType.image;
                  setState(() {});
                }
              });
              else await AppHelper.pickVideo(fromCamera: false).then((value) {
                if (value != null) {
                  imageFile = value;
                  fileType=UploadFileType.video;
                  setState(() {});
                }
              });
            },
          ),
        ],
      )
    );
  }
}
