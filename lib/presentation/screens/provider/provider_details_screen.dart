import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/screens/provider/favorite_list_screen.dart';
import 'package:jyotishee/presentation/screens/provider/suspend_provider_screen.dart';

import '../../../data/models/models.dart';
import '../../widgets/widgets.dart';

class ProviderDetailsScreen extends StatefulWidget {
  const ProviderDetailsScreen({super.key, required this.model});

  final ProviderListModel model;

  @override
  State<ProviderDetailsScreen> createState() => _ProviderDetailsScreenState();
}

class _ProviderDetailsScreenState extends State<ProviderDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ProvidersListProvider>(context, listen: false)
            .favoriteProviders());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: widget.model.fullName(),
          trailingIcon: SvgImage(
            image: AppSvg.added,
            color: Colors.black,
            onTap: () => _showOptions(context),
          )),
      body: SizedBox(
        height: context.screenHeight,
        child: AppConsumer<ProvidersListProvider, ProviderDetailModel>(
          taskName: ProvidersListProvider.providerDetailKey,
          load: (provider) =>
              provider.providerDetails(id: widget.model.id.toString()),
          successBuilder: (data,provider) => SingleChildScrollView(
            child: Column(
              children: [
                ProviderCard(model: widget.model,showStatus: true,status: data.accountStatus),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  decoration: AppDecoration.whiteWithShadow.copyWith(
                    color: AppColors.blueEff9ff,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: Text(
                          AppStrings.reliabStats,
                          style: AppStyle.black18,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShiftBox(
                              title: AppStrings.totalShifts,
                              result: data.providerBidCounts.toString()),
                          ShiftBox(
                              title: AppStrings.shiftsOnTime,
                              result:
                                  data.providerBidCountsOfCompleted.toString()),
                          ShiftBox(
                              title: AppStrings.lateCall,
                              result:
                                  data.providerBidCountsOfLateCallOff.toString()),
                          ShiftBox(
                              title: AppStrings.noCalls,
                              result: data.providerBidCountsOfNoCallNoShow
                                  .toString()),
                        ],
                      ),
                    ],
                  ),
                ),
                if (data.providerDepartmentObjects.isNotNull &&
                    data.providerDepartmentObjects!.isNotEmpty)
                  ListView.builder(
                    itemCount: data.providerDepartmentObjects!.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ExperienceCard(
                      showHeader: index == 0,
                      data: data.providerDepartmentObjects![index],
                      detailData: data.providerDetailObject,
                    ),
                  ),
                if (data.providerProfessionalLicense.isNotNull &&
                    data.providerProfessionalLicense!.isNotEmpty)
                  ListView.builder(
                    itemCount: data.providerProfessionalLicense!.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ResumeCard(
                        showHeader: index == 0,
                        data: data.providerProfessionalLicense![index]),
                  ),
                if (data.providerDocumentObjects.isNotNull &&
                    data.providerDocumentObjects!.isNotEmpty)
                  ListView.builder(
                    itemCount: data.providerDocumentObjects!.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => DocumentCard(
                        showHeader: index == 0,
                        data: data.providerDocumentObjects![index]),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showOptions(BuildContext context) async {
    var provider =
        await Provider.of<ProvidersListProvider>(context, listen: false);
    _addToFav() async {
      ButtonModel? response = await showGenericTypeSheet(
          provider.data[ProvidersListProvider.favProvidersKey]);
      if (response.isNotNull) {
        await provider.addFavoriteProvider(
            providerId: widget.model.id.toString(),
            groupId: response!.id.toString());
      }
    }

    return AppHelper.showBottomSheet(
        context: context,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LightRoundButton(
              title: AppStrings.fav,
              onTap: () async {
                context.pop();
                if (provider.data[ProvidersListProvider.favProvidersKey].isNotEmpty) {
                  _addToFav();
                } else {
                  AppHelper.showCustomDialog(
                    context: context,
                    title: RichText(text: TextSpan(text:AppStrings.youDidnCreate, style: AppStyle.black18)),
                    positiveText: AppStrings.create,
                    onPressedPositive: () {
                      context.pop();
                      FavoriteListScreen.addFavGroupSheet(context: context);
                    },
                  );
                }
              },
            ),
            LightRoundButton(
              title: AppStrings.suspended,
              onTap: () async {
                context.pop();
                context.push(SuspendProviderScreen(id : widget.model.id.toString()));
              },
            ),
          ],
        ));
  }

  Future<ButtonModel?> showGenericTypeSheet(List<ButtonModel> list) async {
    return await AppHelper.showBottomSheet<ButtonModel?>(
        context: context,
        padding: EdgeInsets.zero,
        child: Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        context.pop(list[index]);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          list[index].value,
                          style: AppStyle.blue16,
                        )),
                      ),
                    ),
                    Divider(),
                  ],
                );
              }),
        ));
  }


}

class ShiftBox extends StatelessWidget {
  const ShiftBox({
    super.key,
    required this.title,
    required this.result,
  });

  final String title;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            result,
            style: AppStyle.blueBold26,
          ),
          Text(title, style: AppStyle.black14, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
