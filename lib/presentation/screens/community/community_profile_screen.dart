import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/data/providers/providers.dart';


import '../../widgets/widgets.dart';
import 'add_post_screen.dart';

class CommunityProfileScreen extends StatefulWidget {
  const CommunityProfileScreen({super.key});

  @override
  State<CommunityProfileScreen> createState() => _CommunityProfileScreenState();
}

class _CommunityProfileScreenState extends State<CommunityProfileScreen> {
  int selectedIndex = 0;

  _onTabTap(int index) {
    selectedIndex = index;
    context.read<SocialProvider>().getMyPost(type: selectedIndex==0 ? PostType.image : selectedIndex==1 ? PostType.video : PostType.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: CustomAppBar(
              title: AppStrings.communityProfile, showNotification: true),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: AppColors.colorPrimary, onPressed: () {
            AppHelper.showBottomSheet(context: context, isScrollControlled: true,padding: EdgeInsets.zero,
                innerPadding: EdgeInsets.zero,
                child: AddPostScreen(fromMyPost: true,));
          },
          ),
          body: AppConsumer<SocialProvider, List<SocialPostModel>>(
            taskName: SocialProvider.getMyPostKey,
            load: (provider) {
              provider.getMyPost(type: PostType.all);
              authProvider.userData();
            },
            successBuilder: (data, provider) => SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Column(
                    children: [
                      10.height,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            CircleNetworkImageAvatar(
                                radius: 40,
                                image:
                                authProvider.userModel?.profileImage),
                            20.width,
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        authProvider.userModel!.totalPost.toString(),
                                        style: AppStyle.black14,
                                      ),
                                      5.height,
                                      Text(AppStrings.posts),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        authProvider.userModel!.totalFollowers.toString(),
                                        style: AppStyle.black14,
                                      ),
                                      5.height,
                                      Text(AppStrings.followers),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        authProvider.userModel!.totalFollowing.toString(),
                                        style: AppStyle.black14,
                                      ),
                                      5.height,
                                      Text(AppStrings.following),
                                    ],
                                  ),
                                  //SizedBox()
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      10.height,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: NameVerified(name: authProvider.userModel?.name,verified: authProvider.userModel?.isVerified),
                      ),
                      //4.height,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Html(data: authProvider.userModel!.description ?? authProvider.userModel!.specialization.join(", ").toCapitalized()),
                      ),

                      8.height,
                    ],
                  ),
                  5.height,
                  AppDivider(),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      AppStrings.yourPost,
                      style: AppStyle.black12w400,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  AppDivider(),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => AppDivider(color: AppColors.hintGrey3),
                    itemBuilder: (context, index) => PostCard(model: data[index],fromMyPost: true,),
                    itemCount: data.length,

                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


class TabBarBox extends StatelessWidget {
  const TabBarBox(
      {super.key,
        required this.text,
        required this.image,
        required this.selected,
        required this.onTap});

  final String text;
  final String image;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            10.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgImage(
                  image: image,
                  color: selected ? AppColors.colorPrimary : AppColors.hintGrey,
                ),
                10.width,
                Text(
                  "1500",
                  style: selected ? AppStyle.purple14 : AppStyle.hintGray14,
                )
              ],
            ),
            10.height,
            AppDivider(
                color: selected ? AppColors.colorPrimary : AppColors.hintGrey,
                thickness: 1),
          ],
        ),
      ),
    );
  }
}


