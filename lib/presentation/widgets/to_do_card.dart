import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';

class ToDoCard extends StatelessWidget {
  const ToDoCard({
    super.key, required this.title, required this.subtitle, required this.textColor, required this.backgroundColor, this.onTap,
  });
  final String title;
  final String subtitle;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: backgroundColor,
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
            Text(title,style : TextStyle(fontSize: 16,color: textColor),),
            10.height,
            Text(subtitle,style : TextStyle(fontSize: 26,color: textColor,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}