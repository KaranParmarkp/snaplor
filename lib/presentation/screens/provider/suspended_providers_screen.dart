import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/constants/app_colors.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/screens/provider/provider_details_screen.dart';

import '../../../data/models/models.dart';
import '../../../data/providers/providers.dart';
import '../../widgets/widgets.dart';

class SuspendedProvidersScreen extends StatelessWidget {
  const SuspendedProvidersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyF5F5F5,
      appBar: CustomAppBar(
        title: AppStrings.suspendedList,
      ),
      body: SizedBox(
        height: context.screenHeight,
        child: AppConsumer<ProvidersListProvider, List<ModelSuspendedList>>(
          taskName: ProvidersListProvider.getSuspendedProvidersKey,
          load: (provider) => provider.getSuspendedProviders(),
          successBuilder: (data,provider) {
            return ListView.builder(
                itemCount: data.length,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index) => InkWell(
                    onTap: () => context.push(ProviderDetailsScreen(
                            model: ProviderListModel(
                          accountStatus:
                              data[index].providerObj!.accountStatus.toString(),
                          email: data[index].providerObj!.email.toString(),
                          firstName:
                              data[index].providerObj!.accountStatus.toString(),
                          id: data[index].providerObj!.id!,
                          lastName:
                              data[index].providerObj!.lastName.toString(),
                          middleName:
                              data[index].providerObj!.middleName.toString(),
                          mobile: data[index].providerObj!.mobile.toString(),
                          mobileVerified: "",
                          paymentGateway: '',
                          profileImage:
                              data[index].providerObj!.profileUrl.toString(),
                          price: 0,
                          providerBidCounts: 0,
                          providerBidCountsOfCompleted: 0,
                          providerBidCountsOfLateCallOff: 0,
                          providerBidCountsOfNoCallNoShow: 0,
                          providerDetailObject: ProviderDetailObject(
                              shiftType: data[index]
                                  .providerObj!
                                  .providerDetailObject
                                  ?.shiftType
                                  .toString()),
                          profile: data[index].providerObj!.profile.toString(),
                          rating: data[index].providerObj!.ratting,
                          totalRating:
                              data[index].providerObj!.totalRating ?? 0,

                          //: data[index].providerObj!.profileUrl.toString()
                        ))),
                    child: SuspendedProviderCard(model: data[index])));
          },
        ),
      ),
    );
  }
}
