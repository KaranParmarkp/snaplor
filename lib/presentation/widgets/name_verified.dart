import 'package:flutter/material.dart';
import 'package:jyotishee/presentation/widgets/svg_image.dart';

import '../../app/utils/utils.dart';

class NameVerified extends StatelessWidget {
  const NameVerified({super.key, this.name, this.verified = false, this.showAst=false});

  final String? name;
  final bool? verified;
  final bool showAst;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name.toStringOrEmpty,
          style: AppStyle.black16w500,
        ),
        5.width,
        if (verified!) SvgImage(image: AppSvg.verified),
        if (showAst) Container(
            decoration: AppDecoration.skyBlueRounded.copyWith(
              color: AppColors.hintGrey3
            ),
            margin: EdgeInsets.only(left: 6),
            padding: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
            child: Text(AppStrings.astrologer,style: AppStyle.black8w400,))
      ],
    );
  }
}
