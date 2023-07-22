import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';

class AppChips extends StatelessWidget {
  const AppChips({
    super.key, required this.title, required this.color, this.bgColor,
  });
  final String title;
  final Color color;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: AppDecoration.chipDecoration.copyWith(color: bgColor ?? color.withOpacity(0.20)),
        padding: EdgeInsets.symmetric(vertical: 4,horizontal: 16),
        child: Text(title,style: AppStyle.white12.copyWith(color: color,fontWeight: FontWeight.w500)));
  }
}