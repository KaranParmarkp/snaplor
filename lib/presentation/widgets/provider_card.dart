import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jyotishee/presentation/screens/provider/provider_details_screen.dart';
import '../../app/utils/utils.dart';
import '../../data/models/models.dart';
import '../../data/providers/providers.dart';
import 'widgets.dart';

class ProviderCard extends StatelessWidget {
  const ProviderCard({
    super.key,
    required this.model,this.showStatus=false,this.showDelete=false,this.status
  });
  final bool showStatus;
  final bool showDelete;
  final String? status;
  final ProviderListModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: context.screenWidth,
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  CircleNetworkImageAvatar(image: model.profileImage! + model.profile!),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              model.firstName +
                                  " " +
                                  model.middleName +
                                  " " +
                                  model.lastName,
                              style: AppStyle.black16Bold,
                            ),
                            if(showDelete)SvgImage(
                              image: AppSvg.delete,
                              height: 20,
                              width: 20,
                              onTap: () => _deleteFromFavorite(context, model.id.toString()),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: RatingBar(
                            itemSize: 20,
                            itemPadding: EdgeInsets.only(right: 4),
                            ratingWidget: RatingWidget(
                              empty: Image.asset(AppImages.ratingGray),
                              half: Image.asset(AppImages.ratingGray),
                              full: Image.asset(AppImages.ratingYellow),
                            ),
                            itemCount: 5,
                            allowHalfRating: true,
                            ignoreGestures: true,
                            initialRating: model.rating ?? 0.0,
                            updateOnDrag: false,
                            tapOnlyMode: true,
                            onRatingUpdate: (value) {},
                          ),
                        ),

                          Row(
                            children: [
                              if (model.providerDetailObject.isNotNull && model.providerDetailObject!.shiftType.isNotNull )AppChips(
                                  title: model.providerDetailObject!.shiftType!,
                                  color: AppColors.colorPrimary),
                              10.width,
                              if(showStatus)
                                AppChips(
                                  title: status!,
                                  color: status== "Active" ? AppColors.green19D5AF : AppColors.redFf4646)
                            ],
                          ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 16,
                            height: 16,
                            child: SvgImage(
                              image: AppSvg.email,
                              color: AppColors.greyD6D6D6,
                              height: 16,
                              width: 16,
                            )),
                        10.width,
                        Expanded(
                            child: Text(
                          model.email,
                          style: AppStyle.white14
                              .copyWith(color: AppColors.grey66666),
                        )),
                      ],
                    ),
                    12.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 16,
                            height: 16,
                            child: SvgImage(
                              image: AppSvg.phone,
                              color: AppColors.greyD6D6D6,
                              height: 16,
                              width: 16,
                            )),
                        10.width,
                        Expanded(
                            child: Text(
                          model.mobile,
                          style: AppStyle.white14
                              .copyWith(color: AppColors.grey66666),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => _showChatSheet(context),
                child: SizedBox(
                    height: 45,
                    width: 45,
                    child: Image.asset(AppImages.chatMessage)),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _showChatSheet(BuildContext context) {
    return AppHelper.showBottomSheet(
        context: context,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LightRoundButton(
              title: AppStrings.text.toUpperCase(),
              onTap: () async {
                context.pop();
                await AppHelper.launchSMS(model.mobile);
              },
            ),
            LightRoundButton(
              title: AppStrings.call.toUpperCase(),
              onTap: () async {
                context.pop();
                await AppHelper.launchCall(model.mobile);
              },
            ),
            LightRoundButton(
              title: AppStrings.email.toUpperCase(),
              onTap: () async {
                context.pop();
                await AppHelper.launchEmail(model.email);
              },
            ),
          ],
        ));
  }

  _deleteFromFavorite(BuildContext context, String id) async {
    var provider =
    await Provider.of<ProvidersListProvider>(context, listen: false);

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
              text: "remove\n",
              style: AppStyle.black18.copyWith(color: AppColors.colorPrimary),
            ),
            TextSpan(text: "provider from favorite list?", style: AppStyle.black18),
          ])),
      positiveText: AppStrings.sure,
      onPressedPositive: () async {
        context.pop();
        //await provider.deleteFavProvider(id: id);
      },
    );
  }
}
class FavoriteProviderCard extends StatelessWidget {
  const FavoriteProviderCard({
    super.key,
    required this.model,this.showStatus=false,
  });
  final bool showStatus;

  final FavoriteProviderModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: context.screenWidth,
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: InkWell(
        onTap: () => context.push(ProviderDetailsScreen(model: ProviderListModel(
          accountStatus:
          model.providerObj!.accountStatus.toString(),
          email: model.providerObj!.email.toString(),
          firstName:
          model.providerObj!.firstName.toString(),
          id: model.providerObj!.id!,
          lastName:
          model.providerObj!.lastName.toString(),
          middleName:
          model.providerObj!.middleName.toString(),
          mobile: model.providerObj!.mobile.toString(),
          mobileVerified: "",
          paymentGateway: '',
          profileImage:
          model.providerObj!.profileUrl.toString(),
          price: 0,
          providerBidCounts: 0,
          providerBidCountsOfCompleted: 0,
          providerBidCountsOfLateCallOff: 0,
          providerBidCountsOfNoCallNoShow: 0,
          providerDetailObject: ProviderDetailObject(
              shiftType: model
                  .providerObj!
                  .providerDetailObject
                  .specialityName
                  .toString()),
          profile: model.providerObj!.profile.toString(),
          rating: model.providerObj!.avgRating,
          totalRating:
          model.providerObj!.totalRating!=null ? double.parse(model.providerObj!.totalRating.toString()) : 0,

          //: data[index].providerObj!.profileUrl.toString()
        ))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: Row(
                children: [
                  CircleNetworkImageAvatar(image: model.providerObj.profileUrl + model.providerObj.profile!),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  model.providerObj.firstName +
                                      " " +
                                      model.providerObj.middleName +
                                      " " +
                                      model.providerObj.lastName,
                                  style: AppStyle.black16Bold,
                                ),
                              ),
                              SvgImage(
                                image: AppSvg.delete,
                                height: 20,
                                width: 20,
                                onTap: () => _deleteFromFavorite(context, model.id.toString()),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: RatingBar(
                              itemSize: 20,
                              itemPadding: EdgeInsets.only(right: 4),
                              ratingWidget: RatingWidget(
                                empty: Image.asset(AppImages.ratingGray),
                                half: Image.asset(AppImages.ratingGray),
                                full: Image.asset(AppImages.ratingYellow),
                              ),
                              itemCount: 5,
                              allowHalfRating: true,
                              ignoreGestures: true,
                              initialRating: model.providerObj.avgRating ?? 0.0,
                              updateOnDrag: false,
                              tapOnlyMode: true,
                              onRatingUpdate: (value) {},
                            ),
                          ),

                          Row(
                            children: [
                              if (model.providerObj.providerDetailObject.isNotNull)AppChips(
                                  title: model.providerObj.providerDetailObject!.specialityName/*shiftType*/!,
                                  color: AppColors.colorPrimary),
                              10.width,
                              if(showStatus)AppChips(
                                  title: model.providerObj.accountStatus,
                                  color: model.providerObj.accountStatus== "Active" ? AppColors.green19D5AF : AppColors.redFf4646)
                            ],
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 16,
                              height: 16,
                              child: SvgImage(
                                image: AppSvg.email,
                                color: AppColors.greyD6D6D6,
                                height: 16,
                                width: 16,
                              )),
                          10.width,
                          Expanded(
                              child: Text(
                                model.providerObj.email,
                                style: AppStyle.white14
                                    .copyWith(color: AppColors.grey66666),
                              )),
                        ],
                      ),
                      12.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 16,
                              height: 16,
                              child: SvgImage(
                                image: AppSvg.phone,
                                color: AppColors.greyD6D6D6,
                                height: 16,
                                width: 16,
                              )),
                          10.width,
                          Expanded(
                              child: Text(
                                model.providerObj.mobile,
                                style: AppStyle.white14
                                    .copyWith(color: AppColors.grey66666),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }


  _deleteFromFavorite(BuildContext context, String id) async {
    var provider =
    await Provider.of<ProvidersListProvider>(context, listen: false);

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
              text: "remove\n",
              style: AppStyle.black18.copyWith(color: AppColors.colorPrimary),
            ),
            TextSpan(text: "provider from favorite \nlist?", style: AppStyle.black18),
          ])),
      positiveText: AppStrings.sure,
      onPressedPositive: () async {
        context.pop();
        await provider.deleteFavProvider(id: id,groupId: model.groupId.toString());
      },
    );
  }
}
class SuspendedProviderCard extends StatelessWidget {
  const SuspendedProviderCard({
    super.key,
    required this.model,
  });

  final ModelSuspendedList model;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: context.screenWidth,
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleNetworkImageAvatar(image: model.providerObj!.profileUrl! + model.providerObj!.profile!),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: SvgImage(image: AppSvg.blackList,))
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                model.providerObj!.firstName! +
                                    " " +
                                    model.providerObj!.middleName! +
                                    " " +
                                    model.providerObj!.lastName!,
                                style: AppStyle.black16Bold,
                              ),
                            ),
                            SvgImage(
                              image: AppSvg.delete,
                              height: 20,
                              width: 20,
                              onTap: () => _deleteFromFavorite(context, model.id.toString()),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: RatingBar(
                            itemSize: 20,
                            itemPadding: EdgeInsets.only(right: 4),
                            ratingWidget: RatingWidget(
                              empty: Image.asset(AppImages.ratingGray),
                              half: Image.asset(AppImages.ratingGray),
                              full: Image.asset(AppImages.ratingYellow),
                            ),
                            itemCount: 5,
                            allowHalfRating: true,
                            ignoreGestures: true,
                            initialRating: model.providerObj!.ratting ?? 0.0,
                            updateOnDrag: false,
                            tapOnlyMode: true,
                            onRatingUpdate: (value) {},
                          ),
                        ),

                        Row(
                          children: [
                            if (model.providerObj!.providerDetailObject.isNotNull)AppChips(
                                title: model.providerObj!.providerDetailObject!.shiftType!,
                                color: AppColors.colorPrimary),
                            10.width,
                          ],
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 16,
                            height: 16,
                            child: SvgImage(
                              image: AppSvg.email,
                              color: AppColors.greyD6D6D6,
                              height: 16,
                              width: 16,
                            )),
                        10.width,
                        Expanded(
                            child: Text(
                              model.providerObj!.email!,
                              style: AppStyle.white14
                                  .copyWith(color: AppColors.grey66666),
                            )),
                      ],
                    ),
                    12.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 16,
                            height: 16,
                            child: SvgImage(
                              image: AppSvg.phone,
                              color: AppColors.greyD6D6D6,
                              height: 16,
                              width: 16,
                            )),
                        10.width,
                        Expanded(
                            child: Text(
                              model.providerObj!.mobile!,
                              style: AppStyle.white14
                                  .copyWith(color: AppColors.grey66666),
                            )),
                      ],
                    ),
                  ],
                ),
              ),


            ],
          ),
        ],
      ),
    );
  }


  _deleteFromFavorite(BuildContext context, String id) async {
    var provider =
    await Provider.of<ProvidersListProvider>(context, listen: false);

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
              text: "remove\n",
              style: AppStyle.black18.copyWith(color: AppColors.colorPrimary),
            ),
            TextSpan(text: "provider from suspended \nlist?", style: AppStyle.black18),
          ])),
      positiveText: AppStrings.sure,
      onPressedPositive: () async {
        context.pop();
        await provider.deleteSuspendedProvider(id: id,);
      },
    );
  }
}
