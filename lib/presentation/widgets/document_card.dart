import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';
import '../../data/models/models.dart';
import 'widgets.dart';

class DocumentCard extends StatelessWidget {
  const DocumentCard({
    super.key,  this.showHeader=false, required this.data,
  });
  final bool showHeader;
  final ProviderDocument data;
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
            child: Text(AppStrings.credDoc,style: AppStyle.blackBold26,),
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
                      Expanded(child: Text(data.documentTypeName,style: AppStyle.black16,)),
                      InkWell(
                          onTap: () => context.push(AppWebViewScreen(title: AppStrings.licenses, url:ApiConfig.providerBaseImageUrlDebug+data.url)),
                          child: SvgImage(image: AppSvg.doc,color: Colors.blue,))
                    ],
                  ),
                ),
                Divider(color: AppColors.greyD6D6D6,height: 1,),
                if(data.issueDate.isNotNull)Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    children: [
                      Expanded(child: Text(AppStrings.dateTime,style: AppStyle.grey14,)),
                      Text(DateTimeHelper.dateDDMMYYY(data.issueDate),style: AppStyle.black14,),

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