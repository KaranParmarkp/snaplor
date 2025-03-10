import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/screens/chat/chat_support_screen.dart';
import 'package:jyotishee/presentation/screens/community/community_screen.dart';
import 'package:jyotishee/presentation/widgets/app_consumer/status_screens/loader.dart';
import 'package:jyotishee/presentation/widgets/check_net.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../app/utils/utils.dart';
import '../../widgets/widgets.dart';
import '../offers/offers_screen.dart';
import '../orders/orders_screen.dart';
import '../reviews/reviews_screen.dart';
import '../waitlist/waitlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = [];
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: DashboardAppBar(
        title: '',
        showProfile: false,
      ),
      body: SizedBox(
        height: double.infinity,
        child: AppConsumer<AuthProvider, UserModel>(
          taskName: AuthProvider.userDataKey,
          load: (provider) => provider.userData(),
          successBuilder: (data, provider) {
            chartData = [
              ChartData('Call', data.todayCallOrders?.toDouble() ?? 0,
                  AppColors.purpleLight1),
              ChartData('Chat', data.todayChatOrders?.toDouble() ?? 0,
                  AppColors.colorPrimary),
            ];
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    //Loader(),
                    ImportantNotice(),

                    //total earnings
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(15),
                      decoration: AppDecoration.whiteShadowRounded,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppStrings.totalEarnings,
                                          style: AppStyle.black14.copyWith(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        4.height,
                                        Row(
                                          children: [
                                            Rupee(fontSize: 25),
                                            Text("${data.todayTotalEarnings}",
                                                style: AppStyle.purple25Bold),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 20,
                                                height: 8,
                                                decoration: ShapeDecoration(
                                                  color: AppColors.purpleLight1,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Container(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Call:',
                                                      style: AppStyle.black12,
                                                    ),
                                                    const SizedBox(width: 2),
                                                    Text(
                                                      "${data.todayCallOrders}",
                                                      style: AppStyle.purple12,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Container(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 20,
                                                height: 8,
                                                decoration: ShapeDecoration(
                                                  color: AppColors.colorPrimary,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Container(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Chat:',
                                                      style: AppStyle.black12,
                                                    ),
                                                    const SizedBox(width: 2),
                                                    Text(
                                                      "${data.todayChatOrders}",
                                                      style: AppStyle.purple12,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          /*Stack(
                              alignment: Alignment.center,
                              children: [
                                CircularPercentIndicator(
                                  backgroundColor: AppColors.white,
                                  radius: 50,
                                  lineWidth: 8,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: AppColors.colorPrimary,
                                  percent: 0.80,
                                ),
                                CircularPercentIndicator(
                                  backgroundColor: AppColors.white,
                                  radius: 35,
                                  lineWidth: 8,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: AppColors.purpleLight1,
                                  percent: 0.70,
                                ),
                                Center(
                                    child: Text(
                                      "85%",
                                      style: AppStyle.black14
                                          .copyWith(fontWeight: FontWeight.bold),
                                    ))
                              ],
                            )*/
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: SfCircularChart(
                              series: [
                                DoughnutSeries<ChartData, String>(
                                  //strokeWidth: 10,
                                  dataSource: chartData,
                                  //innerRadius: "55",
                                  //radius: "25",
                                  pointColorMapper: (ChartData data, _) => data.color,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    // call and chat switches
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(15),
                      decoration: AppDecoration.whiteShadowRounded,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 5, bottom: 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Type',
                                  style: AppStyle.black14,
                                ),
                                Spacer(),
                                Text(
                                  'Status',
                                  style: AppStyle.black14,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              RoundAvatar(image: AppSvg.call),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppStrings.calls,
                                      style: AppStyle.black14,
                                    ),
                                    /*Row(
                                        children: [
                                          Text(
                                            AppStrings.rate,
                                            style: AppStyle.grey12,
                                          ),
                                          5.width,
                                          Rupee(fontSize: 16),
                                          Text(
                                            "${data.callPrice}/Min",
                                            style: AppStyle.purple12,
                                          ),
                                        ],
                                      ),*/
                                  ],
                                ),
                              ),
                              Spacer(),
                              /*RoundAvatar(image: AppSvg.edit,onTap: () {
                                  _showRateSheet(context: context,isCallRate: true,rate: data.callPrice.toString(),user: data);
                                },),
                                */
                              Text(
                                data.isAvailableForCall.isTrue
                                    ? "online"
                                    : "offline",
                                style: data.isAvailableForCall.isTrue
                                    ? AppStyle.lightGreen12
                                    : AppStyle.red12,
                              ),
                              10.width,
                              CupertinoSwitch(
                                value: data.isAvailableForCall ?? false,
                                onChanged: (value) {
                                  context.read<AuthProvider>().userData(
                                      refresh: true,
                                      updateModel: data.copyWith(
                                          isAvailableForCall: value));
                                },
                                activeColor: AppColors.lightGreen,
                                trackColor: AppColors.red,
                              )
                            ],
                          ),
                          20.height,
                          Row(
                            children: [
                              RoundAvatar(image: AppSvg.chat),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppStrings.chat,
                                      style: AppStyle.black14,
                                    ),
                                    /*Row(
                                        children: [
                                          Text(
                                            AppStrings.rate,
                                            style: AppStyle.grey12,
                                          ),
                                          5.width,
                                          Rupee(fontSize: 16),
                                          Text(
                                              "${data.chatPrice}/Min",
                                            style: AppStyle.purple12,
                                          ),
                                        ],
                                      ),*/
                                  ],
                                ),
                              ),
                              Spacer(),
                              /* RoundAvatar(image: AppSvg.edit,onTap: () {
                                  _showRateSheet(context: context,isCallRate: false,rate: data.chatPrice.toString(),user: data);
                                },),
                               */
                              Text(
                                data.isAvailableForChat.isTrue
                                    ? "online"
                                    : "offline",
                                style: data.isAvailableForChat.isTrue
                                    ? AppStyle.lightGreen12
                                    : AppStyle.red12,
                              ),
                              10.width,
                              CupertinoSwitch(
                                value: data.isAvailableForChat ?? false,
                                onChanged: (value) {
                                  context.read<AuthProvider>().userData(
                                      refresh: true,
                                      updateModel: data.copyWith(
                                          isAvailableForChat: value));
                                },
                                activeColor: AppColors.lightGreen,
                                trackColor: AppColors.red,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    //20.height,
                    //SquareBoxAvatar(image: AppSvg.user, text:"Jyotishee Social" /*AppStrings.jyotisheeSocial*/,onTap: () => context.push(JyotisheeSocial()),),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: SquareBoxAvatar(
                            image: AppSvg.community,
                            text: AppStrings.community,
                            onTap: () => context.push(CommunityScreen(
                              showBack: true,
                            )),
                          )),
                          Expanded(
                              child: SquareBoxAvatar(
                            image: AppSvg.invoice,
                            text: AppStrings.sessions,
                            onTap: () => context.push(OrdersScreen()),
                          )),
                          Expanded(
                              child: SquareBoxAvatar(
                            image: AppSvg.discount,
                            text: AppStrings.offers,
                            onTap: () => context.push(OffersScreen()),
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20,
                          bottom:
                              context.read<AuthProvider>().currentChat.isNotNull
                                  ? 140
                                  : 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: SquareBoxAvatar(
                            image: AppSvg.bill,
                            text: AppStrings.waitList,
                            onTap: () => context.push(WaitListScreen()),
                            badgeCount: context.read<AuthProvider>().userModel?.totalChatRequests ?? 0,
                          )),
                          Expanded(
                              child: SquareBoxAvatar(
                            image: AppSvg.invoice,
                            text: AppStrings.reviews,
                            onTap: () => context.push(ReviewsScreen()),
                          )),
                          Expanded(
                              child: SquareBoxAvatar(
                            image: AppSvg.callHelp,
                            text: AppStrings.supports,
                            onTap: () => AppHelper.showHelpDialog(context),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showRateSheet(
      {required BuildContext context,
      required bool isCallRate,
      required String rate,
      required UserModel user}) {
    TextEditingController controller = TextEditingController();
    controller.text = rate;
    AppHelper.showBottomSheet(
        context: context,
        isScrollControlled: true,
        child: Column(
          children: [
            HeaderTextField(
              hint: '',
              header: (isCallRate ? AppStrings.call : AppStrings.chat) +
                  " " +
                  AppStrings.rateWithout,
              controller: controller,
              keyboard: TextInputType.number,
            ),
            AppButton(
              title: AppStrings.saveChanges,
              onTap: () async {
                if (controller.isEmpty()) {
                  AppHelper.showToast(
                    message: AppValidator.messageBuilder("rate")!,
                  );
                } else {
                  bool? response = await context.read<AuthProvider>().userData(
                      refresh: true,
                      updateModel: user.copyWith(
                        callPrice: isCallRate
                            ? controller.text.toInt()
                            : user.callPrice,
                        chatPrice: !isCallRate
                            ? controller.text.toInt()
                            : user.chatPrice,
                      ));
                  if (response.isTrue) context.pop();
                }
              },
            )
          ],
        ));
  }
}

class ImportantNotice extends StatelessWidget {
  const ImportantNotice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.purpleLightRounded,
      width: context.screenWidth,
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.importantPolices,
            style: AppStyle.purple14w600,
          ),
          10.height,
          Text(AppStrings.neverBeRude, style: AppStyle.purple12w400),
          Text(AppStrings.neverShare, style: AppStyle.purple12w400),
          10.height,
          /*Text(
            AppStrings.showMore,
            style: AppStyle.purple12.copyWith(
              color: AppColors.lightGreen,
              fontWeight: FontWeight.w400,
            ),
          ),*/
        ],
      ),
    );
  }
}

///Chart sample data
class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}
