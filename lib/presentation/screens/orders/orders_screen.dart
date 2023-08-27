import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/widgets/widgets.dart';

import '../../../data/models/models.dart';
import '../../../data/providers/providers.dart';

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
                AppConsumer<AuthProvider, List<OrderModel>>(
                  taskName: AuthProvider.orderListKey,
                  load: (provider) => provider.orderList(ComType.chat),
                  successBuilder: (data, provider) => ListView.builder(
                    itemBuilder: (context, index) => OrderCard(model: data[index],type: ComType.chat),
                    itemCount: data.length,
                    shrinkWrap: true,
                  ),
                ),
                AppConsumer<AuthProvider, List<OrderModel>>(
                  taskName: AuthProvider.orderListKey,
                  load: (provider) => provider.orderList(ComType.call),
                  successBuilder: (data, provider) => ListView.builder(
                    itemBuilder: (context, index) => OrderCard(model: data[index],type : ComType.call),
                    itemCount: data.length,
                    shrinkWrap: true,
                  ),
                ),

            ],))
          ],
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.model, required this.type});
  final OrderModel model;
  final ComType type;
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
              Expanded(child: NameValue(name: AppStrings.name, value: model.intakeForm!.name.toCapitalized())),
              Text(model.status.isNotNull ? model.status!.toCapitalized():"",style: AppStyle.black12.copyWith(color: AppColors.lightGreen),)
            ],
          ),
          NameValue(name: AppStrings.gender, value: model.intakeForm?.gender.toCapitalized() ?? ""),
          NameValue(name: AppStrings.dob, value: "${DateTimeHelper.dateMonthWithTime(model.intakeForm?.dateOfBirth)}",),
          NameValue(name: AppStrings.pob, value: model.intakeForm?.birthPlace ?? ""),
          NameValue(name: AppStrings.problemArea, value: model.intakeForm?.topicOfConcern??""),
          NameValue(name: AppStrings.duration, value: "${model.duration??""} Minutes"),
          Row(
            children: [
              Expanded(child: NameValue(name: AppStrings.rateWithout, value: AppStrings.rupee+"${model.pricePerMinute}/Min")),
              Text(AppStrings.rs+"${model.totalPaid}",style: AppStyle.purple14.copyWith(fontWeight: FontWeight.w800),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Expanded(
                  child: AppRoundedButton(text: AppStrings.refundAmount,color: AppColors.red,onTap: () {
                    var provider = context.read<AuthProvider>();
                    provider.refundAmount(id: model.id.toString());
                    if(provider.getStatus(taskName: AuthProvider.refundAmountKey)==Status.Success){
                      provider.orderList(type);
                    }
                  },),
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

