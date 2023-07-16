import 'package:flutter/material.dart';
import 'package:jyotishee/presentation/screens/provider/favorite_list_screen.dart';
import 'package:jyotishee/presentation/widgets/widgets.dart';

import '../../app/utils/utils.dart';
import '../../data/models/models.dart';
import '../../data/providers/providers.dart';
import '../screens/provider/favorite_providers_screen.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({super.key, required this.model});

  final ButtonModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      margin: EdgeInsets.only(bottom: 14),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
      child: InkWell(
        onTap: () => context.push(FavoriteProvidersScreen(model: model,)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  model.value,
                  style: AppStyle.black16Bold,
                )),
                SvgImage(
                  image: AppSvg.delete,
                  height: 20,
                  width: 20,
                  onTap: () => _deleteFavorite(context, model.id.toString()),
                ),
                26.width,
                SvgImage(
                  image: AppSvg.edit,
                  height: 18,
                  width: 18,
                  onTap: () => FavoriteListScreen.addFavGroupSheet(context: context,model : model),
                ),
              ],
            ),
            8.height,
            Text(
              AppStrings.fav + ": ${model.favCount}",
              style: AppStyle.black14.copyWith(color: AppColors.grey66666),
            )
          ],
        ),
      ),
    );
  }

  _deleteFavorite(BuildContext context, String id) async {
    var provider = await Provider.of<ProvidersListProvider>(context, listen: false);

    AppHelper.showCustomDialog(
      context: context,
      title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: "Do you want to ",
              style: AppStyle.black18,
            ),
            TextSpan(
              text: "delete\n",
              style: AppStyle.black18.copyWith(color: AppColors.colorPrimary),
            ),
            TextSpan(text: "this favorite list?", style: AppStyle.black18),
          ])),
      positiveText: AppStrings.sure,
      onPressedPositive: () async {
        context.pop();
        await provider.deleteFavGroup(id: id);
      },
    );
  }
}
