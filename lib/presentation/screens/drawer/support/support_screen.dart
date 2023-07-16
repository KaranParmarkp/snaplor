import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/app_helper.dart';
import 'package:jyotishee/app/utils/constants/api_config.dart';
import 'package:jyotishee/app/utils/constants/app_strings.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/widgets/app_webview_screen.dart';
import 'package:jyotishee/presentation/widgets/custom_app_bar.dart';
import 'package:jyotishee/presentation/widgets/setting_card.dart';

import '../../../../data/providers/providers.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
  builder: (context, provider, child) {
  return Scaffold(
      appBar: CustomAppBar(title: AppStrings.settings),
      body: Column(
        children: [
          SettingItem(title:AppStrings.supportTicket,onTap: () => AppHelper.launchWebUrl(getSupportRequestUrl(provider.userModel!.email!, provider.userModel!.facilityDetail.legalCompanyName)),),
          SettingItem(title:AppStrings.faq,onTap: () => context.push(AppWebViewScreen(title: AppStrings.faq, url: ApiConfig.support))),
        ],
      ),
    );
  },
);
  }
  getSupportRequestUrl(String email, String facility) {
  return ApiConfig.baseSupportRequest + "hc/en-us/requests/new?tf_anonymous_requester_email=" + email + "&tf_1260819412889=" + facility;
  }
}
