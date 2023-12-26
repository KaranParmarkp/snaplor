import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';

import '../../../data/providers/providers.dart';
import '../../widgets/widgets.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return DismissKeyBoard(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: AppStrings.language,
        ),
        body: Consumer<AppProvider>(
          builder: (context, provider, child) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  10.height,
                  InkWell(child: Text("English"), onTap: () {
                    provider.updateLanguage(locale: Locale("hi"));
                  },),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
