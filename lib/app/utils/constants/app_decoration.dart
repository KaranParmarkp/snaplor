import 'package:flutter/material.dart';

import '../utils.dart';

class AppDecoration {
  static BoxDecoration get skyBlueRounded => BoxDecoration(
      borderRadius: BorderRadius.circular(22), color: AppColors.black);

  static BoxDecoration get purpleLightRounded => BoxDecoration(
      borderRadius: BorderRadius.circular(22), color: AppColors.purpleLight);

  static BoxDecoration get whiteShadowRounded => BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.80),
            blurRadius: 10,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      );

  static BoxDecoration get skyBlueLightRounded => BoxDecoration(
      borderRadius: BorderRadius.circular(24),
      color: AppColors.colorPrimary.withOpacity(0.2));

  static BoxDecoration get splash => BoxDecoration(
        gradient: AppColors.appGradient,
      );

  static BoxDecoration get buttonGradient => BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: AppColors.appGradient,
      );

  static BoxDecoration get chipDecoration => BoxDecoration(
      borderRadius: BorderRadius.circular(16), color: AppColors.black);

  static BoxDecoration get whiteWithShadow => BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.black.withOpacity(0.20),
                blurRadius: 6,
                offset: Offset(0, 3))
          ]);
}
