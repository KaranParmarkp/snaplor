import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jyotishee/presentation/widgets/custom_app_bar.dart';
import 'package:jyotishee/presentation/widgets/svg_image.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../app/utils/utils.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool chatSwitch = false;
  bool callSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashboardAppBar(
        title: '',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ImportantNotice(),

              //total earnings
              Container(
                margin: EdgeInsets.only(top: 30),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.totalEarnings,
                                    style: AppStyle.black14
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  4.height,
                                  Row(
                                    children: [
                                      Text(
                                        '\u{20B9} ',
                                        style: TextStyle(
                                          color: Color(0xFF7E1E80),
                                          fontSize: 25,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        '500',
                                        style: AppStyle.purple14.copyWith(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                            color: AppColors.colorPrimary,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Container(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
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
                                                '15',
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
                                            color: Color(0xFFFFECEC),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Container(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
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
                                                '08',
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
                    Stack(
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
                    )
                  ],
                ),
              ),

              // call and chat switches
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(15),
                decoration: AppDecoration.whiteShadowRounded,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 5, bottom: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Type',
                            style: AppStyle.black14,
                          ),
                          const SizedBox(width: 185),
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
                                style: AppStyle.black12,
                              ),
                              Row(
                                children: [
                                  Text(
                                    AppStrings.rate,
                                    style: AppStyle.grey12,
                                  ),
                                  Text(
                                    ' \u{20B9} ',
                                    style: TextStyle(
                                      color: AppColors.colorPrimary,
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "8/Min",
                                    style: AppStyle.purple12,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        CupertinoSwitch(
                          value: callSwitch,
                          onChanged: (value) {
                            callSwitch = !callSwitch;
                            setState(() {});
                          },
                          activeColor: AppColors.colorPrimary,
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
                                style: AppStyle.black12,
                              ),
                              Row(
                                children: [
                                  Text(
                                    AppStrings.rate,
                                    style: AppStyle.grey12,
                                  ),
                                  Text(
                                    ' \u{20B9} ',
                                    style: TextStyle(
                                      color: AppColors.colorPrimary,
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "8/Min",
                                    style: AppStyle.grey12.copyWith(
                                        color: AppColors.colorPrimary),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        CupertinoSwitch(
                          value: chatSwitch,
                          onChanged: (value) {
                            chatSwitch = !chatSwitch;
                            setState(() {});
                          },
                          activeColor: AppColors.colorPrimary,
                        )
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Expanded(child: SquareBoxAvatar(image: AppSvg.user, text: AppStrings.jsProfile)),
                    Expanded(child: SquareBoxAvatar(image: AppSvg.invoice, text: AppStrings.orders)),
                    Expanded(child: SquareBoxAvatar(image: AppSvg.discount, text: AppStrings.offers)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Expanded(child: SquareBoxAvatar(image: AppSvg.bill, text: AppStrings.waitList)),
                    Expanded(child: SquareBoxAvatar(image: AppSvg.invoice, text: AppStrings.reviews)),
                    Expanded(child: SquareBoxAvatar(image: AppSvg.callHelp, text: AppStrings.supports)),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
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
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.importantPolices,
            style: AppStyle.purple14.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          10.height,
          Text(
            AppStrings.neverBeRude,
            style: AppStyle.purple12.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            AppStrings.neverShare,
            style: AppStyle.purple12.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          10.height,
          Text(
            AppStrings.showMore,
            style: AppStyle.purple12.copyWith(
              color: AppColors.lightGreen,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
