import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/screens/chat/chat_support_screen.dart';
import 'package:jyotishee/presentation/screens/settings/language_screen.dart';
import 'package:jyotishee/presentation/screens/settings/profile/notification_settings/notification_settings_screen.dart';
import 'package:jyotishee/presentation/screens/settings/profile/profile_screen.dart';
import 'package:jyotishee/presentation/screens/settings/terms_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../data/providers/auth_provider.dart';
import '../../widgets/widgets.dart';
import 'faq_screen.dart';

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
        showProfile: false,
        onBackTap: () {},
        showNotification: false,
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: SettingImageCard(
                    image: AppSvg.document,
                    text: AppStrings.instruction,
                    desc: AppStrings.understandableInstruction,
                    onTap: () {
                      context.push(ChatSupportScreen());
                    },
                  )),
                  10.width,
                  Expanded(
                      child: SettingImageCard(
                    image: AppSvg.callHelp,
                    text: AppStrings.youNeedHelp,
                    desc: AppStrings.contactSupport,
                    onTap: () => AppHelper.showHelpDialog(context),
                  )),
                ],
              ),
              //TitleDropdown(text: AppStrings.profile, leadingIcon: SvgImage(image: AppSvg.user),icon: Icon(Icons.keyboard_arrow_right_rounded),onTap: () => context.push(ProfileScreen()),),
              //TitleDropdown(text: AppStrings.notification, leadingIcon: SvgImage(image: AppSvg.bell),icon: Icon(Icons.keyboard_arrow_right_rounded),onTap: () => context.push(NotificationSettingsScreen()),),
              TitleDropdown(
                text: AppStrings.language,
                leadingIcon: SvgImage(image: AppSvg.language),
                icon: Icon(Icons.keyboard_arrow_right_rounded),
                onTap: () => context.push(LanguageScreen()),
              ),
              //TitleDropdown(text: AppStrings.faqs, leadingIcon: SvgImage(image: AppSvg.terms),icon: Icon(Icons.keyboard_arrow_right_rounded),onTap: () => context.push(faqScreen()),),
              TitleDropdown(
                text: AppStrings.terms,
                leadingIcon: SvgImage(image: AppSvg.terms),
                icon: Icon(Icons.keyboard_arrow_right_rounded),
                onTap: () => context.push(TermsScreen(
                  title: AppStrings.terms,
                  data: AppStrings.termsDesc,
                )),
              ),
              TitleDropdown(
                text: AppStrings.privacy,
                leadingIcon: SvgImage(image: AppSvg.privacy),
                icon: Icon(Icons.keyboard_arrow_right_rounded),
                onTap: () => context.push(TermsScreen(
                  title: AppStrings.privacy,
                  data: AppStrings.privacyDesc,
                )),
              ),
              TitleDropdown(
                  text: AppStrings.version,
                  leadingIcon: SvgImage(image: AppSvg.terms),
                  icon: Text(packageInfo?.version ?? '')),
              TitleDropdown(
                text: AppStrings.logOut,
                fontColor: AppColors.red,
                leadingIcon: SvgImage(image: AppSvg.logout),
                onTap: () => AppHelper.showCustomDialog(
                    context: context, title: "Are you sure want to logout?",
                  subText: context.read<AuthProvider>().currentChat!=null ? "Your current chat will end if you logout." : null,
                  onNegativeTap: () {
                    context.pop();
                  },
                  onPositiveTap: () {
                      context.pop();
                      context.read<AuthProvider>().logout();
                    },),
                //onTap: () => ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingImageCard extends StatelessWidget {
  const SettingImageCard(
      {super.key,
      required this.image,
      required this.text,
      required this.desc,
      this.onTap});

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
                  color: AppColors.hintGrey3,
                  boxShadow: [],
                  borderRadius: BorderRadius.circular(8)),
              child: SvgImage(image: image),
            ),
            Text(
              text,
              style: AppStyle.black14Bold,
            ),
            Text(
              desc,
              style: AppStyle.grey12,
            ),
          ],
        ),
      ),
    );
  }
}
