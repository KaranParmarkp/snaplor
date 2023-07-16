import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jyotishee/data/models/call_off_model.dart';
import 'package:jyotishee/presentation/screens/dashboard/approve_times/approve_times_details_screen.dart';

import '../../../../app/utils/utils.dart';
import '../../../../data/models/models.dart';
import '../../../../data/providers/providers.dart';
import '../../../widgets/widgets.dart';

class ApproveTimesScreen extends StatefulWidget {
  const ApproveTimesScreen({super.key, this.fromDrawer = false});

  final bool fromDrawer;

  @override
  State<ApproveTimesScreen> createState() => _ApproveTimesScreenState();
}

class _ApproveTimesScreenState extends State<ApproveTimesScreen> {
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
        title: AppStrings.approveTimesDrawer,
      ),
      body: SizedBox(
        height: context.screenHeight,
        child: AppConsumer<ShiftsProvider, List<CallOffModel>>(
          taskName: ShiftsProvider.approveTimesListKey,
          load: (provider) => provider.approveTimesList(refresh: false,status: widget.fromDrawer ? status.value : null),
          successBuilder: (data,provider) => Column(
            children: [
              if(widget.fromDrawer)Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: AppDecoration.whiteWithShadow
                    .copyWith(borderRadius: BorderRadius.circular(0)),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: InkWell(
                  onTap: () async {
                    ButtonModel? response = await AppHelper.showGenericTypeSheet(
                        context: context, list: statusOptions);
                    if(response.isNotNull)status = response!;
                    setState(() {});
                    provider.approveTimesList(refresh: true,status: status.value);
                  },
                  child: Row(
                    children: [
                      Text(
                        status.value,
                        style: AppStyle.black18,
                      ),
                      30.width,
                      Icon(
                        Icons.arrow_drop_down_outlined,
                        size: 35,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      ApproveTimeCard(model: data[index],status: widget.fromDrawer==true ? status.value : null),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ApproveTimeCard extends StatefulWidget {
  const ApproveTimeCard({
    super.key,
    required this.model, this.status,
  });

  final CallOffModel model;
  final String? status;

  @override
  State<ApproveTimeCard> createState() => _ApproveTimeCardState();

  static rejectReasonSheet(
      {required BuildContext context, required String id, String? status}) async {
    var provider = await Provider.of<ShiftsProvider>(context, listen: false);
    final nameController = TextEditingController();
    FocusNode nameFocus = FocusNode();
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
                child: Row(
                  children: [
                    Text(
                      AppStrings.reason,
                      style: AppStyle.black16,
                    ),
                    Text(
                      " \*",
                      style: TextStyle(color: AppColors.redFF0000),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: MultipleLineTextField(
                    controller: nameController,
                    focusNode: nameFocus,
                    maxLines: 4),
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
                            style: AppStyle.black16Bold
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
                                    AppValidator.messageBuilder("reason")!);
                            nameFocus.requestFocusDelayed();
                          } else {
                            context.pop();
                            await provider.rejectBid(id, nameController.text, status);
                            //if(model.isNull)await provider.addFavGroup(name: nameController.text);
                            //else await provider.updateFavGroup(id: model!.id.toString(),name: nameController.text);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: Center(
                              child: Text(
                            AppStrings.submit.toCapitalized(),
                            style: AppStyle.black16Bold
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

  static approveReasonSheet(
      {required BuildContext context, required String id}) async {
    var provider = await Provider.of<ShiftsProvider>(context, listen: false);
    final feedbackController = TextEditingController();
    final bonusController = TextEditingController();
    FocusNode feedbackFocus = FocusNode();
    double rating = 0.0;
    bool bonus = false;
    return AppHelper.showBottomSheet(
        context: context,
        showCloseIcon: false,
        isScrollControlled: true,
        innerPadding: EdgeInsets.only(
          top: 36,
        ),
        padding: EdgeInsets.zero,
        child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return DismissKeyBoard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: Row(
                    children: [
                      Text(
                        AppStrings.reason,
                        style: AppStyle.black16,
                      ),
                      Text(
                        " \*",
                        style: TextStyle(
                            color: AppColors.redFF0000,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: Center(
                    child: RatingBar(
                      itemSize: 40,
                      glow: false,
                      //wrapAlignment: WrapAlignment.center,
                      itemPadding: EdgeInsets.only(right: 10, left: 10),
                      ratingWidget: RatingWidget(
                        empty: Image.asset(AppImages.ratingGray),
                        half: Image.asset(AppImages.ratingGray),
                        full: Image.asset(AppImages.ratingYellow),
                      ),
                      itemCount: 5,
                      allowHalfRating: false,
                      initialRating: rating,
                      onRatingUpdate: (value) {
                        rating = value;

                        setState(
                          () {},
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: Row(
                    children: [
                      Text(
                        AppStrings.feedback,
                        style: AppStyle.black16,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: MultipleLineTextField(
                      controller: feedbackController,
                      focusNode: feedbackFocus,
                      maxLines: 4,
                      hint: AppStrings.enterFeedback),
                ),
                if (rating >= 3) ...[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      AppStrings.wantPerformance,
                      style: AppStyle.black16,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                            child: AppButton(
                          onTap: () {
                            bonus = true;
                            setState(
                              () {},
                            );
                          },
                          title: AppStrings.yes.toUpperCase(),
                          outlineColor:
                              bonus == false ? AppColors.hintGrey : null,
                          buttonTextColor: bonus == true
                              ? AppColors.white
                              : AppColors.hintGrey,
                          textStyle: AppStyle.white16.copyWith(
                              color: bonus == false
                                  ? AppColors.hintGrey
                                  : AppColors.white),
                        )),
                        20.width,
                        Expanded(
                            child: AppButton(
                          title: AppStrings.no.toUpperCase(),
                          onTap: () {
                            bonus = false;
                            setState(
                              () {},
                            );
                          },
                          outlineColor:
                              bonus == true ? AppColors.hintGrey : null,
                          buttonTextColor: bonus == false
                              ? AppColors.white
                              : AppColors.hintGrey,
                          textStyle: AppStyle.white16.copyWith(
                              color: bonus == true
                                  ? AppColors.hintGrey
                                  : AppColors.white),
                        )),
                      ],
                    ),
                  ),
                  if (bonus)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: MultipleLineTextField(
                          hint: AppStrings.enterPerformance,
                          controller: bonusController,
                          focusNode: FocusNode(),
                          maxLines: 1,
                          radius: 30,
                          keyboardType: TextInputType.number),
                    ),
                ],
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
                              style: AppStyle.black16Bold
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
                            if (rating == 0.0) {
                              AppHelper.showImageToast(
                                  message:
                                      AppValidator.messageBuilder("rating")!);
                            } else {
                              context.pop();
                              provider.approveBid(ApproveBidRequestModel(
                                  rating: rating.toInt(),
                                  bonus: bonusController.text,
                                  feedback: feedbackController.text,
                                  id: id));
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 24),
                            child: Center(
                                child: Text(
                              AppStrings.submit.toCapitalized(),
                              style: AppStyle.black16Bold
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
          );
        }));
  }

  static noCallNoShowDialog(
      {required BuildContext context, required String id}) async {
    var provider = await Provider.of<ShiftsProvider>(context, listen: false);
    AppHelper.showCustomDialog(
      context: context,
      title: RichText(
          text: TextSpan(
              text: AppStrings.isItMarkedNCNS, style: AppStyle.black20),
          textAlign: TextAlign.center),
      positiveText: AppStrings.sure,
      onPressedPositive: () {
        context.pop();
        provider.approveTimeNCNSStatus(id: id, status: "NCNS");
      },
    );
  }
}

class _ApproveTimeCardState extends State<ApproveTimeCard> {
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
                    title: widget.model.clockObj.isNotNull
                        ? widget.model.clockObj!.clockinClockoutStatus
                        : "No Call No Show",
                    color: AppColors.redFf4646),
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
            child: IntrinsicHeight(
              child: Row(
                children: [
                  CircleNetworkImageAvatar(
                      image:
                          "${widget.model.providerObj?.profileUrl}${widget.model.providerObj?.profile}"),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            initialRating:
                                widget.model.providerObj?.avgRating ?? 0.0,
                            updateOnDrag: false,
                            tapOnlyMode: true,
                            onRatingUpdate: (value) {},
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgImage(image: AppSvg.price),
                            8.width,
                            Text(
                              "\$${widget.model.price}/hr",
                              style: AppStyle.black16
                                  .copyWith(color: AppColors.orangeF7931e),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          TitleRowCard(
            title: AppStrings.clockIn,
            answer: widget.model.clockObj?.clockinTime!=null
                ? DateTimeHelper.dateWithTime(
                    widget.model.clockObj?.clockinTime)
                : "",
          ),
          TitleRowCard(
            title: AppStrings.clockOut,
            answer: widget.model.clockObj?.clockoutTime!=null
                ? DateTimeHelper.dateWithTime(
                    widget.model.clockObj!.clockoutTime)
                : "",
          ),
          TitleRowCard(
            title: AppStrings.breakTime,
            answer: widget.model.clockObj?.breakTime ?? "",
          ),
          TitleRowCard(
            title: AppStrings.finalTime,
            answer: widget.model.clockObj?.finalTime ?? "",
          ),
          10.height,
          // reject edit and approve buttons
          if (widget.model.clockObjs?.first.changeLockByInvoice != "Y" &&
              widget.model.tagOfClock != "has_no_clocks" &&
              widget.model.clockObjs.isNotNull &&
              widget.model.clockObjs?.first.clockinClockoutStatus !=
                  "Approved" &&
              widget.model.clockObjs?.first.clockinClockoutStatus != "Rejected")
            Row(
              children: [
                Expanded(
                  child: AppShadeButton(
                    text: "Reject",
                    startColor: AppColors.primaryRedFfc2c2,
                    bold: true,
                    endColor: AppColors.redFf4646,
                    onTap: () =>
                        ApproveTimeCard.rejectReasonSheet(context: context,status : widget.status,id: widget.model.clockObj!.id.toString()),
                  ),
                ),
                20.width,
                Expanded(
                  child: AppShadeButton(
                    text: AppStrings.edit,
                    startColor: AppColors.primaryAccent,
                    bold: true,
                    endColor: AppColors.colorPrimary,
                    onTap: () async {
                      var provider =
                          Provider.of<ShiftsProvider>(context, listen: false);
                      CallOffModel? model = await provider.approveBidDetails(
                          widget.model.clockObj!.id.toString());
                      context.push(ApproveTimesDetailsScreen(
                        model: model!,
                        isEdit: true,
                      ));
                    },
                  ),
                ),
                20.width,
                Expanded(
                  child: AppShadeButton(
                    text: "Approve",
                    startColor: AppColors.primaryAccent,
                    bold: true,
                    endColor: AppColors.colorPrimary,
                    onTap: () => ApproveTimeCard.approveReasonSheet(
                        context: context,
                        id: widget.model.providerObj!.id.toString()),
                  ),
                ),
              ],
            ),

          // reject approve buttons
          if (widget.model.clockObjs?.first.changeLockByInvoice != "Y" &&
              widget.model.tagOfClock != "has_no_clocks" &&
              widget.model.clockObjs.isNotNull)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                20.width,
                if (widget.model.clockObjs?.first.clockinClockoutStatus ==
                    "Approved")
                  AppShadeButton(
                    text: "Undo Approve",
                    startColor: AppColors.primaryAccent,
                    bold: true,
                    endColor: AppColors.colorPrimary,
                    //onTap: () => ApproveTimeCard.rejectReasonSheet(context: context),
                  ),
                20.width,
                if (widget.model.clockObjs?.first.clockinClockoutStatus ==
                    "Rejected")
                  AppShadeButton(
                    text: "Undo Reject",
                    startColor: AppColors.primaryAccent,
                    bold: true,
                    endColor: AppColors.colorPrimary,
                    onTap: () => ApproveTimeCard.approveReasonSheet(
                        context: context, id: widget.model!.id.toString()),
                  ),
              ],
            ),

          //no call no show
          if (widget.model.tagOfClock == "has_no_clocks" &&
              widget.model.status != "NCNS")
            Row(
              children: [
                40.width,
                Expanded(
                  flex: 3,
                  child: AppShadeButton(
                    text: AppStrings.noCallNoShow,
                    startColor: AppColors.primaryRedFfc2c2,
                    bold: true,
                    endColor: AppColors.redFf4646,
                    onTap: () => ApproveTimeCard.noCallNoShowDialog(
                        context: context, id: widget.model.id.toString()),
                  ),
                ),
                20.width,
                Expanded(
                  flex: 2,
                  child: AppShadeButton(
                    text: "Add Time",
                    startColor: AppColors.primaryAccent,
                    bold: true,
                    endColor: AppColors.colorPrimary,
                    onTap: () async {
                      await context
                          .push(ApproveTimesDetailsScreen(model: widget.model));
                      var provider =
                          Provider.of<ShiftsProvider>(context, listen: false);
                      provider.approveTimesList(refresh: true,status: widget.status);
                    },
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
