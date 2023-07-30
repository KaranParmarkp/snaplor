import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/constants/app_strings.dart';
import 'package:jyotishee/app/utils/constants/app_style.dart';

import '../../widgets/widgets.dart';

class faqScreen extends StatefulWidget {
  const faqScreen({super.key});

  @override
  State<faqScreen> createState() => _faqScreenState();
}

class _faqScreenState extends State<faqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.faqs,
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TitleDropdown(text: AppStrings.genTerms, icon: Icon(Icons.keyboard_arrow_down_rounded)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                child: Text(AppStrings.genTermsInfo,style: AppStyle.black14,),
              ),
              TitleDropdown(text: AppStrings.license, icon: Icon(Icons.keyboard_arrow_down_rounded)),
              TitleDropdown(text: AppStrings.defKey, icon: Icon(Icons.keyboard_arrow_down_rounded)),
              TitleDropdown(text: AppStrings.restriction, icon: Icon(Icons.keyboard_arrow_down_rounded)),
              TitleDropdown(text: AppStrings.payment, icon: Icon(Icons.keyboard_arrow_down_rounded)),
            ],
          ),
        ),
      ),
    );
  }
}

