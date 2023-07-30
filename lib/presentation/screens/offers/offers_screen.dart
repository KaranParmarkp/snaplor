import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/widgets/widgets.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.offers,showNotification: true,showProfile: true,),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        child: ListView.builder(itemBuilder: (context, index) => OfferCard(),itemCount: 10,shrinkWrap: true,),
      ),
    );
  }
}
class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 10,right: 4,left: 4,top: 8),
      width: double.infinity,
      decoration: AppDecoration.whiteShadowRounded,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    NameValue(name: AppStrings.offerName, value: "75% off",valueColor: AppColors.lightGreen,),
                    NameValue(name: AppStrings.displayName, value: "75% off",valueColor: AppColors.colorPrimary,),
                    NameValue(name: AppStrings.userType, value: "All User",valueColor: AppColors.colorPrimary,),
                  ],
                ),
              ),
              CupertinoSwitch(
                value: true,
                onChanged: (value) {
                  //chatSwitch = !chatSwitch;
                },
                activeColor: AppColors.colorPrimary,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NameValue(name: AppStrings.myShare, value: AppStrings.rupee+"8",valueColor: AppColors.colorPrimary,fontSize: 10,),
              NameValue(name: AppStrings.jyotisheeShare, value: AppStrings.rupee+"8",valueColor: AppColors.colorPrimary,fontSize: 10,),
              NameValue(name: AppStrings.customerPay, value: AppStrings.rupee+"8",valueColor: AppColors.colorPrimary,fontSize: 10,),
            ],
          ),
        ],
      ),
    );
  }
}

