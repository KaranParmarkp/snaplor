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
          Padding(
            padding: const EdgeInsets.only(top: 20,right: 15,left: 15),
            child: Row(
              children: [
                Text(AppStrings.add,style: AppStyle.black12,),
                20.width,
                InkWell(onTap: () {},child: SvgImage(image: AppSvg.addImage)),
                10.width,
                InkWell(onTap: () {},child: SvgImage(image: AppSvg.videoPost)),
                10.width,
                InkWell(onTap: () {},child: SvgImage(image: AppSvg.attach)),
                10.width,
                InkWell(onTap: () {},child: SvgImage(image: AppSvg.happy)),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 15,right: 15,left: 15,bottom: 20),
            child: AppButton(title: AppStrings.createPost,borderRadius: BorderRadius.circular(30),onTap: () {
              if(commentController.isEmpty()){
                AppHelper.showToast(message: "Please enter text");
              }else{
                context.read<SocialProvider>().addPost(message: commentController.text);
                context.pop();
              }
            },),
          )
        ],
      ),
    );
  }
}
