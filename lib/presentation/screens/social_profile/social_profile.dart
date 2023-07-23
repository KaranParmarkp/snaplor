import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/screens/social_profile/jyotishee_social.dart';
import '../../widgets/widgets.dart';

class SocialProfile extends StatefulWidget {
  const SocialProfile({super.key});

  @override
  State<SocialProfile> createState() => _SocialProfileState();
}

class _SocialProfileState extends State<SocialProfile> {
  int selectedIndex = 0;

  _onTabTap(int index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: AppStrings.jyotisheeSocial, showNotification: true),
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
                        "https://images.unsplash.com/photo-1567324216289-97cc4134f626?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
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
            InkWell(onTap: () => context.push(JyotisheeSocial()),child: NameVerified()),
            4.height,
            Text(
              "Astrology is a predictive science with its own sets of methods, claims and findings that have forever inspired and allowed people with insights into different aspects of their life. Astrology, with its wows and hows, is contentful and approving enough to make people a believer of the same.",
              style: AppStyle.grey12.copyWith(color: AppColors.hintGrey2),
              maxLines: 3,
            ),
            10.height,
            Expanded(
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
                  if (selectedIndex == 0 || selectedIndex == 1)
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
                  if (selectedIndex == 2)
                    Expanded(
                        child: ListView.builder(
                      itemBuilder: (context, index) => Post(showShadow: true,),
                    ))
                ],
              ),
            )
          ],
        ),
      ),
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
                  style: AppStyle.purple14.copyWith(
                    color:
                        selected ? AppColors.colorPrimary : AppColors.hintGrey,
                  ),
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


