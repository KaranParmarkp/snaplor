import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/screens/follow/followers_screen.dart';

import '../../widgets/widgets.dart';
import 'add_post_screen.dart';

class CommunityProfileScreen extends StatefulWidget {
  const CommunityProfileScreen({super.key});

  @override
  State<CommunityProfileScreen> createState() => _CommunityProfileScreenState();
}

class _CommunityProfileScreenState extends State<CommunityProfileScreen> {
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
            backgroundColor: AppColors.colorPrimary,
            onPressed: () {
              AppHelper.showBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  padding: EdgeInsets.zero,
                  innerPadding: EdgeInsets.zero,
                  child: AddPostScreen(
                    fromMyPost: true,
                  ));
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
                                image: authProvider.userModel?.profileImage),
                            20.width,
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        authProvider.userModel!.totalPost
                                            .toString(),
                                        style: AppStyle.black14,
                                      ),
                                      5.height,
                                      Text(AppStrings.posts),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () => showFollowerOrFollowList(
                                        context,
                                        authProvider.userModel!.id,
                                        true),
                                    child: Column(
                                      children: [
                                        Text(
                                          authProvider.userModel!.totalFollowers
                                              .toString(),
                                          style: AppStyle.black14,
                                        ),
                                        5.height,
                                        Text(AppStrings.followers),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => showFollowerOrFollowList(
                                        context,
                                        authProvider.userModel!.id,
                                        false),
                                    child: Column(
                                      children: [
                                        Text(
                                          authProvider.userModel!.totalFollowing
                                              .toString(),
                                          style: AppStyle.black14,
                                        ),
                                        5.height,
                                        Text(AppStrings.following),
                                      ],
                                    ),
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
                        child: NameVerified(
                            name: authProvider.userModel?.name,
                            verified: authProvider.userModel?.isVerified),
                      ),
                      //4.height,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Html(
                            data: authProvider.userModel!.description ??
                                authProvider.userModel!.specialization
                                    .join(", ")
                                    .toCapitalized()),
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
                    separatorBuilder: (context, index) =>
                        AppDivider(color: AppColors.hintGrey3),
                    itemBuilder: (context, index) => PostCard(
                      model: data[index],
                      fromMyPost: true,
                    ),
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

class CommunityUserProfileScreen extends StatefulWidget {
  const CommunityUserProfileScreen({super.key, required this.id});

  final String id;

  @override
  State<CommunityUserProfileScreen> createState() =>
      _CommunityUserProfileScreenState();
}

class _CommunityUserProfileScreenState
    extends State<CommunityUserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, p, child) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: CustomAppBar(
              title: AppStrings.communityProfile, showNotification: true),
          body: AppConsumer<SocialProvider, List<SocialPostModel>>(
            taskName: SocialProvider.getUserPostKey,
            load: (provider) {
              provider.getUserPost(id: widget.id);
            },
            successBuilder: (data, provider) => SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  AppConsumer<SocialProvider, UserModel>(
                    taskName: SocialProvider.getUserDetailsKey,
                    load: (provider) {
                      provider.getUserDetails(id: widget.id);
                    },
                    successBuilder: (UserModel data, SocialProvider provider) {
                      return Column(
                        children: [
                          10.height,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                CircleNetworkImageAvatar(
                                    radius: 40, image: data.profileImage),
                                20.width,
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            data!.totalPost.toString(),
                                            style: AppStyle.black14,
                                          ),
                                          5.height,
                                          Text(AppStrings.posts),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () => showFollowerOrFollowList(
                                            context, data!.id, true),
                                        child: Column(
                                          children: [
                                            Text(
                                              data!.totalFollowers.toString(),
                                              style: AppStyle.black14,
                                            ),
                                            5.height,
                                            Text(AppStrings.followers),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => showFollowerOrFollowList(
                                            context, data!.id, false),
                                        child: Column(
                                          children: [
                                            Text(
                                              data!.totalFollowing.toString(),
                                              style: AppStyle.black14,
                                            ),
                                            5.height,
                                            Text(AppStrings.following),
                                          ],
                                        ),
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
                            child: NameVerified(
                                name: data.name.toStringOrEmpty.toTitleCase(), verified: data.isVerified??false),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: AppRoundedButton(
                                onTap: () {
                                  provider.followUnFollow(id: data.id,isFollow: data.isFollow.isFalse,onSuccess: () {
                                    provider.getUserPost(id: widget.id);
                                  },);
                                },
                                color: AppColors.colorPrimary, text: data.isFollow.isTrue ? AppStrings.following : AppStrings.follow),
                          ),
                          //4.height,
                          if(data!.description.isNotNull)Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Html(
                                data: data!.description ??
                                    data!.specialization
                                        .join(", ")
                                        .toCapitalized()),
                          ),

                          8.height,
                        ],
                      );
                    },
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
                    separatorBuilder: (context, index) =>
                        AppDivider(color: AppColors.hintGrey3),
                    itemBuilder: (context, index) => PostCard(
                      model: data[index],
                      fromMyPost: true,
                    ),
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
