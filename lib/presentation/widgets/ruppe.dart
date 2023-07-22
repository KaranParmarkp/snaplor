import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';

class Rupee extends StatelessWidget {
  const Rupee({super.key, required this.fontSize, this.fontWeight, this.color});
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      '\u{20B9} ',
      style: TextStyle(
        color: color ?? AppColors.colorPrimary,
        fontSize: fontSize,
        fontFamily: 'Poppins',
        fontWeight:fontWeight ?? FontWeight.w400,
      ),
    );
  }
}
