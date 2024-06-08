import 'package:flutter/material.dart';
import 'package:jyotishee/data/models/follower_model.dart';

import '../../../app/utils/utils.dart';
import '../../../data/models/models.dart';
import '../../../data/providers/providers.dart';
import '../../widgets/widgets.dart';

showFollowerOrFollowList(BuildContext context, String id, bool isFollower) async {
  await AppHelper.showBottomSheet(
      context: context,
      isScrollControlled: true,
      padding: EdgeInsets.zero,
      innerPadding: EdgeInsets.zero,
      child: StatefulBuilder(builder: (context, setState) {
        return FollowersScreen(
          id: id,isFollower: isFollower,
        );
      }));
  //provider.getPost(refresh: true);
}
class FollowersScreen extends StatelessWidget {
  const FollowersScreen({super.key, required this.id, required this.isFollower});
  final String id;
  final bool isFollower;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.screenHeight * (0.90),
        child : Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(isFollower ? AppStrings.followers:AppStrings.following,style: AppStyle.black14,),
                ),
                AppDivider(color: Colors.black),
              ],
            ),
            Expanded(
              child: AppConsumer<SocialProvider, List<FollowerModel>>(
                taskName: SocialProvider.followerListKey,
                load: (provider) => provider.followerList(id:id,isFollow: isFollower),
                successBuilder: (data, provider) =>  Container(
                  padding: EdgeInsets.only(right: 0),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => AppDivider(color: AppColors.hintGrey3),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          UserDP(image: data[index].user?.image,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  NameVerified(
                                    id: data[index].user?.userName,
                                    name: data[index].user?.name.toStringOrEmpty.toTitleCase(),
                                    showAst: data[index].user?.role == "astrologer",
                                  ),
                                  if(data[index].user?.role == "astrologer")Text(
                                    "Exp : ${data[index].user?.experience} years | ${data[index].user
                                        ?.order} Orders",
                                    style: AppStyle.grey12.copyWith(
                                        color: AppColors.hintGrey2,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
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
            ),
          ],
        )
    );
  }
}
