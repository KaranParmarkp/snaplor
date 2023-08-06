import 'package:flutter/material.dart';
import 'package:jyotishee/presentation/widgets/svg_image.dart';

import '../../app/utils/utils.dart';

class NameVerified extends StatelessWidget {
  const NameVerified({super.key, this.name, this.verified=false});
  final String? name;
  final bool? verified;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text(name??"Madhusudan",style: AppStyle.black16.copyWith(fontWeight: FontWeight.w600),), 5.width,if(verified!)SvgImage(image: AppSvg.verified)],
    );
  }
}
