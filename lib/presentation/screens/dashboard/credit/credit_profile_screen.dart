import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/constants/app_colors.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/screens/dashboard/credit/credit_spend_details_screen.dart';
import 'package:jyotishee/presentation/widgets/app_consumer/app_consumer.dart';
import 'package:jyotishee/presentation/widgets/custom_app_bar.dart';
import 'package:jyotishee/presentation/widgets/svg_image.dart';

import '../../../../data/models/credit_available_model.dart';
import '../../../../data/providers/providers.dart';

class CreditProfileScreen extends StatelessWidget {
  const CreditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: CustomAppBar(title: AppStrings.creditProfile),
      body: AppConsumer<ShiftsProvider,CreditAvailableModel>(
        taskName: ShiftsProvider.creditProfile,
        load: (provider) => provider.getCredit(),
        successBuilder: (data, provider) {
          return SizedBox(
            height: context.screenHeight,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  margin: EdgeInsets.only(top: 20),
                  color: AppColors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppStrings.creditLine,style: AppStyle.grey16,),
                                10.height,
                                Row(
                                  children: [
                                    Text("\$",style: AppStyle.black16,),
                                    Text("${data.creditAmount}",style: AppStyle.black16Bold,),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppStrings.creditAvailable,style: AppStyle.grey16,),
                                10.height,
                                RichText(
                                  text: TextSpan(
                                      text: "\$ ",
                                      children: [
                                        TextSpan(
                                            text:
                                            "${data.creditLeft}",
                                            style: AppStyle.red16
                                                .copyWith(fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text:
                                            "(${data.remainingCreditPercentage}%)",
                                            style: AppStyle.red16),
                                      ],
                                      style: AppStyle.red16),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  margin: EdgeInsets.only(top: 14),
                  color: AppColors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(AppImages.creditSpend,height: 22,width: 22,),
                          10.width,
                          Text(AppStrings.creditSpend,style: AppStyle.grey16,),
                          Spacer(),
                          Row(
                            children: [
                              Text("\$",style: AppStyle.black16,),
                              Text("${data.creditSpend}",style: AppStyle.black16Bold,),
                            ],
                          )

                        ],
                      ),
                      20.height,
                      CreditSpendCard(title: AppStrings.outInvoice,value: data.outstandingInvoiceTotal,creditSpend: CreditSpend.outStandingInvoices),
                      CreditSpendCard(title: AppStrings.unInvoiceTime,value: data.pendingTimesheetTotal,creditSpend: CreditSpend.unInvoiceTimesheet),
                      CreditSpendCard(title: AppStrings.runningShifts,value: data.runningShiftTotal,creditSpend: CreditSpend.runningShifts),
                      CreditSpendCard(title: AppStrings.confirmedShifts,value: data.shiftToBeWork,creditSpend: CreditSpend.confirmedShifts),
                      50.height
                    ],
                  ),

                ),
                
                
                
              ],
            ),
          );
        },
    ),
    );
  }
}

class CreditSpendCard extends StatelessWidget {
  const CreditSpendCard({
    super.key, required this.title, required this.value, required this.creditSpend,
  });
  final String title;
  final String value;
  final CreditSpend creditSpend;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 16),
      margin: EdgeInsets.only(top: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),color: AppColors.blueEff9ff
      ),
      child: InkWell(
        onTap: () => context.push(CreditSpendDetailsScreen(title: title, creditSpend: creditSpend)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: AppStyle.blue16.copyWith(fontSize: 14),),
                  10.height,
                  Row(
                    children: [
                      Text("\$",style: AppStyle.black16,),
                      Text("${value}",style: AppStyle.black16Bold,),
                    ],
                  )
                ],
              ),
            ),
            SvgImage(image: AppSvg.arrowRight,width: 12,height: 12,)
          ],
        ),
      ),
    );
  }
}
