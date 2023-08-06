import 'package:flutter/material.dart';
import 'package:jyotishee/presentation/widgets/svg_image.dart';

import '../../app/utils/utils.dart';

class RoundAvatar extends StatelessWidget {
  const RoundAvatar({
    super.key, required this.image, this.onTap,
  });
  final String image;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.purpleLight,
        child: SvgImage(image: image),
      ),
    );
  }
}