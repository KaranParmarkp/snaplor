import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 100,
                              child: Text(AppStrings.desc,
                                  style: AppStyle.black10.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12),
                                  overflow: TextOverflow.ellipsis)),
                          Expanded(
                            child: Text(
                              model.description.toStringOrEmpty,
                              style: AppStyle.black10.copyWith(
                                  color: AppColors.colorPrimary,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 100,
                              child: Text("New Call Rate",
                                  style: AppStyle.black10.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12),
                                  overflow: TextOverflow.ellipsis)),
                          if (model.discountPercentage != 100) ...[
                            Text(
                                "Rs " +
                                    (((context
                                                        .read<AuthProvider>()
                                                        .userModel!
                                                        .chatPrice! *
                                                    model.discountPercentage!) /
                                                100)
                                            .toDouble()
                                            .round()
                                            .toString() +
                                        "/Min"),
                                style: AppStyle.black10.copyWith(
                                    color: AppColors.colorPrimary,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                                overflow: TextOverflow.ellipsis),
                          ],
                          if (model.discountPercentage == 100) ...[
                            Text(
                                "FREE",
                                style: AppStyle.black10.copyWith(
                                    color: AppColors.colorPrimary,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                                overflow: TextOverflow.ellipsis),
                          ]
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CupertinoSwitch(
                value: model.isActive!,
                trackColor: AppColors.red,
                onChanged: (value) {
                  context.read<AuthProvider>().offerStatusChange(
                      id: model.id!,
                      activate: model.isActive.isTrue ? false : true);
                },
                activeColor: AppColors.colorPrimary,
              )
            ],
          ),
          5.height,
          /*Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NameValue(
                name: AppStrings.myShare,
                value: " ${AppStrings.rupee}${model.myShare}",
                valueColor: AppColors.colorPrimary,
                fontSize: 10,
                width: null,
              ),
              NameValue(
                name: AppStrings.nepptorSocial,
                value: " ${AppStrings.rupee}${model.adminShare}",
                valueColor: AppColors.colorPrimary,
                fontSize: 10,
                width: null,
              ),
              NameValue(
                name: AppStrings.customerPay,
                value: " ${AppStrings.rupee}${model.customerShare}",
                valueColor: AppColors.colorPrimary,
                fontSize: 10,
                width: null,
              ),
            ],
          ),*/
        ],
      ),
    );
  }
}
