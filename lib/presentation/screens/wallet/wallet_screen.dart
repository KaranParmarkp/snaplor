import 'package:flutter/material.dart';
import 'package:jyotishee/data/models/models.dart';

import '../../../app/utils/utils.dart';
import '../../../data/providers/providers.dart';
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
        body: AppConsumer<AuthProvider, List<WalletModel>>(
          taskName: AuthProvider.walletKey,
          load: (provider) => provider.wallet(),
          successBuilder: (data, provider) => SingleChildScrollView(
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
                              Rupee(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                              Text(
                                "${context.read<AuthProvider>().userModel?.lifeTimeEarnings}",
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
                              Rupee(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              Text(
                                "${context.read<AuthProvider>().userModel?.balanceAmount}",
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
                          itemCount: data.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => WalletTransactionCard(model : data[index]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class WalletTransactionCard extends StatelessWidget {
  const WalletTransactionCard({
    super.key, required this.model,
  });
  final WalletModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.colorPrimary,
            child: CircleNetworkImageAvatar(
                radius: 20,
                image:model.user?.image),
          ),
          20.width,
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(model.user?.name ?? "",
                    style: AppStyle.black14),
                Text(
                  "${DateTimeHelper.dateMonthWithTime(model.createdAt)}",
                  style: AppStyle.grey12.copyWith(
                      color: AppColors.greyDark),
                ),
              ],
            ),
          ),
            Row(
              children: [
                Text(
                  model.transactionType==TransactionType.add ? "+" : "-" ,
                  style: AppStyle.black16.copyWith(
                      color: model.transactionType==TransactionType.add ? AppColors.lightGreen: AppColors.red,
                      fontWeight: FontWeight.w500),
                ),
                2.width,
                Rupee(removeSpace: true,fontSize: 16, color: model.transactionType==TransactionType.add ? AppColors.lightGreen:AppColors.red),
                Text(
                  model.amount.toString(),
                  style: AppStyle.black16.copyWith(
                      color: model.transactionType==TransactionType.add ? AppColors.lightGreen:AppColors.red,
                      fontWeight: FontWeight.w500),
                )
              ],
            )
        ],
      ),
    );
  }
}
