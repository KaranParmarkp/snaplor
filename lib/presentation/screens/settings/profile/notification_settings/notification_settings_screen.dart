import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import '../../../../widgets/widgets.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  bool push = true;
  bool sms = true;
  bool email = true;

  @override
  Widget build(BuildContext context) {
    return DismissKeyBoard(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: AppStrings.notificationSettings,
        ),
        body: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                10.height,
                TitleDropdown(
                  leadingIcon: SvgImage(image: AppSvg.mobile),
                  text: AppStrings.pushNotification,icon: CupertinoSwitch(
                  value: push,
                  onChanged: (value) {
                    push = !push;
                    setState(() {});
                  },
                  activeColor: AppColors.colorPrimary,
                ),),
                TitleDropdown(
                  leadingIcon: SvgImage(image: AppSvg.sms),
                  text: AppStrings.smsNotification,icon: CupertinoSwitch(
                  value: sms,
                  onChanged: (value) {
                    sms = !sms;
                    setState(() {});
                  },
                  activeColor: AppColors.colorPrimary,
                ),),
                TitleDropdown(
                  leadingIcon: SvgImage(image: AppSvg.mail  ),
                  text: AppStrings.emailNotification,icon: CupertinoSwitch(
                  value: email,
                  onChanged: (value) {
                    email = !email;
                    setState(() {});
                  },
                  activeColor: AppColors.colorPrimary,
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
