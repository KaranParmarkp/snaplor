import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/widgets/dismiss_keyboard_widget.dart';

import '../../widgets/widgets.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  bool push = true;
  bool sms = true;
  bool email = true;

  @override
  Widget build(BuildContext context) {
    return DismissKeyBoard(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: AppStrings.language,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
