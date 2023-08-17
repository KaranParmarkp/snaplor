
import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/presentation/widgets/widgets.dart';

import '../../../data/providers/providers.dart';

class WaitListScreen extends StatefulWidget {
  const WaitListScreen({super.key});

  @override
  State<WaitListScreen> createState() => _WaitListScreenState();
}

class _WaitListScreenState extends State<WaitListScreen> with SingleTickerProviderStateMixin {
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
      appBar: CustomAppBar(title: AppStrings.waitList,showNotification: true,showProfile: true,),
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
                    text: AppStrings.chat,
                  ),
                  Tab(
                    text: AppStrings.call,
                  ),
                ],
              ),
            ),
            Expanded(child: TabBarView(clipBehavior: Clip.none,
              controller: _tabController,
              children: [
                AppConsumer<AuthProvider, List<WaitListModel>>(
                  taskName: AuthProvider.waitListKey,
                  load: (provider) => provider.waitList(ComType.chat),
                  successBuilder: (data, provider) => ListView.builder(
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) => WaitListCard(model: data[index],type: ComType.chat),
                    itemCount: data.length,
                    shrinkWrap: true,
                  ),
                ),
                AppConsumer<AuthProvider, List<WaitListModel>>(
                  taskName: AuthProvider.waitListKey,
                  load: (provider) => provider.waitList(ComType.call),
                  successBuilder: (data, provider) => ListView.builder(
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) => WaitListCard(model: data[index],type: ComType.call),
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
class WaitListCard extends StatelessWidget {
  const WaitListCard({super.key, required this.model, required this.type});
  final WaitListModel model;
  final ComType type;
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
                        Text(model.createdAt!.formatElapsedTimeString(),style: AppStyle.grey12.copyWith(color: AppColors.greyDark),),
                        Text(model.user?.name ?? "",style: AppStyle.black14),
                        Text(AppStrings.rupee+"${model.pricePerMinute}/Min",style: AppStyle.grey12.copyWith(color: AppColors.greyDark),),
                      ],
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () => context.read<AuthProvider>().acceptCall(type: type, id: model.id!),
                      child: CircleAvatar(
                        radius: 16,
                        child: Icon(Icons.done,color: AppColors.white),
                        backgroundColor: AppColors.lightGreen,
                      ),
                    ),
                    10.width,
                    CircleAvatar(
                      radius: 16,
                      child: Icon(Icons.delete_forever,color: AppColors.white),
                      backgroundColor: AppColors.red,
                    ),
                    //Text(AppStrings.call.toUpperCase(),style: AppStyle.purple12.copyWith(fontWeight: FontWeight.w700),)
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

