import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/widgets/widgets.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.orders,showNotification: true,showProfile: true,),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 45,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: AppColors.hintGrey3,
                borderRadius: BorderRadius.circular(
                  30.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                  color: AppColors.white,
                ),
                padding: EdgeInsets.all(4),
                labelColor: AppColors.colorPrimary,
                unselectedLabelColor: Colors.black,
                labelStyle: AppStyle.purple14,
                unselectedLabelStyle: AppStyle.black14,
                tabs: [
                  Tab(
                    text: AppStrings.chatHistory,
                  ),
                  Tab(
                    text: AppStrings.callHistory,
                  ),
                ],
              ),
            ),
            Expanded(child: TabBarView(
              controller: _tabController,
              children: [
              ListView.builder(
                clipBehavior: Clip.none,
                itemBuilder: (context, index) => OrderCard(),itemCount: 10,shrinkWrap: true,),
              ListView.builder(itemBuilder: (context, index) => OrderCard(),itemCount: 10,shrinkWrap: true,),
            ],))
          ],
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

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
            children: [
              Expanded(child: NameValue(name: AppStrings.name, value: "Shruti Shukla")),
              Text(AppStrings.completed,style: AppStyle.black12.copyWith(color: AppColors.lightGreen),)
            ],
          ),
          NameValue(name: AppStrings.gender, value: "Female"),
          NameValue(name: AppStrings.dob, value: "17 March, 1998, 9:45 PM"),
          NameValue(name: AppStrings.pob, value: "Kanpur, Uttar Pradesh, India"),
          NameValue(name: AppStrings.problemArea, value: "Career and Business"),
          NameValue(name: AppStrings.duration, value: "5 Minutes"),
          Row(
            children: [
              Expanded(child: NameValue(name: AppStrings.rateWithout, value: AppStrings.rupee+"5/Min")),
              Text(AppStrings.rs+"16",style: AppStyle.purple14.copyWith(fontWeight: FontWeight.w800),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Expanded(
                  child: AppRoundedButton(text: AppStrings.refundAmount,color: AppColors.red,),
                ),
                20.width,
                Expanded(
                  child: AppRoundedButton(text: AppStrings.openKundli,color: AppColors.colorPrimary,),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

