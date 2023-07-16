import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: AppColors.dividerColor,height: 1,);
  }
}
