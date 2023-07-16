import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';

class ShiftCard extends StatelessWidget {
  const ShiftCard({
    super.key, required this.title, required this.subtitle, this.titleColor, this.subtitleColor, this.backgroundColor, this.onTap,
  });
  final String title;
  final String subtitle;
  final Color? titleColor;
  final Color? subtitleColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      width: double.infinity,
      decoration: backgroundColor!=null ? BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(
          blurRadius: 4,
          color: AppColors.shadowColor,
          offset: Offset(0, 2),)],
      ): BoxDecoration(
          gradient: AppColors.appGradient,
          borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(
          blurRadius: 4,
          color: AppColors.shadowColor,
          offset: Offset(0, 2),)],
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,style : TextStyle(fontSize: 15,color: titleColor ?? Colors.white),),
            10.height,
            Text(subtitle,style : TextStyle(fontSize: 26,color: subtitleColor ?? Colors.white,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}