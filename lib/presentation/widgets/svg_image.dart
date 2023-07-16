import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatelessWidget {
  const SvgImage({super.key, required this.image, this.color, this.height, this.width, this.size, this.onTap});

  final String image;
  final Color? color;
  final double? height;
  final double? width;
  final double? size;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        image,
        //deprecated
        color: color,
        //colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
        height: size ?? height,
        width: size ?? width,
      ),
    );
  }
}
