import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key, required this.title, this.onTap, this.widget,
  });
  final String title;
  final VoidCallback? onTap;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: AppColors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Text(title,style: AppStyle.black16,),
                  Spacer(),
                  widget ?? Icon(Icons.arrow_forward_ios_rounded,color: AppColors.hintGrey,)
                ],
              ),
            ),
            20.height,
            Divider(color: AppColors.hintGrey.withOpacity(0.5),height: 1,)
          ],
        ),
      ),
    );
  }
}