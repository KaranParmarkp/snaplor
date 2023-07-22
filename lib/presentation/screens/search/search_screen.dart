import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/constants/app_strings.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/widgets/app_textfield.dart';
import 'package:jyotishee/presentation/widgets/custom_app_bar.dart';
import 'package:jyotishee/presentation/widgets/dismiss_keyboard_widget.dart';

import '../../widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool search = false;
  RangeValues rangeValues = RangeValues(1000, 8999);
  List<RadioModel> categories = [
    RadioModel(name: "Gemstones", status: false),
    RadioModel(name: "Rudraksha", status: false),
    RadioModel(name: "Pendants", status: false),
    RadioModel(name: "Bracelets", status: false),
    RadioModel(name: "Healing Crystals", status: false),
  ];

  List<RadioModel> weights = [
    RadioModel(name: "5.05 ct.", status: false),
    RadioModel(name: "5.85 ct.", status: false),
    RadioModel(name: "6.00 ct.", status: false),
    RadioModel(name: "6.35 ct.", status: false),
    RadioModel(name: "7.00 ct.", status: false),
  ];

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
              if (!search) ...[
                Text(
                  AppStrings.recentSearch,
                  style: AppStyle.black14,
                ),
                20.height,
                Wrap(
                  runSpacing: 20,
                  spacing: 10,
                  children: [
                    AppChips(title: "Gemstones", color: AppColors.greyDark),
                    AppChips(title: "Rudraksha", color: AppColors.greyDark),
                    AppChips(title: "Pendants", color: AppColors.greyDark),
                    AppChips(title: "Bracelets", color: AppColors.greyDark),
                    AppChips(
                        title: "Healing Crystal", color: AppColors.greyDark),
                  ],
                )
              ],
              if (search)
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
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Container(
                              decoration: AppDecoration.whiteShadowRounded,
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.only(
                                  bottom: 20, left: 4, right: 4, top: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(18),
                                    decoration: AppDecoration.roundedBorder,
                                    child: CircleNetworkImageAvatar(
                                        radius: 20,
                                        image:
                                            "https://images.unsplash.com/photo-1567324216289-97cc4134f626?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
                                  ),
                                  20.width,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                                    "Natural Ruby | Quality",
                                                    style: AppStyle.black14)),
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
                                          "Lorem Ipsum By accessing and placing an order with , you confirm that you are in agreement with and bound by the terms of service ",
                                          style: AppStyle.grey12.copyWith(
                                              color: AppColors.greyDark),
                                          maxLines: 2,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '\u{20B9}',
                                              style: TextStyle(
                                                color: AppColors.colorPrimary,
                                                fontSize: 17,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              "500",
                                              style: AppStyle.purple14,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            itemCount: 20,
                          ),
                        )
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

class RadioModel {
  String name;
  bool status;

  RadioModel({
    required this.name,
    required this.status,
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
