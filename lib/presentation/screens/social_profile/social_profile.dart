import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/data/providers/providers.dart';
import '../../widgets/widgets.dart';
import 'add_post_screen.dart';

class SocialProfile extends StatefulWidget {
  const SocialProfile({super.key});

  @override
  State<SocialProfile> createState() => _SocialProfileState();
}

class _SocialProfileState extends State<SocialProfile> {
  int selectedIndex = 0;

  /*_onTabTap(int index) {
    selectedIndex = index;
    context.read<SocialProvider>().getMyPost(type: selectedIndex==0 ? PostType.image : selectedIndex==1 ? PostType.video : PostType.text);
    setState(() {});
  }
*/
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
  builder: (context, provider, child) {
  return Scaffold(
      appBar: CustomAppBar(
          title: AppStrings.jyotisheeSocial, showNotification: true),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: AppColors.colorPrimary, onPressed: () {
        AppHelper.showBottomSheet(context: context, isScrollControlled: true,padding: EdgeInsets.zero,
            innerPadding: EdgeInsets.zero,
            child: AddPostScreen());
      },
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        height: context.screenHeight,
        child: Column(
          children: [
            //header
            Row(
              children: [
                CircleNetworkImageAvatar(
                    radius: 40,
                    image:
                        provider.userModel?.profileImage),
                20.width,
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "45",
                            style: AppStyle.black14,
                          ),
                          5.height,
                          Text(AppStrings.posts),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "45",
                            style: AppStyle.black14,
                          ),
                          5.height,
                          Text(AppStrings.posts),
                        ],
                      ),
                      SizedBox()
                    ],
                  ),
                ),
              ],
            ),
            10.height,
            NameVerified(name: provider.userModel?.name,verified: provider.userModel?.isVerified),
            4.height,
            Text(
              provider.userModel!.description ?? provider.userModel!.specialization.join(", ").toCapitalized(),
              style: AppStyle.greyHint12,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            10.height,
            Expanded(
              child: AppConsumer<SocialProvider, List<SocialPostModel>>(
                taskName: SocialProvider.getMyPostKey,
                //load: (provider) => provider.getMyPost(type: selectedIndex==0 ? PostType.image : selectedIndex==1 ? PostType.video : PostType.text),
                load: (provider) => provider.getMyPost(type: PostType.all),
                successBuilder: (data, provider) => ListView.builder(
                  itemBuilder: (context, index) => PostCard(showShadow: true,model: data[index],fromMyPost: true),
                  itemCount: data.length,
                  shrinkWrap: true,
                ),
              ),
            ),
            /// old flow commented showing posts in grids.
            /*Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      TabBarBox(
                        text: "103",
                        image: AppSvg.image,
                        selected: selectedIndex == 0,
                        onTap: () => _onTabTap(0),
                      ),
                      TabBarBox(
                        text: "103",
                        image: AppSvg.video,
                        selected: selectedIndex == 1,
                        onTap: () => _onTabTap(1),
                      ),
                      TabBarBox(
                        text: "103",
                        image: AppSvg.type,
                        selected: selectedIndex == 2,
                        onTap: () => _onTabTap(2),
                      ),
                    ],
                  ),
                  10.height,
                  *//*if (selectedIndex == 0 || selectedIndex == 1)
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 14),
                        itemCount: 40,
                        itemBuilder: (context, index) => Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          fit: StackFit.passthrough,
                          children: [
                            SquareNetworkImageAvatar(
                              radius: 12,
                              image:
                                  "https://images.unsplash.com/photo-1567324216289-97cc4134f626?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
                            ),
                            if (selectedIndex == 1) Center(child: PlayButton())
                          ],
                        ),
                      ),
                    ),
                  *//*
                  Expanded(
                      child: AppConsumer<SocialProvider, List<SocialPostModel>>(
                        taskName: SocialProvider.getMyPostKey,
                        //load: (provider) => provider.getMyPost(type: selectedIndex==0 ? PostType.image : selectedIndex==1 ? PostType.video : PostType.text),
                        load: (provider) => provider.getMyPost(type: PostType.all),
                        successBuilder: (data, provider) => ListView.builder(
                          itemBuilder: (context, index) => PostCard(showShadow: true,model: data[index],fromMyPost: true),
                          itemCount: data.length,
                          shrinkWrap: true,
                        ),
                      ),
                    ),

                ],
              ),
            )*/
          ],
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


