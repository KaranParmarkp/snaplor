import 'package:flutter/material.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/data/providers/providers.dart';

import '../../../app/utils/utils.dart';
import '../../widgets/widgets.dart';

class JyotisheeSocial extends StatelessWidget {
  const JyotisheeSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: AppStrings.jyotisheeSocial, showProfile: true,),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: AppColors.colorPrimary, onPressed: () {
          AppHelper.showBottomSheet(context: context, isScrollControlled: true,padding: EdgeInsets.zero,
              innerPadding: EdgeInsets.zero,
              child: AddPostScreen());
      },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(15),
                  child: Column(
                  children: [
                    SquareNetworkImageAvatar(
                      radius: 12,
                      height: 80,
                      width: 120,
                      image: "https://images.unsplash.com/photo-1567324216289-97cc4134f626?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
                    ),
                    6.height,
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: AppColors.colorPrimary,
                          child: CircleNetworkImageAvatar(
                              radius: 12,
                              image:
                              "https://images.unsplash.com/photo-1567324216289-97cc4134f626?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
                        ),
                      10.width,
                        Text("Ram Yadav",style: AppStyle.black12.copyWith(fontSize: 10,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ],
                ),
              ),),
            ),
            PostCard(type: PostType.text,showSave: true,model: SocialPostModel()),
            PostCard(type: PostType.video,showSave: true,model: SocialPostModel()),
            PostCard(type: PostType.text,showSave: true,model: SocialPostModel()),
            PostCard(type: PostType.image,showSave: true,model: SocialPostModel()),
          ],
        ),
      ),
    );
  }
}

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
