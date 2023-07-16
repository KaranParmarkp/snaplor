import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';
import '../../data/models/models.dart';
import 'widgets.dart';

class ResumeCard extends StatelessWidget {
  const ResumeCard({
    super.key,  this.showHeader=false, required this.data,
  });
  final bool showHeader;
  final ProviderProfessionalLicense data;
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
            child: Text(AppStrings.licenses,style: AppStyle.blackBold26,),
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
                      Expanded(child: Text(data.licenseTypeName,style: AppStyle.black16,)),
                      InkWell(
                          onTap: () => context.push(AppWebViewScreen(title: AppStrings.licenses, url:ApiConfig.providerBaseImageUrlDebug+data.attachmentUrl+data.attachment)),
                          child: SvgImage(image: AppSvg.doc,color: Colors.blue,))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Text("NO. ${data.number}",style: AppStyle.black14.copyWith(color: AppColors.hintGrey),),
                ),
                Divider(color: AppColors.greyD6D6D6,height: 1,),
                if(data.licenseDate.isNotEmpty)Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    children: [
                      Expanded(child: Text(AppStrings.issueDate,style: AppStyle.grey14,)),
                      Text(DateTimeHelper.dateDDMMYYY(data.licenseDate),style: AppStyle.black14,),

                    ],
                  ),
                ),
                if(data.expireDate.isNotEmpty)Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    children: [
                      Expanded(child: Text(AppStrings.expireDate,style: AppStyle.grey14,)),
                      Text(DateTimeHelper.dateDDMMYYY(data.expireDate),style: AppStyle.black14,),

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