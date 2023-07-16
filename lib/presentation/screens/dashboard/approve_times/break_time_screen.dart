import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jyotishee/presentation/widgets/app_consumer/status_screens/error_screen.dart';
import '../../../../app/utils/utils.dart';
import '../../../../data/models/models.dart';
import '../../../widgets/widgets.dart';

class BreakTimeScreen extends StatefulWidget {
  const BreakTimeScreen({super.key, required this.model, required this.list});

  final CallOffModel model;
  final List<BreakTimeModel> list;

  @override
  State<BreakTimeScreen> createState() => _BreakTimeScreenState();
}

class _BreakTimeScreenState extends State<BreakTimeScreen> {
  List<TextEditingController> startControllers = [];
  List<TextEditingController> endControllers = [];
  List<BreakTimeModel> list = [];
  TextEditingController start = TextEditingController();
  TextEditingController end = TextEditingController();
  late CallOffModel model;

  @override
  void dispose() {
    super.dispose();
    startControllers.forEach((element) {
      element.dispose();
    });
    endControllers.forEach((element) {
      element.dispose();
    });
  }
  @override
  void initState() {
    super.initState();
    model = widget.model;
    list=widget.list;
    /*widget.model.clockObj?.breakObjs.forEach((element) {
      list.add(BreakTimeModel(
          id: element.id.toString(),
          breakStartTime: element.breakStarttime,
          breakStopTime: element.breakStoptime,
          totalBreakTime: element.totalTime,
          action: element.action));

    });*/

    widget.list.forEach((element) {
      startControllers.add(TextEditingController()..text=element.breakStartTime);
      endControllers.add(TextEditingController()..text=element.breakStopTime);
    });
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        context.pop(list);
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        appBar: CustomAppBar(
            title: AppStrings.brTime,
            trailingIcon: InkWell(
              onTap: () {
                if (list.isEmpty) {
                  list.add(BreakTimeModel(
                      id: "",
                      breakStartTime: "",
                      breakStopTime: "",
                      totalBreakTime: "",
                      action: "create"));
                  startControllers.add(TextEditingController());
                  endControllers.add(TextEditingController());
                  setState(() {});
                } else if (list[list.length - 1].breakStartTime == "") {
                  AppHelper.showImageToast(
                      message: "Please select break start time");
                } else if (list[list.length - 1].breakStopTime == "") {
                  AppHelper.showImageToast(
                      message: "Please select break end time");
                } else {
                  list.add(BreakTimeModel(
                      id: "",
                      breakStartTime: "",
                      breakStopTime: "",
                      totalBreakTime: "",
                      action: "create"));
                  startControllers.add(TextEditingController());
                  endControllers.add(TextEditingController());
                  setState(() {});
                }
              },
              child: Center(
                child: Text(
                  AppStrings.add,
                  style: AppStyle.black22.copyWith(color: AppColors.colorPrimary),
                ),
              ),
            )),
        body: SizedBox(
          height: context.screenHeight,
          child: list.isNotEmpty && startControllers.isNotEmpty && endControllers.isNotEmpty
              ? Stack(
            alignment: Alignment.bottomCenter,
                  children: [
                    ListView.builder(
                      itemBuilder: (context, index) => Container(
                        color: AppColors.white,
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 4),
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  HeaderTextField(
                                    controller: startControllers[index],
                                    hint: "",
                                    header: AppStrings.brStartTime,
                                    showAsterisk: true,
                                    showArrow: true,
                                    enable: false,
                                    onTap: () async {
                                      DateTime? date =
                                          await _showDateTimePicker();
                                      if (date.isNotNull)
                                        setDateTimeInModel(
                                            list[index], date!, index);
                                    },
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 10,
                                    top: 10,
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: SvgImage(
                                        image: AppSvg.delete,
                                        height: 20,
                                        width: 20,
                                        onTap: () {
                                          list.removeAt(index);
                                          startControllers.removeAt(index);
                                          endControllers.removeAt(index);
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AppDivider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 4),
                              child: HeaderTextField(
                                controller: endControllers[index],
                                hint: "",
                                header: AppStrings.brEndTime,
                                showAsterisk: true,
                                showArrow: true,
                                enable: false,
                                onTap: () async {
                                  DateTime? date = await _showDateTimePicker();
                                  if (date.isNotNull) {
                                    if (list[index].breakStartTime.isEmpty) {
                                      list[index].breakStopTime =
                                          DateTimeHelper.dateWithTime(date);
                                      endControllers[index].text =
                                          DateTimeHelper.dateWithTime(date);
                                      setState(() {});
                                    } else if (date!.millisecondsSinceEpoch <
                                        DateTimeHelper
                                                .stringToDateTimeMMDDYYYHHMMA(
                                                    list[index].breakStartTime)
                                            .millisecondsSinceEpoch) {
                                      AppHelper.showImageToast(
                                          message: "Invalid break");
                                    } else {
                                      list[index].breakStopTime =
                                          DateTimeHelper.dateWithTime(date);
                                      endControllers[index].text =
                                          DateTimeHelper.dateWithTime(date);
                                      setState(() {});
                                    }
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      itemCount: list.length,
                    ),
                    Container(
                      height: 66,
                      decoration: AppDecoration.whiteWithShadow
                          .copyWith(borderRadius: BorderRadius.circular(0)),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 12, bottom: 8),
                          child: AppButton(
                            title: AppStrings.done.toUpperCase(),
                            textFontSize: 16,
                            onTap: () {
                              if(list.isEmpty){
                                context.pop();
                              }
                              else if (list[list.length - 1].breakStartTime == "") {
                                AppHelper.showImageToast(
                                    message: "Please select break start time");
                              } else if (list[list.length - 1].breakStopTime ==
                                  "") {
                                AppHelper.showImageToast(
                                    message: "Please select break end time");
                              } else {
                                context.pop(list.isNotEmpty ? list : null);
                              }
                            },
                          )),
                    )
                  ],
                )
              : ErrorScreen(error: AppStrings.noDataAvailable),
        ),
      ),
    );
  }

  Future<DateTime?> _showDateTimePicker() async {
    print(DateTimeHelper.stringToDateTime(model.clockObj!.clockinTime));
    print(DateTimeHelper.stringToDateTime(model.clockObj!.clockoutTime));
    return await AppHelper.showDatePicker(
      context: context,
      mode: CupertinoDatePickerMode.dateAndTime,
      minimumDate: model.clockObj?.clockinTime != null
          ? DateTimeHelper.stringToDateTime(model.clockObj!.clockinTime)
          : null,
      maximumDate: model.clockObj?.clockoutTime != null
          ? DateTimeHelper.stringToDateTime(model.clockObj!.clockoutTime)
          : null,
    );
  }

  DateTime? getCalendar() {
    final x = Duration(hours: 8);
    final ff = x.inMilliseconds;
    final clockIn = DateFormat("yyyy-MM-dd HH:mm:ss")
            .parse("${model.shiftObj!.startDate} ${model.shiftObj!.startTime}")
            .millisecondsSinceEpoch -
        ff;
    if (clockIn == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(clockIn);
  }

  DateTime? clockOutCal() {
    final x = Duration(hours: 8);
    final ff = x.inMilliseconds;
    final clockOut = DateFormat("yyyy-MM-dd HH:mm:ss")
            .parse("${model.shiftObj!.endDate} ${model.shiftObj!.endTime}")
            .millisecondsSinceEpoch +
        ff;
    if (clockOut == null) return null;
    final calOut =
        DateTime.fromMillisecondsSinceEpoch(int.parse(clockOut.toString()));
    if (DateTime.now().isAfter(calOut)) {
      return calOut;
    }
    return DateTime.now();
  }

  void setDateTimeInModel(BreakTimeModel model, DateTime date, int index) {
    if (list.isNotEmpty) {
      if (list.length > 1 &&
          date.millisecondsSinceEpoch >
              DateTimeHelper.stringToDateTimeMMDDYYYHHMMA(list[list.length - 2].breakStopTime)
                  .millisecondsSinceEpoch &&
          model.breakStopTime.isEmpty) {
        model.breakStartTime = DateTimeHelper.dateWithTime(date);
        startControllers[index].text = DateTimeHelper.dateWithTime(date);
        setState(() {});
      } else if (list.length == 1 && model.breakStopTime.isEmpty) {
        model.breakStartTime = DateTimeHelper.dateWithTime(date);
        startControllers[index].text = DateTimeHelper.dateWithTime(date);
        setState(() {});
        print("hey");
      } else if (model.breakStopTime.isNotEmpty &&
          DateTimeHelper.stringToDateTimeMMDDYYYHHMMA(model.breakStopTime)
                  .millisecondsSinceEpoch >
              date.millisecondsSinceEpoch) {
        print("hey");
        model.breakStartTime = DateTimeHelper.dateWithTime(date);
        startControllers[index].text = DateTimeHelper.dateWithTime(date);
        setState(() {});
      } else {
        AppHelper.showImageToast(message: "Invalid break");
      }
    } else if (DateTime.parse(model.breakStartTime).millisecondsSinceEpoch <
        DateTime.parse(model.breakStopTime).millisecondsSinceEpoch) {
      AppHelper.showImageToast(message: "Invalid break");
    } else {
      AppHelper.showImageToast(message: "Invalid break");
    }
  }
}
