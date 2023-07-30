import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/constants/app_decoration.dart';
import 'package:jyotishee/app/utils/constants/app_images.dart';
import 'package:jyotishee/app/utils/constants/app_strings.dart';
import 'package:jyotishee/app/utils/constants/app_style.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/screens/chat/chat_support_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../app/utils/constants/app_colors.dart';
import '../../widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  PackageInfo? packageInfo;
  init() async {
    packageInfo = await PackageInfo.fromPlatform();
  }
  @override
  void initState() {
    super.initState();
    init();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: AppStrings.settings,
        showProfile: true,
        showNotification: true,
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: SettingImageCard(image: AppSvg.document,text: AppStrings.instruction,desc: AppStrings.understandableInstruction,onTap: () {},)),
                  10.width,
                  Expanded(child: SettingImageCard(image: AppSvg.callHelp,text: AppStrings.youNeedHelp,desc: AppStrings.contactSupport,onTap:() => context.push(ChatSupportScreen()),)),
                ],
              ),
              TitleDropdown(text: AppStrings.profile, leadingIcon: SvgImage(image: AppSvg.user),icon: Icon(Icons.keyboard_arrow_right_rounded)),
              TitleDropdown(text: AppStrings.notification, leadingIcon: SvgImage(image: AppSvg.bell),icon: Icon(Icons.keyboard_arrow_right_rounded)),
              TitleDropdown(text: AppStrings.language, leadingIcon: SvgImage(image: AppSvg.language),icon: Icon(Icons.keyboard_arrow_right_rounded)),
              TitleDropdown(text: AppStrings.faqs, leadingIcon: SvgImage(image: AppSvg.terms),icon: Icon(Icons.keyboard_arrow_right_rounded)),
              TitleDropdown(text: AppStrings.terms, leadingIcon: SvgImage(image: AppSvg.terms),icon: Icon(Icons.keyboard_arrow_right_rounded)),
              TitleDropdown(text: AppStrings.privacy, leadingIcon: SvgImage(image: AppSvg.privacy),icon: Icon(Icons.keyboard_arrow_right_rounded)),
              TitleDropdown(text: AppStrings.version,leadingIcon: SvgImage(image: AppSvg.terms),icon: Text(packageInfo?.version ?? '')),
              TitleDropdown(text: AppStrings.logOut,fontColor: AppColors.red, leadingIcon: SvgImage(image: AppSvg.logout),),
            ],
          ),
        ),
      ),
    );
  }
}
class SettingImageCard extends StatelessWidget {
  const SettingImageCard({super.key, required this.image, required this.text, required this.desc, this.onTap});
  final String image;
  final String text;
  final String desc;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.whiteShadowRounded,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              width: 40,
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.centerLeft,
              decoration: AppDecoration.whiteShadowRounded.copyWith(
                  color: AppColors.hintGrey3,boxShadow: [],
                  borderRadius: BorderRadius.circular(8)
              ),
              child: SvgImage(image: image),
            ),
            Text(text,style: AppStyle.black14Bold,),
            Text(desc,style: AppStyle.grey12,),
          ],
        ),
      ),
    );
  }
}
