import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/widgets/widgets.dart';

class WaitListScreen extends StatefulWidget {
  const WaitListScreen({super.key});

  @override
  State<WaitListScreen> createState() => _WaitListScreenState();
}

class _WaitListScreenState extends State<WaitListScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.waitList,showNotification: true,showProfile: true,),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(15),clipBehavior: Clip.none,
        child: ListView.builder(
          clipBehavior: Clip.none,
          itemBuilder: (context, index) => WaitlistCard(),itemCount: 10,shrinkWrap: true,),
      ),
    );
  }
}
class WaitlistCard extends StatelessWidget {
  const WaitlistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 20),
      decoration: AppDecoration.whiteShadowRounded,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserDP(radius: 22),
              20.width,
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("15 min ago",style: AppStyle.grey12.copyWith(color: AppColors.greyDark),),
                        Text("Suhel Ahmed",style: AppStyle.black14),
                        Text(AppStrings.rupee+"15/Min",style: AppStyle.grey12.copyWith(color: AppColors.greyDark),),
                      ],
                    ),
                    Spacer(),
                    Text(AppStrings.call.toUpperCase(),style: AppStyle.purple12.copyWith(fontWeight: FontWeight.w700),)
                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}

