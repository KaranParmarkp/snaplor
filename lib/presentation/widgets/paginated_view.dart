import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/constants/app_colors.dart';
import 'package:jyotishee/app/utils/extensions.dart';

class PaginatedView extends StatelessWidget {
  const PaginatedView({super.key, required this.child, required this.length, required this.index, required this.showViewMore});
  final Widget child;
  final int length;
  final int index;
  final bool showViewMore;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        child,
        if(index==length-1 && showViewMore)Padding(
          padding: const EdgeInsets.only(bottom: 20,top: 20),
          child: CircularProgressIndicator(color: AppColors.colorPrimary,),
        ),
      ],
    );
  }
}
