import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jyotishee/presentation/widgets/custom_app_bar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../app/utils/utils.dart';
import '../../widgets/widgets.dart';


class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashboardAppBar(
        title: '',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(15),
                decoration: AppDecoration.purpleLightRounded,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    20.height,
                    Text(
                      AppStrings.lifetimeEarnings,
                      style: AppStyle.black16
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    4.height,
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Rupee(fontSize: 40, fontWeight: FontWeight.bold,),
                          Text(
                            '2,65,000',
                            style: AppStyle.purple14.copyWith(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(15),
                decoration: AppDecoration.whiteShadowRounded,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.walletBalance,
                      style: AppStyle.black16
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    4.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Rupee(fontSize: 30, fontWeight: FontWeight.bold,),
                          Text(
                            '12000',
                            style: AppStyle.purple14.copyWith(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(15),
                decoration: AppDecoration.whiteShadowRounded,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.recentAct,
                      style: AppStyle.black16
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    10.height,
                    ListView.builder(
                      itemCount: 20,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 22,backgroundColor: AppColors.colorPrimary,
                              child: CircleNetworkImageAvatar(
                                  radius: 20,
                                  image:
                                  "https://images.unsplash.com/photo-1567324216289-97cc4134f626?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
                            ),
                            20.width,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Suhel Ahmed",style: AppStyle.black14),
                                  Text("Today, 01:00 PM",style: AppStyle.grey12.copyWith(color: AppColors.greyDark),),
                                ],
                              ),
                            ),
                            if(index%2==0)Row(children: [
                              Text("+",style: AppStyle.black16.copyWith(color: AppColors.lightGreen,fontWeight: FontWeight.w500),),
                              Rupee(fontSize: 16,color: AppColors.lightGreen),
                              Text("500",style: AppStyle.black16.copyWith(color: AppColors.lightGreen,fontWeight: FontWeight.w500),)
                            ],),
                            if(index%2!=0)Row(children: [
                              Text("+",style: AppStyle.black16.copyWith(color: AppColors.red,fontWeight: FontWeight.w500),),
                              Rupee(fontSize: 16,color: AppColors.red),
                              Text("500",style: AppStyle.black16.copyWith(color: AppColors.red,fontWeight: FontWeight.w500),)
                            ],)
                          ],
                        ),
                      ),)
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

