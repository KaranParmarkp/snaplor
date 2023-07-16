import 'package:flutter/material.dart';
import 'package:jyotishee/data/providers/shifts_provider.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/screens/dashboard/credit/credit_profile_screen.dart';
import 'package:jyotishee/presentation/widgets/app_button.dart';

import '../../app/utils/utils.dart';

class HomeCreditCard extends StatelessWidget {
  const HomeCreditCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShiftsProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: AppColors.shadowColor,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.creditsAvailable,
                      style: TextStyle(fontSize: 16, color: AppColors.hintGrey),
                    ),
                    15.height,
                    RichText(
                      text: TextSpan(
                          text: "\$ ",
                          children: [
                            TextSpan(
                                text:
                                    "${provider.creditProfileModel?.creditLeft}",
                                style: AppStyle.red16
                                    .copyWith(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    " (${provider.creditProfileModel?.remainingCreditPercentage}%)",
                                style: AppStyle.red16),
                          ],
                          style: AppStyle.red16),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: LightRoundButton(
                    height: 40,
                    fontSize: 16,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    onTap: () => context.push(CreditProfileScreen()),
                    title: AppStrings.more,
                    margin: EdgeInsets.zero,
                  ))
            ],
          ),
        );
      },
    );
  }
}
