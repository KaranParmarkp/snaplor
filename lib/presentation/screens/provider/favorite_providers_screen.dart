import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/constants/app_colors.dart';
import 'package:jyotishee/app/utils/utils.dart';

import '../../../data/models/models.dart';
import '../../../data/providers/providers.dart';
import '../../widgets/widgets.dart';

class FavoriteProvidersScreen extends StatelessWidget {
  const FavoriteProvidersScreen({super.key, required this.model});
  final ButtonModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyF5F5F5,
      appBar: CustomAppBar(
          title: model.value,),
      body: SizedBox(
        height: context.screenHeight,
        child: AppConsumer<ProvidersListProvider, List<FavoriteProviderModel>>(
          taskName: ProvidersListProvider.favProvidersIDKey,
          load: (provider) => provider.favoriteProvidersFromId(id: model.id.toString()),
          successBuilder: (data,provider) {
            return ListView.builder(
                itemCount: data.length,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => FavoriteProviderCard(model:data[index])
            );
          },
        ),
      ),
    );
  }
}
