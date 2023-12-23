import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/presentation/widgets/widgets.dart';

import '../../../data/providers/providers.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.offers,
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(15),
          child: AppConsumer<AuthProvider, List<OfferModel>>(
            taskName: AuthProvider.offerListKey,
            load: (provider) => provider.offerList(),
            successBuilder: (data, provider) => ListView.builder(
              itemBuilder: (context, index) => OfferCard(model: data[index]),
              itemCount: data.length,
              shrinkWrap: true,
            ),
          )),
    );
  }
}

class OfferCard extends StatelessWidget {
  const OfferCard({super.key, required this.model});
  final OfferModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 10, right: 4, left: 4, top: 8),
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
                    NameValue(
                      name: AppStrings.offerName,
                      value: "${model.name}",
                      valueColor: AppColors.lightGreen,
                    ),
                    NameValue(
                      name: AppStrings.displayName,
                      value: "${model.name}",
                      valueColor: AppColors.colorPrimary,
                    ),
                    NameValue(
                      name: AppStrings.userType,
                      value: "${model.userType?.toUpperCase()}",
                      valueColor: AppColors.colorPrimary,
                    ),
                  ],
                ),
              ),
              CupertinoSwitch(
                value: true,
                onChanged: (value) {
                  context.read<AuthProvider>().offerStatusChange(id: model.id!, activate: model.isActive.isTrue?false:true);
                },
                activeColor: AppColors.colorPrimary,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NameValue(
                name: AppStrings.myShare,
                value: "${AppStrings.rupee}${model.myShare}",
                valueColor: AppColors.colorPrimary,
                fontSize: 10,
              ),
              NameValue(
                name: AppStrings.jyotisheeShare,
                value: "${AppStrings.rupee}${model.jyotisheeShare}",
                valueColor: AppColors.colorPrimary,
                fontSize: 10,
              ),
              NameValue(
                name: AppStrings.customerPay,
                value: "${AppStrings.rupee}${model.customerShare}",
                valueColor: AppColors.colorPrimary,
                fontSize: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
