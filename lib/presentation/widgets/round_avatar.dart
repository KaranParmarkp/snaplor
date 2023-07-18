import 'package:flutter/material.dart';
import 'package:jyotishee/presentation/widgets/svg_image.dart';

import '../../app/utils/utils.dart';

class RoundAvatar extends StatelessWidget {
  const RoundAvatar({
    super.key, required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: AppColors.purpleLight,
      child: SvgImage(image: image),
    );
  }
}