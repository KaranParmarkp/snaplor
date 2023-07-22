import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Divider(color: color ?? AppColors.dividerColor,height: 1,);
  }
}
