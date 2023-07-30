import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';

class TitleDropdown extends StatelessWidget {
  const TitleDropdown({super.key, required this.text,  this.icon, this.onTap, this.leadingIcon, this.fontColor});
  final String text;
  final Widget? icon;
  final Widget? leadingIcon;
  final VoidCallback? onTap;
  final Color? fontColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.whiteShadowRounded,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            leadingIcon??SizedBox.shrink(),
            10.width,
            Expanded(child: Text(text,style: AppStyle.black14.copyWith(color: fontColor ?? AppColors.black),)),
            icon??SizedBox.shrink()

          ],
        ),
      ),
    );
  }
}