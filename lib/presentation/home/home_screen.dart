import 'package:flutter/material.dart';
import 'package:jyotishee/presentation/widgets/custom_app_bar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../app/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                                        .copyWith(fontWeight: FontWeight.w500),
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
                                          fontWeight: FontWeight.w600,
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
                                            color: Color(0xFF7E1E80),
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
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(width: 2),
                                              Text(
                                                '15',
                                                style: TextStyle(
                                                  color: Color(0xFF7E1E80),
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                ),
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
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(width: 2),
                                              Text(
                                                '08',
                                                style: TextStyle(
                                                  color: Color(0xFF7E1E80),
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
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
                        Center(child: Text("85%",style: AppStyle.black14.copyWith(fontWeight: FontWeight.bold),))

                      ],
                    )
                  ],
                ),
              )
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
