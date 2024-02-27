import 'package:flutter/material.dart';

import '../../../app/utils/utils.dart';
import '../../../data/models/models.dart';
import '../../../data/providers/providers.dart';
import '../../widgets/widgets.dart';

class LikedUsersScreen extends StatelessWidget {
  const LikedUsersScreen({super.key, required this.id});
  final String id;
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
                  child: Text(AppStrings.likes,style: AppStyle.black14,),
                ),
                AppDivider(color: Colors.black),
              ],
            ),
            Expanded(
              child: AppConsumer<SocialProvider, List<PostCommentModel>>(
                taskName: SocialProvider.getLikedUsersKey,
                load: (provider) => provider.getLikedUsers(id:id),
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
                                    name: data[index].user?.name,
                                    //verified: data[index].user?.isVerified.isTrue,
                                    showAst: data[index].user?.role == "astrologer",
                                  ),
                                  Text(
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
