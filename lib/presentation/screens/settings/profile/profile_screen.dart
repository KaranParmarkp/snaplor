import 'package:flutter/material.dart';
import 'package:jyotishee/presentation/screens/settings/profile/bank_details/bank_details_screen.dart';
import 'package:jyotishee/presentation/screens/settings/profile/personal_details/personal_details_screen.dart';

import '../../../../app/utils/utils.dart';
import '../../../../data/models/models.dart';
import '../../../../data/providers/providers.dart';
import '../../../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: AppStrings.profile,
        showNotification: true,
      ),
      body: SizedBox(
        height: double.infinity,
        child: AppConsumer<AuthProvider, UserModel>(
          taskName: AuthProvider.userDataKey,
          load: (provider) => provider.userData(),
          successBuilder: (data,provider) {
            return SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleNetworkImageAvatar(
                      radius: 40,
                      image: data.profileImage),
                  20.width,
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [

                            Text(AppStrings.call),
                            5.height,
                            Text(
                              "${data.totalCallOrders}",
                              style: AppStyle.black14,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(AppStrings.chat),
                            5.height,
                            Text(
                              "${data.totalChatOrders}",
                              style: AppStyle.black14,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(AppStrings.orders),
                            5.height,
                            Text(
                              "${(data.totalChatOrders! + data.totalCallOrders!)}",
                              style: AppStyle.black14,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              6.height,
              NameVerified(name: data.name,verified: data.isVerified),
              6.height,
              if(data.specialization.isNotEmpty)Text(data.specialization.join(", ").toCapitalized(), style: AppStyle.grey12.copyWith(color: AppColors.hintGrey2),),
              if(data.languages.isNotEmpty)Text(data.languages.join("| ").toCapitalized(), style: AppStyle.grey12.copyWith(color: AppColors.hintGrey2),),
              20.height,
              TitleDropdown(text: AppStrings.personalDetails, leadingIcon: SvgImage(image: AppSvg.user),icon: Icon(Icons.keyboard_arrow_right_rounded),onTap: () => context.push(PersonalDetailsScreen(user: data,)),),
              TitleDropdown(text: AppStrings.bankDetails, leadingIcon: SvgImage(image: AppSvg.bank),icon: Icon(Icons.keyboard_arrow_right_rounded),onTap: () => context.push(BankDetailsScreen(user: data,)),),
              // TitleDropdown(text: AppStrings.callRate, leadingIcon: SvgImage(image: AppSvg.call),icon: Icon(Icons.keyboard_arrow_right_rounded)),
              // TitleDropdown(text: AppStrings.chatRate, leadingIcon: SvgImage(image: AppSvg.chat),icon: Icon(Icons.keyboard_arrow_right_rounded)),
              // TitleDropdown(text: AppStrings.callHistory, leadingIcon: SvgImage(image: AppSvg.call),icon: Icon(Icons.keyboard_arrow_right_rounded)),
              // TitleDropdown(text: AppStrings.chatHistory, leadingIcon: SvgImage(image: AppSvg.chat),icon: Icon(Icons.keyboard_arrow_right_rounded)),

            ],
          ),
        ),
      );
          },
        ),

      )
      ,
    );
  }
}
