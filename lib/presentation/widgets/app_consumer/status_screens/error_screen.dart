import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/widgets/app_button.dart';
import 'package:jyotishee/presentation/widgets/svg_image.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.error,this.showRefresh=false, this.onTap});
  final String error;
  final bool showRefresh;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.screenHeight*0.80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap:onTap,child: SvgImage(image: AppSvg.noDataFound,height: 150)),
          10.height,
          Text(error,style: AppStyle.black14,),
          20.height,
          if(showRefresh)Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
            child: AppButton(title: "Refresh",onTap:onTap),
          ),

        ],
      ),
    );
  }
}
