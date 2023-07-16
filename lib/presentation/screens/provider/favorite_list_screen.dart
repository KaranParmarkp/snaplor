import 'package:flutter/material.dart';
import 'package:jyotishee/presentation/widgets/widgets.dart';
import '../../../app/utils/utils.dart';
import '../../../data/models/models.dart';
import '../../../data/providers/providers.dart';

class FavoriteListScreen extends StatelessWidget {
  const FavoriteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyF5F5F5,
      appBar: CustomAppBar(
          title: AppStrings.favoriteList,
          trailingIcon: InkWell(
            onTap: () => addFavGroupSheet(context: context),
            child: Center(
              child: Text(
                AppStrings.add,
                style: AppStyle.black22.copyWith(color: AppColors.colorPrimary),
              ),
            ),
          )),
      body: SizedBox(
        height: context.screenHeight,
        child: AppConsumer<ProvidersListProvider, List<ButtonModel>>(
          taskName: ProvidersListProvider.favProvidersKey,
          load: (provider) => provider.favoriteProviders(),
          successBuilder: (data,provider) {
            return ListView.builder(
              itemCount: data.length,
              padding: EdgeInsets.zero,
              //physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => FavoriteCard(model:data[index])
            );
          },
        ),
      ),
    );
  }
  static addFavGroupSheet({required BuildContext context,ButtonModel? model}) async {
    var provider = await Provider.of<ProvidersListProvider>(context, listen: false);
    final nameController = TextEditingController();
    FocusNode nameFocus = FocusNode();
    if(model.isNotNull){
      nameController.text = model!.value;
    }
    return AppHelper.showBottomSheet(
        context: context,
        showCloseIcon: false,
        isScrollControlled: true,
        innerPadding: EdgeInsets.only(
          top: 36,
        ),
        padding: EdgeInsets.zero,
        child: DismissKeyBoard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: Text(
                  AppStrings.favName,
                  style: AppStyle.black16,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: MultipleLineTextField(controller: nameController,focusNode: nameFocus,maxLines: 3),
              ),
              30.height,
              Divider(
                color: AppColors.greyD6D6D6,
                height: 1,
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => context.pop(),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: Center(
                              child: Text(
                                AppStrings.close,
                                style: AppStyle.black14Bold
                                    .copyWith(color: AppColors.hintGrey),
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: VerticalDivider(
                        color: AppColors.greyD6D6D6,
                        width: 2,
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          AppHelper.hideKeyboard();
                          if (nameController.text.isEmpty) {
                            AppHelper.showImageToast(
                                message:
                                AppValidator.messageBuilder("favorite name")!);
                            nameFocus.requestFocusDelayed();
                          }else{
                            context.pop();
                            if(model.isNull)await provider.addFavGroup(name: nameController.text);
                            else await provider.updateFavGroup(id: model!.id.toString(),name: nameController.text);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: Center(
                              child: Text(
                                AppStrings.submit.toCapitalized(),
                                style: AppStyle.black14Bold
                                    .copyWith(color: AppColors.colorPrimary),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}


