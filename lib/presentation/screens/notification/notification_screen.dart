import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/widgets/custom_app_bar.dart';

import '../../widgets/widgets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.notification,
        showProfile: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(bottom: 20),
              decoration: AppDecoration.whiteShadowRounded,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: CircleAvatar(
                              radius: 22,backgroundColor: AppColors.colorPrimary,
                              child: CircleNetworkImageAvatar(
                                  radius: 20,
                                  image:
                                  "https://images.unsplash.com/photo-1567324216289-97cc4134f626?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
                            ),
                          ),
                          Text(AppStrings.call.toUpperCase(),style: AppStyle.purple12,)
                        ],
                      ),
                      20.width,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("7 min ago",style: AppStyle.grey12.copyWith(color: AppColors.greyDark),),
                            Text("Suhel Ahmed",style: AppStyle.black14),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ' \u{20B9}',
                                  style: TextStyle(
                                    color: AppColors.greyDark,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(" 5/Min",style: AppStyle.grey12.copyWith(color: AppColors.greyDark),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.close,size: 20,color: AppColors.greyDark,),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Expanded(
                            child: AppRoundedButton(text: AppStrings.reject,color: AppColors.red,),
                          ),
                        20.width,
                        Expanded(
                          child: AppRoundedButton(text: AppStrings.accept,color: AppColors.colorPrimary,),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(bottom: 20),
              decoration: AppDecoration.whiteShadowRounded,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        child: CircleAvatar(
                          radius: 22,backgroundColor: AppColors.colorPrimary,
                          child: CircleNetworkImageAvatar(
                              radius: 20,
                              image:
                              "https://images.unsplash.com/photo-1567324216289-97cc4134f626?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
                        ),
                      ),
                      20.width,
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("15 min ago",style: AppStyle.grey12.copyWith(color: AppColors.greyDark),),
                                Text("Amount Transfer to Bank",style: AppStyle.black14),
                                Text("27 Jun, 01:00 PM",style: AppStyle.grey12.copyWith(color: AppColors.greyDark),),
                              ],
                            ),
                            Spacer(),
                            Icon(Icons.close,size: 20,color: AppColors.greyDark,),
                          ],
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
