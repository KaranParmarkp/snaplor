import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jyotishee/data/models/call_off_model.dart';
import 'package:jyotishee/presentation/screens/dashboard/approve_times/approve_times_details_screen.dart';
import 'package:jyotishee/presentation/screens/provider/recommended_provider_screen.dart';
import 'package:jyotishee/presentation/screens/shift/shift_details/shift_details_screen.dart';

import '../../../../app/utils/utils.dart';
import '../../../../data/models/models.dart';
import '../../../../data/providers/providers.dart';
import '../../../widgets/widgets.dart';

class CallOffsScreen extends StatefulWidget {
  const CallOffsScreen({super.key, this.fromDrawer = false});

  final bool fromDrawer;

  @override
  State<CallOffsScreen> createState() => _CallOffsScreenState();
}

class _CallOffsScreenState extends State<CallOffsScreen> {
  static List<ButtonModel> statusOptions = [
    ButtonModel(id: 1, value: "All"),
    ButtonModel(id: 2, value: "Pending"),
    ButtonModel(id: 3, value: "Approved"),
    ButtonModel(id: 4, value: "Rejected"),
  ];
  ButtonModel status = statusOptions.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyF5F5F5,
      appBar: CustomAppBar(
        title: AppStrings.callOf,
      ),
      body: SizedBox(
        height: context.screenHeight,
        child: AppConsumer<ShiftsProvider, List<CallOffModel>>(
          taskName: ShiftsProvider.callOffsListKey,
          load: (provider) => provider.callOffsList(),
          successBuilder: (data, provider) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => InkWell(
                onTap: () async {
                  bool? response = await context.push(ShiftDetailsScreen(
                    id: data[index].id.toString(),
                    pending: data[index].status == "Pending",
                    status: data[index].status!,
                  ));
                  provider.callOffsList(refresh: true);
                },

                child: CallOffsCard(model: data[index])),
          ),
        ),
      ),
    );
  }
}

class CallOffsCard extends StatefulWidget {
  const CallOffsCard({
    super.key,
    required this.model,
  });

  final CallOffModel model;

  @override
  State<CallOffsCard> createState() => _CallOffsCardState();
}

class _CallOffsCardState extends State<CallOffsCard> {
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
                  DateTimeHelper.dateWithDay(widget.model.shiftObj!.startDate),
                  style: AppStyle.black16,
                )),
                Text(
                  DateTimeHelper.convertTimeFormat(
                          widget.model.shiftObj!.startTime) +
                      " - " +
                      DateTimeHelper.convertTimeFormat(
                          widget.model.shiftObj!.endTime),
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
            padding: const EdgeInsets.only(top: 12, bottom: 8),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  widget.model.shiftObj!.title +
                      " #" +
                      widget.model.jobFk.toString(),
                  style: AppStyle.black16,
                )),
                AppChips(
                    title: widget.model.shiftObj?.status!,
                    color: widget.model.shiftObj?.status == "Open"
                        ? AppColors.green19D5AF
                        : AppColors.redFf4646),
              ],
            ),
          ),
          Wrap(
            spacing: 6,
            children: [
              AppChips(
                  title: widget.model.shiftObj?.scheduleType ?? "",
                  color: AppColors.colorPrimary),
              AppChips(
                  title: widget.model.shiftObj?.shiftKeyword ?? "",
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
                  widget.model.shiftObj?.locationObj?.name ?? "",
                  style: AppStyle.black16.copyWith(color: AppColors.grey66666),
                )),
              ],
            ),
          ),
          Divider(
            height: 0,
            color: AppColors.greyC0C0C0,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18, top: 10),
            child: Row(
              children: [
                CircleNetworkImageAvatar(
                    image:
                        "${widget.model.providerObj?.profileUrl}${widget.model.providerObj?.profile}"),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${widget.model.providerObj?.firstName ?? ""} "
                              "${widget.model.providerObj?.middleName ?? ""} "
                              "${widget.model.providerObj?.lastName ?? ""}",
                              style: AppStyle.black16Bold,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
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
                            initialRating:
                                widget.model.providerObj?.avgRating ?? 0.0,
                            updateOnDrag: false,
                            tapOnlyMode: true,
                            onRatingUpdate: (value) {},
                          ),
                        ),
                        Row(
                          children: [
                            if (widget.model.providerObj.isNotNull)
                              AppChips(
                                  title:
                                      widget.model.providerObj!.specialityName,
                                  color: AppColors.colorPrimary),
                            Spacer(),
                            InkWell(
                              onTap: () => _showChatSheet(context),
                              child: SizedBox(
                                  height: 45,
                                  width: 45,
                                  child: Image.asset(AppImages.chatMessage)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          TitleRowCard(
            title: AppStrings.callOfTime,
            answer: DateTimeHelper.dateWithTime(widget.model.statusDatetime),
          ),
          TitleRowCard(
            title: AppStrings.reason,
            answer: widget.model.reason ?? "",
          ),
          AppDivider(),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              children: [
                70.width,
                Spacer(),
                AppOutlineButton(
                  title: AppStrings.recProvider,
                  onTap: () => context.push(RecommendedProviderScreen(shiftId: widget.model.shiftObj!.id.toString(),)),
                  color: AppColors.colorPrimary,
                ),
              ],
            ),
          )
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
                await AppHelper.launchSMS(widget.model.providerObj!.mobile!);
              },
            ),
            LightRoundButton(
              title: AppStrings.call.toUpperCase(),
              onTap: () async {
                context.pop();
                await AppHelper.launchCall(widget.model.providerObj!.mobile!);
              },
            ),
            LightRoundButton(
              title: AppStrings.email.toUpperCase(),
              onTap: () async {
                context.pop();
                await AppHelper.launchEmail(widget.model.providerObj!.email!);
              },
            ),
          ],
        ));
  }
}
