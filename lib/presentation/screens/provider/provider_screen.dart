import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/presentation/screens/provider/provider_details_screen.dart';
import 'package:jyotishee/presentation/screens/provider/favorite_list_screen.dart';

import '../../../app/utils/utils.dart';
import '../../../data/providers/providers.dart';
import '../../widgets/widgets.dart';

class ProviderScreen extends StatefulWidget {
  ProviderScreen({super.key});

  @override
  State<ProviderScreen> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
  final searchController = TextEditingController();
  getProviders({String search = ""}) {
    Provider.of<ProvidersListProvider>(context, listen: false)
        .providerLists(search: search);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyF5F5F5,
      appBar: DashboardAppBar(
        title: AppStrings.provider,
        trailingIcon: SvgImage(image: AppSvg.star,onTap: () => context.push(FavoriteListScreen()),),
      ),
      body: SizedBox(
        height: context.screenHeight,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            22.height,
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 24),
              child: AppTextField(
                hintText: AppStrings.providerName,
                borderColor: Colors.white,
                controller: searchController,
                onFieldSubmitted: (value) {
                  getProviders(search: value);
                },
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
            8.height,
            Expanded(
              child: AppConsumer<ProvidersListProvider, List<ProviderListModel>>(
                taskName: ProvidersListProvider.providerListKey,
                load: (provider) => getProviders(),
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
          ],
        ),
      ),
    );
  }
}
