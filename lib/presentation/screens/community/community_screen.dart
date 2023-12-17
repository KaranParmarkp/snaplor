import 'package:flutter/material.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/data/providers/providers.dart';

import '../../../app/utils/utils.dart';
import '../../widgets/widgets.dart';
import 'add_post_screen.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key, this.showBack=false});
  final bool showBack;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: AppStrings.community, showProfile: true,showBack: showBack,communityScreen: true,showNotification: true,),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: AppColors.colorPrimary, onPressed: () {
          AppHelper.showBottomSheet(context: context, isScrollControlled: true,padding: EdgeInsets.zero,
              innerPadding: EdgeInsets.zero,
              child: AddPostScreen(fromMyPost: false,));
      },
      ),
      body: SizedBox.expand(
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
                        Text("Ram Yadav",style: AppStyle.black10Bold,)
                      ],
                    ),
                  ],
                ),
              ),),
            ),
            Expanded(
              child: AppConsumer<SocialProvider, List<SocialPostModel>>(
                taskName: SocialProvider.getPostKey,
                load: (provider) => provider.getPost(),
                successBuilder: (data, provider) => ListView.separated(
                  separatorBuilder: (context, index) => AppDivider(color: AppColors.hintGrey3),
                  itemBuilder: (context, index) => PostCard(model: data[index]),
                  itemCount: data.length,
                  shrinkWrap: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

