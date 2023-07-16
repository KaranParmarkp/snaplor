import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/screens/dashboard/approve_times/break_time_screen.dart';
import '../../../../app/utils/utils.dart';
import '../../../widgets/widgets.dart';

class ApproveTimesDetailsScreen extends StatefulWidget {
  const ApproveTimesDetailsScreen({
    super.key,
    required this.model, this.title,  this.isEdit=false,
  });

  final CallOffModel model;
  final String? title;
  final bool isEdit;

  @override
  State<ApproveTimesDetailsScreen> createState() =>
      _ApproveTimesDetailsScreenState();
}

class _ApproveTimesDetailsScreenState extends State<ApproveTimesDetailsScreen> {
  DateTime? clockInDateTime;
  DateTime? clockOutDateTime;
  CallOffModel? modelMain;
  List<BreakTimeModel> list = [];
  List<BreakAddTimeModel> breakList = [];

  @override
  void initState() {
    super.initState();
    modelMain = widget.model;
    if (widget.model.clockObj.isNotNull) {
      clockInDateTime =
          DateTimeHelper.stringToDateTime(widget.model.clockObj!.clockinTime);
      clockOutDateTime =
          DateTimeHelper.stringToDateTime(widget.model.clockObj!.clockoutTime);
    }
    print(widget.model.clockObj?.breakObjs);
    widget.model.clockObj?.breakObjs.forEach((element) {
      list.add(BreakTimeModel(id: '',breakStartTime: element.breakStarttime,breakStopTime: element.breakStoptime,totalBreakTime: "",action: "",position: 0));
    });
    if (mounted) setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title ?? AppStrings.approveTimesDrawer,
        gradient: true,
      ),
      body: SizedBox(
        height: context.screenHeight,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 320,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 260,
                          decoration: AppDecoration.splash,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              constraints: BoxConstraints(maxWidth: 500),
                              width: context.screenWidth,
                              padding:
                              const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25, bottom: 15),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "${modelMain!.shiftObj!
                                                .title} - #${modelMain!.jobFk
                                                .toString()}",
                                            style: AppStyle.white18Bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Wrap(
                                    spacing: 6,
                                    children: [
                                      AppChips(
                                          title: modelMain!.shiftObj
                                              ?.scheduleType ??
                                              "",
                                          color: AppColors.colorPrimary,
                                          bgColor: AppColors.white),
                                      AppChips(
                                          title: modelMain!.shiftObj
                                              ?.shiftKeyword ??
                                              "",
                                          color: AppColors.colorPrimary,
                                          bgColor: AppColors.white),
                                    ],
                                  ),
                                  14.height,
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Text(
                                      modelMain!.shiftObj!.locationObj
                                          ?.name ??
                                          "",
                                      style: AppStyle.white16,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          "${AppStrings.publishedRate}:",
                                          style: AppStyle.white16,
                                        ),
                                        17.width,
                                        Text(
                                          "\$${modelMain!.shiftObj!
                                              .nurseRate}/hr",
                                          style: AppStyle.white16,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 14),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(right: 10),
                                          child: SvgImage(
                                            image: AppSvg.timeShift,
                                            color: AppColors.white,
                                          ),
                                        ),
                                        Expanded(
                                            child: Text(
                                                DateTimeHelper.dateWithDay(
                                                    modelMain!.shiftObj!
                                                        .startDate!),
                                                style: AppStyle.white16)),
                                        Text(
                                            DateTimeHelper.convertTimeFormat(
                                                modelMain!.shiftObj!
                                                    .startTime!) +
                                                " - " +
                                                DateTimeHelper
                                                    .convertTimeFormat(widget
                                                    .model!
                                                    .shiftObj!
                                                    .endTime!),
                                            style: AppStyle.white16),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: AppDecoration.whiteWithShadow,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: IntrinsicHeight(
                                        child: Row(
                                          children: [
                                            CircleNetworkImageAvatar(
                                                image:
                                                "${modelMain!.providerObj
                                                    ?.profileUrl}${modelMain!
                                                    .providerObj?.profile}"),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16, top: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "${modelMain!
                                                            .providerObj
                                                            ?.firstName ?? ""} "
                                                            "${modelMain!
                                                            .providerObj
                                                            ?.middleName ??
                                                            ""} "
                                                            "${modelMain!
                                                            .providerObj
                                                            ?.lastName ?? ""}",
                                                        style: AppStyle
                                                            .black16Bold,
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(vertical: 8),
                                                    child: RatingBar(
                                                      itemSize: 20,
                                                      itemPadding:
                                                      EdgeInsets.only(
                                                          right: 4),
                                                      ratingWidget:
                                                      RatingWidget(
                                                        empty: Image.asset(
                                                            AppImages
                                                                .ratingGray),
                                                        half: Image.asset(
                                                            AppImages
                                                                .ratingGray),
                                                        full: Image.asset(
                                                            AppImages
                                                                .ratingYellow),
                                                      ),
                                                      itemCount: 5,
                                                      allowHalfRating: true,
                                                      ignoreGestures: true,
                                                      initialRating: widget
                                                          .model!
                                                          .providerObj
                                                          ?.avgRating ??
                                                          0.0,
                                                      updateOnDrag: false,
                                                      tapOnlyMode: true,
                                                      onRatingUpdate:
                                                          (value) {},
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      SvgImage(
                                                          image: AppSvg.price),
                                                      8.width,
                                                      Text(
                                                        "\$${modelMain!
                                                            .price}/hr",
                                                        style: AppStyle.black16
                                                            .copyWith(
                                                            color: AppColors
                                                                .orangeF7931e),
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
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),

                  // provider list container
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 22),
                    child: Text(
                      "Details",
                      style: AppStyle.blackBold26
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 22),
                    decoration: AppDecoration.whiteWithShadow,
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        16.height,
                        AbsorbPointer(
                          absorbing: widget.title == AppStrings.preview,
                          child: InkWell(
                            onTap: () async {
                              DateTime? date = await _showDateTimePicker();
                              if (date.isNotNull) {
                                if (clockOutDateTime.isNotNull &&
                                    clockOutDateTime!.isBefore(date!)) {
                                  AppHelper.showImageToast(
                                      message:
                                      AppStrings.clockInLessThanClockOut);
                                } else {
                                  clockInDateTime = date;
                                }
                              }
                              setState(() {

                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Row(
                                children: [
                                  Text(
                                    AppStrings.clockIn,
                                    style: AppStyle.black16
                                        .copyWith(color: AppColors.hintGrey),
                                  ),
                                  Spacer(),
                                  if(clockInDateTime.isNotNull)Text(
                                    DateTimeHelper.dateWithTime(
                                        clockInDateTime),
                                    textAlign: TextAlign.right,
                                    style: AppStyle.black16,
                                  ),
                                  10.width,
                                  Icon(Icons.arrow_forward_ios_rounded,
                                      size: 20, color: AppColors.hintGrey),
                                ],
                              ),
                            ),
                          ),
                        ),
                        AbsorbPointer(
                          absorbing: widget.title == AppStrings.preview,
                          child: InkWell(
                            onTap: () async {
                              DateTime? date = await _showDateTimePicker();
                              if (date.isNotNull) {
                                if (clockInDateTime.isNotNull &&
                                    clockInDateTime!.isAfter(date!)) {
                                  print("if");
                                  AppHelper.showImageToast(
                                      message:
                                      AppStrings.clockOutGreaterThanClockIn);
                                } else if (clockInDateTime.isNotNull &&
                                    clockInDateTime!.isBefore(date!)) {
                                  print("else if");
                                  clockOutDateTime = date;
                                } else {
                                  print("else else");
                                  clockOutDateTime = date;
                                }
                              }
                              else {
                                print("else");
                              }
                              setState(() {

                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Row(
                                children: [
                                  Text(
                                    AppStrings.clockOut,
                                    style: AppStyle.black16
                                        .copyWith(color: AppColors.hintGrey),
                                  ),
                                  Spacer(),
                                  if(clockOutDateTime.isNotNull)Text(
                                    DateTimeHelper.dateWithTime(
                                        clockOutDateTime),
                                    textAlign: TextAlign.right,
                                    style: AppStyle.black16,
                                  ),
                                  10.width,
                                  Icon(Icons.arrow_forward_ios_rounded,
                                      size: 20, color: AppColors.hintGrey),
                                ],
                              ),
                            ),
                          ),
                        ),
                        AbsorbPointer(
                          absorbing: widget.title == AppStrings.preview,
                          child: InkWell(
                            onTap: () async {
                              if (clockInDateTime.isNull ||
                                  clockOutDateTime.isNull) {
                                AppHelper.showImageToast(
                                    message: "Please select time");
                              } else {
                                if (modelMain!.clockObj.isNull) {
                                  modelMain!.clockObj = ClockObj();
                                  print("nulllllllllll");
                                }
                                modelMain!.clockObj!.clockinTime =
                                    clockInDateTime.toString();
                                modelMain!.clockObj!.clockoutTime =
                                    clockOutDateTime.toString();
                                setState(() {

                                },);
                                var response = await context.push(BreakTimeScreen(
                                    model: modelMain!, list: list));
                                list = [];
                                list = response;
                                if (list.isNotNull) {
                                  list.forEach((element) {
                                    element.totalBreakTime = (DateTimeHelper
                                        .stringToDateTimeMMDDYYYHHMMA(
                                        element.breakStopTime)
                                        .millisecondsSinceEpoch - DateTimeHelper
                                        .stringToDateTimeMMDDYYYHHMMA(
                                        element.breakStartTime)
                                        .millisecondsSinceEpoch).toString();
                                    breakList.add(BreakAddTimeModel(
                                        breakStartDatetime: element
                                            .breakStartTime,
                                        breakEndDatetime: element
                                            .breakStopTime));
                                  });

                                  final convertToTime = list
                                      .map((it) => int.parse(it.totalBreakTime))
                                      .fold(0, (previousValue,
                                      element) => previousValue + element);

                                  Duration duration = Duration(
                                      milliseconds: convertToTime);
                                  String formattedTime = '${duration.inHours
                                      .toString().padLeft(2, '0')}:'
                                      '${(duration.inMinutes % 60)
                                      .toString()
                                      .padLeft(2, '0')}:'
                                      '${(duration.inSeconds % 60)
                                      .toString()
                                      .padLeft(2, '0')}';
                                  modelMain!.clockObj?.breakTime =
                                      formattedTime; //'${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
                                  setState(() {

                                  });
                                }
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Row(
                                children: [
                                  Text(
                                    AppStrings.breakTime,
                                    style: AppStyle.black16
                                        .copyWith(color: AppColors.hintGrey),
                                  ),
                                  Spacer(),
                                  if(modelMain?.clockObj?.breakTime !=
                                      null)Text(
                                    modelMain?.clockObj?.breakTime,
                                    textAlign: TextAlign.right,
                                    style: AppStyle.black16,
                                  ),
                                  10.width,
                                  Icon(Icons.arrow_forward_ios_rounded,
                                      size: 20, color: AppColors.hintGrey),
                                ],
                              ),
                            ),
                          ),
                        ),
                        4.height,
                        if(widget.title == AppStrings.preview)...[Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            children: [
                              Text(
                                AppStrings.finalTime,
                                style: AppStyle.black16
                                    .copyWith(color: AppColors.hintGrey),
                              ),
                              Spacer(),
                              Text(
                                modelMain?.clockObj?.finalTime,
                                textAlign: TextAlign.right,
                                style: AppStyle.black16,
                              ),
                              10.width,
                              Icon(Icons.arrow_forward_ios_rounded,
                                  size: 20, color: AppColors.hintGrey),
                            ],
                          ),
                        ),
                          4.height]
                      ],
                    ),
                  ),

                  80.height,
                ],
              ),
            ),
            widget.title == AppStrings.preview ?
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 66,
                decoration: AppDecoration.whiteWithShadow
                    .copyWith(borderRadius: BorderRadius.circular(0)),
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 12, bottom: 8),
                    child: /* widget.status == "Open" ?*/
                    AppButton(
                      title: AppStrings.submit.toUpperCase(),
                      textFontSize: 16,
                      onTap: () async {
                        _submitOnTap(context, false);
                      },
                    )
                  /*  : Row(
                      children: [
                        Expanded(
                            child: AppOutlineButton(
                                onTap: () => _cancelShift(
                                    context, provider, data),
                                title: AppStrings.cancel,
                                color: AppColors.hintGrey)),
                        10.width,
                        Expanded(
                            child: AppOutlineButton(
                                title: AppStrings.edit,
                                color: AppColors.hintGrey)),
                        10.width,
                        Expanded(
                            child: AppShadeButton(
                                onTap: () => provider.shiftPublish(data.id.toString()),
                                text: "Publish",
                                startColor: AppColors.primaryAccent,
                                endColor: AppColors.colorPrimary))
                      ],
                    ),*/
                ),
              ),
            ) : Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 66,
                decoration: AppDecoration.whiteWithShadow
                    .copyWith(borderRadius: BorderRadius.circular(0)),
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 12, bottom: 8),
                    child: /* widget.status == "Open" ?*/
                    AppButton(
                      title: AppStrings.done.toUpperCase(),
                      textFontSize: 16,
                      onTap: () async {
                        await _submitOnTap(context, true);
                      },
                    )
                  /*  : Row(
                      children: [
                        Expanded(
                            child: AppOutlineButton(
                                onTap: () => _cancelShift(
                                    context, provider, data),
                                title: AppStrings.cancel,
                                color: AppColors.hintGrey)),
                        10.width,
                        Expanded(
                            child: AppOutlineButton(
                                title: AppStrings.edit,
                                color: AppColors.hintGrey)),
                        10.width,
                        Expanded(
                            child: AppShadeButton(
                                onTap: () => provider.shiftPublish(data.id.toString()),
                                text: "Publish",
                                startColor: AppColors.primaryAccent,
                                endColor: AppColors.colorPrimary))
                      ],
                    ),*/
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _submitOnTap(BuildContext context, bool preview) async {
    if (clockInDateTime.isNull && preview) {
      AppHelper.showImageToast(
          message: AppValidator.messageBuilder("clock in time")!);
    } else if (clockOutDateTime.isNull && preview) {
      AppHelper.showImageToast(
          message: AppValidator.messageBuilder("clock out time")!);
    } else if(widget.isEdit){
      PreviewModel? model = await Provider.of<ShiftsProvider>(context, listen: false).updateApproveTime(
          model: AddTimePreviewRequestModel(
            breakTimes: BreakList(list: breakList),
            manualUpdateResponse: "",
            clockOutTime: clockOutDateTime,
            clockInTime: clockInDateTime,
            providerUserId: modelMain?.providerObj?.id.toString(),
            shiftId: modelMain?.shiftObj?.id.toString(),
            bidRate: modelMain!.shiftObj?.nurseRate ?? "0",
          ), id: widget.model.clockObj!.id.toString());
    }
    else {
      PreviewModel? model = await Provider.of<ShiftsProvider>(context, listen: false).addTimePreview(
          model: AddTimePreviewRequestModel(
            manualUpdateResponse: "add-timesheet-manually",
            breakTimes: BreakList(list: breakList),
            clockOutTime: clockOutDateTime,
            clockInTime: clockInDateTime,
            providerUserId: modelMain?.providerObj?.id.toString(),
            shiftId: modelMain?.shiftObj?.id.toString(),
            bidRate: modelMain!.shiftObj?.nurseRate ?? "0",
          ), preview: preview);
      if (model.isNotNull && preview) {
        if (modelMain?.clockObj == null) modelMain!.clockObj = ClockObj();
        modelMain?.clockObj?.finalTime = model?.finalTime;
        list.forEach((element) {
        modelMain?.clockObj?.breakObjs.add(BreakObj(breakStarttime: element.breakStartTime,breakStoptime: element.breakStopTime,));
        });
        context.push(ApproveTimesDetailsScreen(
          model: modelMain!, title: AppStrings.preview,));
        setState(() {

        });
      }
    }
  }


  Future<DateTime?> _showDateTimePicker() async {
    return await AppHelper.showDatePicker(
        context: context,
        mode: CupertinoDatePickerMode.dateAndTime,
        minimumDate: getCalendar(),
        maximumDate: clockOutCal()
    );
  }

  DateTime? getCalendar() {
    final x = Duration(hours: 8);
    final ff = x.inMilliseconds;
    final clockIn = DateFormat("yyyy-MM-dd HH:mm:ss")
        .parse(
        "${modelMain!.shiftObj!.startDate} ${modelMain!.shiftObj!.startTime}")
        .millisecondsSinceEpoch - ff;
    if (clockIn == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(clockIn);
  }

  DateTime? clockOutCal() {
    final x = Duration(hours: 8);
    final ff = x.inMilliseconds;
    final clockOut = DateFormat("yyyy-MM-dd HH:mm:ss")
        .parse(
        "${modelMain!.shiftObj!.endDate} ${modelMain!.shiftObj!.endTime}")
        .millisecondsSinceEpoch + ff;
    if (clockOut == null) return null;
    final calOut = DateTime.fromMillisecondsSinceEpoch(
        int.parse(clockOut.toString()));
    if (DateTime.now().isAfter(calOut)) {
      return calOut;
    }
    return DateTime.now();
  }

}
