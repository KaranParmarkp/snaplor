import 'package:flutter/material.dart';

class AppColors {
  static Color colorPrimary = const Color(0xFF7E1E80);
  static Color primaryAccent = const Color(0xFFCB69CA);
  static Color transparent = const Color(0x00000000);
  static Color hintGrey = const Color(0xFF5B5B5B);
  static Color shadowAppBar = const Color(0x19000000);
  static Color purpleLight = const Color(0xFFF2EBFD);
  static Color lightGreen = const Color(0xFF91C23D);
  static Color purpleLight1 = const Color(0xFFFFECEC);
  static Color greyDark = const Color(0xFF464646);
  static Color red = const Color(0xFFFF0000);


  static Color dividerColor = hintGrey.withOpacity(0.5);
  static Color silverBfBfBf = const Color(0xFFBFBFBF);
  static Color grey777777 = const Color(0xFF777777);
  static Color greyF5F5F5 = const Color(0xFFF5F5F5);
  static Color scaffoldColor = const Color(0xFFF5F5F5);
  static Color black = const Color(0xFF000000);
  static Color black333333 = const Color(0xFF333333);
  static Color blueDcf2ff = const Color(0xFFDCF2FF);
  static Color blueEff9ff = const Color(0xFFEFF9FF);
  static Color orangeFff8ef = const Color(0xFFFFF8EF);
  static Color redFfeeee = const Color(0xFFFFEEEE);
  static Color orangeF7931e = const Color(0xFFF7931E);
  static Color redFf4646 = const Color(0xFFFF4646);
  static Color primaryRedFfc2c2 = const Color(0xFFFFC2C2);
  static Color colorBottomNav = const Color(0xFFFFFFFF);
  static Color greyD6D6D6 = const Color(0xFFD6D6D6);
  static Color black090404 = const Color(0xFF090404);
  static Color green19D5AF = const Color(0xFF19D5AF);
  static Color grey66666 = const Color(0xFF666666);
  static Color greyC0C0C0 = const Color(0xFFC0C0C0);
  static Color yelloF7931E = const Color(0xFFF7931E);
  static Color shadow00000029 = const Color(0x00000029);
  static Color redFF0000 = const Color(0xFFFF0000);
  static Color greyC4C4C6 = const Color(0xFFC4C4C6);
  static Color shadowColor = const Color(0xFFd6d8d8);
  static Color white = const Color(0xFFFFFFFF);
  static const Color shimmerColor =     Color(0xFFEBEBF4);
  static Gradient appGradient = LinearGradient(
    colors: [
      AppColors.primaryAccent,
      AppColors.colorPrimary,
    ],
    stops: const [0, 1],
    begin: AlignmentDirectional(00, -1.00),
    end: AlignmentDirectional(0, 1),
  );
  static Gradient redWhite = LinearGradient(
    colors: [
      AppColors.primaryRedFfc2c2,
      AppColors.redFf4646,
    ],
    stops: const [0, 1],
    begin: AlignmentDirectional(1, 0),
    end: AlignmentDirectional(-1, 0),
  );
  static Gradient blueWhite = LinearGradient(
    colors: [
      AppColors.primaryAccent,
      AppColors.colorPrimary,
    ],
    stops: const [0, 1],
    begin: AlignmentDirectional(1, 0),
    end: AlignmentDirectional(-1, 0),
  );
}