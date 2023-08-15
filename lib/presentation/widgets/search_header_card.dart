import 'package:flutter/material.dart';
import 'package:jyotishee/presentation/widgets/app_divider.dart';

import '../../app/utils/utils.dart';

class SearchHeaderCard extends StatelessWidget {
  const SearchHeaderCard({
    super.key, required this.title, this.subTitle, this.onTap,
  });
  final String title;
  final String? subTitle;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: AppColors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppDivider(),
            14.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Text(title,style: AppStyle.grey16,),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded,color: AppColors.hintGrey,)
                ],
              ),
            ),
            12.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(subTitle ?? "Please select",style: AppStyle.black16.copyWith(color: subTitle.isNotNull ? Colors.black : AppColors.hintGrey),),
            ),
          ],
        ),
      ),
    );
  }
}