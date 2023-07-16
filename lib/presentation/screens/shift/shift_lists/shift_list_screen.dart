import 'package:flutter/material.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/data/providers/shifts_provider.dart';
import 'package:jyotishee/presentation/screens/shift/shift_details/shift_details_screen.dart';
import 'package:jyotishee/presentation/screens/shift/shift_filter/shift_filter_screen.dart';

import '../../../../app/utils/utils.dart';
import '../../../widgets/widgets.dart';

class ShiftListScreen extends StatelessWidget {
  const ShiftListScreen({super.key, required this.shiftType, this.title});

  final ShiftsTypes shiftType;
  final String? title;

  _apiCall(BuildContext context){
    Provider.of<ShiftsProvider>(context, listen: false).shiftListsRefresh(ShiftListRequestModel(shiftsType: shiftType));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyF5F5F5,
      appBar: CustomAppBar(
        title: title ?? AppStrings.shiftList,
          trailingIcon: shiftType==ShiftsTypes.shiftList ? SvgImage(
            image: AppSvg.searchQuery,
            color: Colors.black,
            onTap: () => context.push(ShiftFilterScreen(shiftsTypes: shiftType)),
          ) : SizedBox()
      ),
      body: SizedBox(
        height: context.screenHeight,
        child: AppConsumer<ShiftsProvider, List<ModelShiftCalenderList>>(
          taskName: ShiftsProvider.shiftListKey,
          load: (provider) =>
              provider.shiftLists(ShiftListRequestModel(shiftsType: shiftType)),
          successBuilder: (data,provider) => ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => InkWell(
                onTap: () async {
                  bool? response = await context.push(ShiftDetailsScreen(
                    id: data[index].id.toString(),
                    pending: data[index].status == "Pending",
                    status: data[index].status!,
                  ));
                  _apiCall(context);
                },
                child: ShiftDetailCard(model: data[index])),
          ),
        ),
      ),
    );
  }
}

class ShiftDetailCard extends StatelessWidget {
  const ShiftDetailCard({
    super.key,
    required this.model,
  });

  final ModelShiftCalenderList model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14),
      decoration: BoxDecoration(color: AppColors.white, boxShadow: [
        BoxShadow(
          blurRadius: 4,
          color: AppColors.shadowColor,
          offset: Offset(0, 0),
        )
      ]),
      padding: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SvgImage(image: AppSvg.timeShift),
                ),
                Expanded(
                    child: Text(
                  DateTimeHelper.dateWithDay(model.startDate!),
                  style: AppStyle.black16,
                )),
                Text(
                  DateTimeHelper.convertTimeFormat(model.startTime!) +
                      " - " +
                      DateTimeHelper.convertTimeFormat(model.endTime!),
                  style: AppStyle.black16,
                ),
              ],
            ),
          ),
          Divider(
            height: 0,
            color: AppColors.greyC0C0C0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  model.title! + " #" + model.id.toString(),
                  style: AppStyle.black16,
                )),
                AppChips(
                    title: model.status!,
                    color:
                        model.status == "Expired" || model.status == "Canceled"
                            ? AppColors.hintGrey
                            : AppColors.green19D5AF),
              ],
            ),
          ),
          Wrap(
            spacing: 6,
            children: [
              AppChips(
                  title: model.scheduleType ?? "",
                  color: AppColors.colorPrimary),
              AppChips(
                  title: model.shiftKeyword ?? "",
                  color: AppColors.colorPrimary),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 14),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SvgImage(image: AppSvg.address),
                ),
                Expanded(
                    child: Text(
                  model.locationObj?.name ?? "",
                  style: AppStyle.black16.copyWith(color: AppColors.grey66666),
                )),
                Expanded(
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgImage(image: AppSvg.price),
                      8.width,
                      Text(
                        "\$${model.nurseRate}/hr",
                        style: AppStyle.black16
                            .copyWith(color: AppColors.orangeF7931e),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
          Divider(
            height: 0,
            color: AppColors.greyC0C0C0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "Need：${model.professionalNumber}",
                  style: AppStyle.black16,
                )),
                Expanded(
                    child: Center(
                        child: Text(
                  "Filled：${model.acceptedCount}",
                  style: AppStyle.black16,
                ))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    width: 100,
                    child: Stack(
                      children: [
                        if (model.providerList.isNotNull &&
                            model.providerList!.length != 0)
                          for (int i = 0;
                              i <
                                  (model.providerList!.length <= 3
                                      ? model.providerList!.length
                                      : 3);
                              i++)
                            Positioned(
                              top: 0,
                              left: i * 18,
                              child: Container(
                                width: 40,
                                height: 40,
                                child: CircleAvatar(
                                  radius: 42,
                                  backgroundColor: AppColors.white,
                                  child: CircleNetworkImageAvatar(
                                    image: model.providerList![i].profileUrl +
                                        model.providerList![i].profile,
                                  ),
                                ),
                              ),
                            ),
                        Positioned(
                          top: 0,
                          left: model.providerList.isNotNull &&
                                  model.providerList!.length != 0
                              ? (model.providerList!.length <= 3
                                      ? model.providerList!.length
                                      : 3) +
                                  1.5 * 18
                              : 0,
                          child: Container(
                              width: 40,
                              height: 40,
                              child: model.acceptedCount.toString() !=
                                      model.professionalNumber.toString()
                                  ? SvgImage(image: AppSvg.add)
                                  : SizedBox()),
                        ),
                      ],
                    ),
                  ),
                ),
                if (model.pendingBidsCount.isNotNull &&
                    model.pendingBidsCount! >= 1)
                  AppOutlineButton(
                    title: "Pending Bid [${model.pendingBidsCount}]",
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
