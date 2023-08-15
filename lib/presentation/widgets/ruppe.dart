import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';

class Rupee extends StatelessWidget {
  const Rupee({super.key, required this.fontSize, this.fontWeight, this.color, this.removeSpace=false});
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final bool removeSpace;
  @override
  Widget build(BuildContext context) {
    return Text(
      removeSpace ? '\u{20B9}' : '\u{20B9} ',
      style: TextStyle(
        color: color ?? AppColors.colorPrimary,
        fontSize: fontSize,
        fontFamily: 'Poppins',
        fontWeight:fontWeight ?? FontWeight.w400,
      ),
    );
  }
}
