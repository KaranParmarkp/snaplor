import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';

class NameValue extends StatelessWidget {
  const NameValue({super.key, required this.name, required this.value, this.valueColor, this.bold=false, this.fontSize=12});
  final String name;
  final String value;
  final Color? valueColor;
  final bool bold;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        children: [
          SizedBox(
              width: 100,
              child: Text(name+"",style: AppStyle.black12.copyWith(fontWeight: FontWeight.w700,fontSize: fontSize),)),
          Text(value,style: AppStyle.black12.copyWith(color: valueColor??AppColors.black,fontWeight:bold ? FontWeight.w700: FontWeight.w400,fontSize: fontSize),),
        ],
      ),
    );
  }
}