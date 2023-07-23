import 'package:flutter/material.dart';
import 'package:jyotishee/presentation/widgets/svg_image.dart';

import '../../app/utils/utils.dart';

class NameVerified extends StatelessWidget {
  const NameVerified({super.key, this.name});
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text("Madhusudan",style: AppStyle.black16.copyWith(fontWeight: FontWeight.w600),), 5.width,SvgImage(image: AppSvg.verified)],
    );
  }
}
