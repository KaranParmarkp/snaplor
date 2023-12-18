import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key, this.color, this.thickness,this.gray=false});
  final Color? color;
  final double? thickness;
  final bool gray;
  @override
  Widget build(BuildContext context) {
    return Divider(color: color ?? (gray ? AppColors.hintGrey3 :AppColors.dividerColor),height: 1,thickness: thickness,);
  }
}
