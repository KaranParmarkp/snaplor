import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';
import '../../data/models/models.dart';
import 'widgets.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    super.key,  this.showHeader=false, required this.data, required this.detailData,
  });
  final bool showHeader;
  final ProviderDepartment data;
  final ProviderDetail detailData;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(showHeader)Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Row(
              children: [
                Expanded(child: Text(AppStrings.experience,style: AppStyle.blackBold26,)),
                InkWell(
                  onTap: () => context.push(AppWebViewScreen(title: AppStrings.resume, url: ApiConfig.providerBaseImageUrlDebug+detailData.resumeCopyUrl+detailData.resumeCopy)),
                  child: Row(
                    children: [
                      Text(AppStrings.resume,style: AppStyle.blue16,),
                      8.width,
                      SvgImage(image: AppSvg.resume,),
                      8.width,
                    ],
                  ),
                )

              ],
            ),
          ),
          Container(
            decoration: AppDecoration.whiteWithShadow,
            padding: EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Expanded(child: Text(data.professionalName,style: AppStyle.black16,)),
                    ],
                  ),
                ),
                Divider(color: AppColors.greyD6D6D6,height: 1,),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    children: [
                      Expanded(child: Text(AppStrings.experience,style: AppStyle.grey14,)),
                      Text("${data.departmentYear} years and ${data.departmentMonth} months",style: AppStyle.blue16Bold.copyWith(fontSize: 14),),

                    ],
                  ),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}