import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/constants/app_strings.dart';
import 'package:jyotishee/presentation/screens/settings/profile/bank_details/bank_details_screen.dart';
import 'package:jyotishee/presentation/screens/settings/profile/personal_details/personal_details_screen.dart';
import 'package:jyotishee/presentation/widgets/custom_app_bar.dart';

import '../../../../app/utils/utils.dart';
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
      body: SingleChildScrollView(
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
                      image:
                      "https://images.unsplash.com/photo-1567324216289-97cc4134f626?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
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
                              "45",
                              style: AppStyle.black14,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(AppStrings.chat),
                            5.height,
                            Text(
                              "45",
                              style: AppStyle.black14,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(AppStrings.orders),
                            5.height,
                            Text(
                              "45",
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
              NameVerified(),
              6.height,
              Text("Vedic, Card Reader, Tarot Reader", style: AppStyle.grey12.copyWith(color: AppColors.hintGrey2),),
              Text("Hindi | English", style: AppStyle.grey12.copyWith(color: AppColors.hintGrey2),),
              20.height,
              TitleDropdown(text: AppStrings.personalDetails, leadingIcon: SvgImage(image: AppSvg.user),icon: Icon(Icons.keyboard_arrow_right_rounded),onTap: () => context.push(PersonalDetailsScreen()),),
              TitleDropdown(text: AppStrings.bankDetails, leadingIcon: SvgImage(image: AppSvg.bank),icon: Icon(Icons.keyboard_arrow_right_rounded),onTap: () => context.push(BankDetailsScreen()),),
              TitleDropdown(text: AppStrings.callRate, leadingIcon: SvgImage(image: AppSvg.call),icon: Icon(Icons.keyboard_arrow_right_rounded)),
              TitleDropdown(text: AppStrings.chatRate, leadingIcon: SvgImage(image: AppSvg.chat),icon: Icon(Icons.keyboard_arrow_right_rounded)),
              TitleDropdown(text: AppStrings.callHistory, leadingIcon: SvgImage(image: AppSvg.call),icon: Icon(Icons.keyboard_arrow_right_rounded)),
              TitleDropdown(text: AppStrings.chatHistory, leadingIcon: SvgImage(image: AppSvg.chat),icon: Icon(Icons.keyboard_arrow_right_rounded)),

            ],
          ),
        ),
      ),
    );
  }
}
