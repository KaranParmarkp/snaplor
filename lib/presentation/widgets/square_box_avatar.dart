import 'package:flutter/material.dart';
import 'package:jyotishee/presentation/widgets/widgets.dart';

import '../../app/utils/utils.dart';
import 'package:badges/badges.dart' as badges;
class SquareBoxAvatar extends StatelessWidget {
  const SquareBoxAvatar({super.key, required this.image, required this.text, this.onTap, this.badgeCount=0});
  final String image;
  final String text;
  final VoidCallback? onTap;
  final int badgeCount;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 12),
        margin: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
        decoration: AppDecoration.whiteShadowRounded,
        child: Column(
          children: [
            badges.Badge(
                showBadge: badgeCount!=0,
                badgeContent: Text(badgeCount.toString(),style: AppStyle.white12w500,),
                badgeStyle: badges.BadgeStyle(badgeColor: AppColors.colorPrimary),
                child: RoundAvatar(image: image)),
            6.height,
            Text(text,style: AppStyle.black12,)
          ],
        ),
      ),
    );
  }
}
