import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,this.whiteLogo=false,this.padding = 65
  });
  final bool whiteLogo;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 300),
      padding:  EdgeInsets.symmetric(horizontal: padding),
      child: Image.asset(whiteLogo ? AppImages.appLogoWhite :AppImages.appLogo),
    );
  }
}