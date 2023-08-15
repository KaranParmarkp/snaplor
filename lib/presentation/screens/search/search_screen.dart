import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/constants/app_strings.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/presentation/widgets/app_textfield.dart';
import 'package:jyotishee/presentation/widgets/custom_app_bar.dart';
import 'package:jyotishee/presentation/widgets/dismiss_keyboard_widget.dart';

import '../../../data/providers/providers.dart';
import '../../widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
class FilterModel {
  String? name;
  String? category;
  String? weight;

  FilterModel({this.name, this.category, this.weight});
}
class _SearchScreenState extends State<SearchScreen> {
  bool search = true;
  RangeValues rangeValues = RangeValues(1000, 8999);
  List<RadioModel> categories = [
    RadioModel(name: "Gemstone", status: false,nameKey: "gemstone"),
    RadioModel(name: "Rudraksha", status: false,nameKey: "rudraksha"),
    RadioModel(name: "Tulsi Mala", status: false,nameKey: "tulsi_mala"),
    RadioModel(name: "Evil Eye", status: false,nameKey: "evil_eye"),
    RadioModel(name: "Healing Crystal", status: false,nameKey: "healing_crystal"),
  ];
  List<RadioModel> weights = [
    RadioModel(name: "5.05 ct.", status: false,nameKey: ""),
    RadioModel(name: "5.85 ct.", status: false,nameKey: ""),
    RadioModel(name: "6.00 ct.", status: false,nameKey: ""),
    RadioModel(name: "6.35 ct.", status: false,nameKey: ""),
    RadioModel(name: "7.00 ct.", status: false,nameKey: ""),
  ];
  FilterModel filterModel = FilterModel();
  @override
  Widget build(BuildContext context) {
    return DismissKeyBoard(
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppStrings.search,
          showProfile: true,
          showBack: false,
          showNotification: true,
        ),
        body: Container(
          height: context.screenHeight,
          width: context.screenWidth,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: HeaderTextField(
                    hint: AppStrings.searchHere,
                    borderRadius: 30,
                  )),
                  20.width,
                  AppRoundedButton(
                      text: AppStrings.search,
                      color: AppColors.colorPrimary,
                      radius: 30,
                      onTap: () {
                        search = !search;
                        setState(() {});
                      },
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                ],
              ),
              10.height,
              AppDivider(),
              20.height,
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => _showFilterSheet(),
                          child: Container(
                            decoration: AppDecoration.purpleLightRounded.copyWith(
                                border:
                                    Border.all(color: AppColors.colorPrimary)),
                            padding: EdgeInsets.all(6),
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgImage(
                                  image: AppSvg.filter,
                                  size: 18,
                                ),
                                10.width,
                                Text(
                                  AppStrings.filters,
                                  style: AppStyle.purple14,
                                ),
                              ],
                            ),
                          ),
                        ),
                        20.height,
                        Expanded(
                          child: AppConsumer<AuthProvider, List<ProductModel>>(
                            taskName: AuthProvider.searchProductKey,
                            load: (provider) => provider.searchProduct(),
                            successBuilder: (data, provider) => ListView.builder(
                              //clipBehavior: Clip.none,
                              itemBuilder: (context, index) => ProductCard(model: data[index]),
                              itemCount: data.length,
                              shrinkWrap: true,
                            ),
                          ),
                        ),
                      ]),
                )
            ],
          ),
        ),
      ),
    );
  }

  _showFilterSheet(){
    AppHelper.showBottomSheet(
        context: context,
        isScrollControlled: true,padding: EdgeInsets.zero,
        innerPadding: EdgeInsets.zero,
        child: StatefulBuilder(
          builder: (context,setState) {
            return SizedBox(
              height: context.screenHeight * 0.90,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(AppStrings.filters,style: AppStyle.black14,),
                  ),
                  AppDivider(color: Colors.black),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            20.height,
                            Text(
                              AppStrings.proCat,
                              style: AppStyle.black12,
                            ),
                            20.height,
                            Container(
                              decoration:
                              AppDecoration.whiteShadowRounded,
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.only(bottom: 20),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      categories[index].status =
                                      !categories[index].status;
                                      setState(() {});
                                    },
                                    child: RadioWidget(
                                        model: categories[index])),
                                itemCount: categories.length,
                                shrinkWrap: true,
                              ),
                            ),
                            Text(
                              AppStrings.filterByWeight,
                              style: AppStyle.black12,
                            ),
                            20.height,
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              decoration:
                              AppDecoration.whiteShadowRounded,
                              padding: EdgeInsets.all(15),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      weights[index].status =
                                      !weights[index].status;
                                      setState(() {});
                                    },
                                    child: RadioWidget(
                                        model: weights[index])),
                                itemCount: weights.length,
                                shrinkWrap: true,
                              ),
                            ),
                            Text(
                              AppStrings.filterByPrice,
                              style: AppStyle.black12,
                            ),
                            20.height,
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              decoration:
                              AppDecoration.whiteShadowRounded,
                              padding: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  RangeSlider(
                                    min: 100,
                                    max: 8999,
                                    activeColor: AppColors.colorPrimary,
                                    values: rangeValues,
                                    onChanged: (value) {
                                      rangeValues = value;
                                      setState(() {});
                                    },
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(left: 14),
                                    child: Row(
                                      children: [
                                        Text(AppStrings.price + ": "),
                                        Text(
                                          "${rangeValues.start.toInt()} - ${rangeValues.end.toInt()}",
                                          style: AppStyle.purple12,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20,bottom: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: AppRoundedButton(text: AppStrings.clearAll,color: AppColors.red,onTap: () {
                                      context.pop();
                                    },),
                                  ),
                                  10.width,
                                  Expanded(
                                    child: AppRoundedButton(text: AppStrings.applyFilters,color: AppColors.colorPrimary,onTap: () {
                                      context.pop();
                                    },),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        ));
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.model,
  });
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.whiteShadowRounded,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(
          bottom: 20, left: 4, right: 4, top: 4),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: AppDecoration.roundedBorder,
              child: CircleNetworkImageAvatar(
                  radius: 23,
                  image: model.thumbnailImage),
            ),
            10.width,
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                              model.productName!.toCapitalized(),maxLines: 2,overflow: TextOverflow.ellipsis,
                              style: AppStyle.black12)),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10),
                        child: Icon(
                          Icons.share_rounded,
                          size: 20,
                          color: AppColors.greyDark,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    model.description??"",
                    style: AppStyle.grey12.copyWith(
                      overflow: TextOverflow.ellipsis,fontSize: 10,
                        color: AppColors.greyDark),
                    maxLines: 3,
                  ),
                  Spacer(),
                  4.height,
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.start,
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Rupee(fontSize: 14),
                      Text(
                        model.pricePerRatti.toString(),
                        style: AppStyle.purple12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadioModel {
  String name;
  String nameKey;
  bool status;

  RadioModel({
    required this.name,
    required this.status,
    required this.nameKey,
  });
}

class RadioWidget extends StatelessWidget {
  const RadioWidget({super.key, required this.model});

  final RadioModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          10.width,
          CircleAvatar(
              radius: 10,
              backgroundColor: AppColors.greyOutline,
              child: CircleAvatar(
                radius: 8,
                backgroundColor:
                    model.status ? AppColors.colorPrimary : AppColors.white,
              )),
          20.width,
          Text(model.name)
        ],
      ),
    );
  }
}
