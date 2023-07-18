import 'package:flutter/material.dart';
import 'package:jyotishee/presentation/widgets/widgets.dart';

import '../../app/utils/utils.dart';

class SquareBoxAvatar extends StatelessWidget {
  const SquareBoxAvatar({super.key, required this.image, required this.text, this.onTap});
  final String image;
  final String text;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 12),
        margin: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
        decoration: AppDecoration.whiteShadowRounded,
        child: Column(
          children: [
            RoundAvatar(image: image),
            6.height,
            Text(text,style: AppStyle.black12,)
          ],
        ),
      ),
    );
  }
}
