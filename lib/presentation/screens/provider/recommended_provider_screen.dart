import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/presentation/screens/provider/provider_details_screen.dart';
import 'package:jyotishee/presentation/screens/provider/favorite_list_screen.dart';

import '../../../app/utils/utils.dart';
import '../../../data/providers/providers.dart';
import '../../widgets/widgets.dart';

class RecommendedProviderScreen extends StatefulWidget {
  RecommendedProviderScreen({super.key, required this.shiftId});
  final String shiftId;
  @override
  State<RecommendedProviderScreen> createState() => _RecommendedProviderScreenState();
}

class _RecommendedProviderScreenState extends State<RecommendedProviderScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyF5F5F5,
      appBar: CustomAppBar(
        title: AppStrings.recProvider,
      ),
      body: SizedBox(
        height: context.screenHeight,
        width: double.infinity,
        child: AppConsumer<ProvidersListProvider, List<ProviderListModel>>(
          taskName: ProvidersListProvider.recommendedListKey,
          load: (provider) => provider.recommendedLists(shiftId: widget.shiftId),
          successBuilder: (data,provider) {
            return ListView.builder(
              itemCount: data.length,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  InkWell(
                      onTap: () => context.push(ProviderDetailsScreen(model: data[index])),
                      child: ProviderCard(model: data[index],showStatus: false,)),
            );
          },
        ),
      ),
    );
  }
}
