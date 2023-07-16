import 'package:flutter/material.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/screens/dashboard/approve_times/approve_times_screen.dart';
import 'package:jyotishee/presentation/screens/dashboard/call_offs/call_offs_screen.dart';
import 'package:jyotishee/presentation/screens/shift/shift_lists/shift_list_screen.dart';
import '../../../app/utils/utils.dart';
import '../../../data/models/models.dart';
import '../../widgets/widgets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    _apiCall();
  }
  _apiCall(){
    Future.microtask(() {
      Provider.of<ShiftsProvider>(context, listen: false)..getCredit()..getDashboard();
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          key: provider.scaffoldKey,
          appBar: DashboardAppBar(
            title: AppStrings.dashboard,
          ),
          body: AppConsumer<ShiftsProvider,DashBoardModel>(
            taskName: ShiftsProvider.dashboard,
            load: (provider) => _apiCall(),
            successBuilder: (provider,p) {
              return  SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //To do header
                      Container(
                        height: 220,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 130,
                              decoration: AppDecoration.splash,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  constraints: BoxConstraints(maxWidth: 500),
                                  width: context.screenWidth,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 28),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25, bottom: 15),
                                        child: Text(
                                          AppStrings.todo,
                                          style: AppStyle.white26Bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: ToDoCard(
                                            title: AppStrings.acceptBids,
                                            backgroundColor: AppColors.blueEff9ff,
                                                onTap: () => context.push(ShiftListScreen(shiftType: ShiftsTypes.acceptBidShiftType,title: "Accept Bids",)),
                                                //subtitle: "${provider.data[DashboardProvider.dashboard]}",
                                                subtitle: "${provider.processShiftCount}",
                                                textColor: AppColors.colorPrimary,
                                          )),
                                          10.width,
                                          Expanded(
                                              child: ToDoCard(
                                            title: AppStrings.approveTimes,
                                                onTap: () => context.push(ApproveTimesScreen()),
                                                backgroundColor: AppColors.orangeFff8ef,
                                                subtitle: "${provider.processBidsCount}",
                                                textColor: AppColors.orangeF7931e,
                                          )),
                                          10.width,
                                          Expanded(
                                              child: ToDoCard(
                                                onTap: () => context.push(CallOffsScreen()),
                                                title: AppStrings.callOff,
                                            backgroundColor: AppColors.redFfeeee,
                                                subtitle: "${provider.processCallOffCount}",
                                                textColor: AppColors.redFf4646,
                                          )),
                                        ],
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HomeCreditCard(),

                            //Today's shifts
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16, top: 24),
                              child: Text(
                                AppStrings.todayShifts,
                                style: AppStyle.blackBold26,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: ShiftCard(
                                        title: AppStrings.totalShifts,
                                        onTap: () => context.push(ShiftListScreen(shiftType: ShiftsTypes.totalTodayShiftType,)),
                                        subtitle: "${provider.todayTotalShiftCount}")),
                                10.width,
                                Expanded(
                                    child: ShiftCard(
                                        title: AppStrings.filledShifts,
                                        onTap: () => context.push(ShiftListScreen(shiftType: ShiftsTypes.unfilledTodayShiftType,)),
                                        subtitle: "${provider.todayFilledShiftCount}")),
                              ],
                            ),
                            20.height,
                            Row(
                              children: [
                                Expanded(
                                    child: ShiftCard(
                                        title: AppStrings.completedShifts,
                                        onTap: () => context.push(ShiftListScreen(shiftType: ShiftsTypes.completedTodayShiftType,)),
                                        subtitle: "${provider.todayCompletedShiftCount}")),
                                10.width,
                                Expanded(
                                    child: ShiftCard(
                                        title: AppStrings.openShifts,
                                        onTap: () => context.push(ShiftListScreen(shiftType: ShiftsTypes.missedTodayShiftType,)),
                                        subtitle: "${provider.todayOpenShiftCount}")),
                              ],
                            ),
                            35.height,

                            //Tomorrow's shifts
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                AppStrings.tommShifts,
                                style: AppStyle.blackBold26,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: ShiftCard(
                                  title: AppStrings.totalShifts,
                                      subtitle: "${provider.tomorrowTotalShiftCount}",
                                      onTap: () => context.push(ShiftListScreen(shiftType: ShiftsTypes.totalTomorrowShiftType)),
                                      backgroundColor: AppColors.white,
                                  subtitleColor: AppColors.colorPrimary,
                                  titleColor: AppColors.hintGrey,
                                )),
                                10.width,
                                Expanded(
                                    child: ShiftCard(
                                  title: AppStrings.filledShifts,
                                      subtitle: "${provider.tomorrowFilledShiftCount}",
                                      onTap: () => context.push(ShiftListScreen(shiftType: ShiftsTypes.unfilledTomorrowShiftType)),
                                      backgroundColor: AppColors.white,
                                  subtitleColor: AppColors.colorPrimary,
                                  titleColor: AppColors.hintGrey,
                                )),
                              ],
                            ),
                            20.height,
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),

        );
      },
    );
  }
}
