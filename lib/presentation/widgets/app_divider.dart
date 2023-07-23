import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key, this.color, this.thickness});
  final Color? color;
  final double? thickness;
  @override
  Widget build(BuildContext context) {
    return Divider(color: color ?? AppColors.dividerColor,height: 1,thickness: thickness,);
  }
}
