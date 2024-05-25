import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/presentation/screens/chat/chat_screen.dart';
import 'package:jyotishee/presentation/widgets/widgets.dart';

import '../../../data/providers/providers.dart';

class WaitListScreen extends StatefulWidget {
  const WaitListScreen({super.key});

  @override
  State<WaitListScreen> createState() => _WaitListScreenState();
}

class _WaitListScreenState extends State<WaitListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.waitList,
        showNotification: true,
        showProfile: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 45,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: AppColors.hintGrey3,
                borderRadius: BorderRadius.circular(
                  30.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                  color: AppColors.white,
                ),
                padding: EdgeInsets.all(4),
                labelColor: AppColors.colorPrimary,
                unselectedLabelColor: Colors.black,
                labelStyle: AppStyle.purple14,
                unselectedLabelStyle: AppStyle.black14,
                tabs: [
                  Tab(
                    text: AppStrings.chat,
                  ),
                  Tab(
                    text: AppStrings.call,
                  ),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(
                  clipBehavior: Clip.none,
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    AppConsumer<AuthProvider, List<WaitListModel>>(
                      taskName: AuthProvider.waitListKey,
                        load: (provider) => provider.waitList(ComType.chat),
                      successBuilder: (data, provider) =>
                          ListView.builder(
                            clipBehavior: Clip.none,
                            itemBuilder: (context, index) =>
                                WaitListCard(
                                fromScreen: true,
                                    model: data[index], type: ComType.chat),
                            itemCount: data.length,
                            shrinkWrap: true,
                          ),
                    ),
                    AppConsumer<AuthProvider, List<WaitListModel>>(
                      taskName: AuthProvider.waitListKey,
                      load: (provider) => provider.waitList(ComType.call),
                      successBuilder: (data, provider) =>
                          ListView.builder(
                            clipBehavior: Clip.none,
                            itemBuilder: (context, index) =>
                                WaitListCard(
                                  fromScreen: true,
                                  model: data[index], type: ComType.call,),
                            itemCount: data.length,
                            shrinkWrap: true,
                          ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class WaitListCard extends StatefulWidget {
  const WaitListCard(
      {super.key, required this.model, required this.type, this.fromInitiated = false,this.fromScreen=false});

  final WaitListModel model;
  final ComType type;
  final bool fromInitiated;
  final bool fromScreen;
  @override
  State<WaitListCard> createState() => _WaitListCardState();
}

class _WaitListCardState extends State<WaitListCard> {
  Timer? _timer;
  int _timerValue = 60 * 5; // Initial timer value

  @override
  void initState() {
    super.initState();
    if (widget.model.fromInitiated.isTrue) _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timerValue--;
      });
      if (_timerValue == 0) {
        context.read<AuthProvider>().updateCurrentChatModel(null);
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 15),
      decoration: AppDecoration.whiteShadowRounded.copyWith(
        border: Border.all(
          color: widget.fromScreen.isFalse ? AppColors.colorPrimary : AppColors.transparent
        )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserDP(radius: 22, image: widget.model.user?.image),
              20.width,
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.model.createdAt!.formatElapsedTimeString(),
                            style: AppStyle.grey12
                                .copyWith(color: AppColors.greyDark),
                          ),
                          Text(widget.model.user?.name.toCapitalized() ?? widget
                              .model.intakeForm?.name.toCapitalized() ?? "",
                              style: AppStyle.black14),
                          Text(
                            widget.model.fromInitiated.isTrue
                                ? "Wait Time - 5 minutes"
                                : AppStrings.rupee + "${widget.model
                                .pricePerMinute}/Min",
                            style: AppStyle.grey12
                                .copyWith(color: AppColors.greyDark),
                          ),
                        ],
                      ),
                    ),
                    if(_timerValue>=0 && widget.model.isAcceptedByAstrologer.isFalse &&
                        widget.model.isAcceptedByMember.isFalse &&
                        widget.type == ComType.chat)Column(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      //crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<AuthProvider>().updateCurrentChatModel(
                                null);
                          },
                          child: Icon(Icons.close, size: 20,),),
                        5.height,
                        SizedBox(
                          height: 40, width: 40,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircularProgressIndicator(
                                color: AppColors.colorPrimary,
                                value: _timerValue / 60,
                                strokeWidth: 2,
                              ),
                              Center(child: Text(
                                '${(_timerValue ~/ 60).toString().padLeft(
                                    2, '0')}:${(_timerValue % 60)
                                    .toString()
                                    .padLeft(2, '0')}' ,style: AppStyle.
                                black12.copyWith(fontSize:10),))
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              if (widget.model.isAcceptedByAstrologer.isTrue &&
                  widget.model.isAcceptedByMember.isTrue &&
                  widget.type == ComType.chat)
                InkWell(
                    onTap: () async {
                      await context.push(ChatScreen(model: widget.model));
                      context.read<AuthProvider>().onGoingChat();
                    },
                    child: Text(
                      widget.type.name.toUpperCase(),
                      style: AppStyle.purple12
                          .copyWith(fontWeight: FontWeight.w700),
                    )),
              if (widget.model.isAcceptedByAstrologer.isTrue &&
                  widget.model.isAcceptedByMember.isFalse &&
                  widget.type == ComType.chat)
                Text(
                  "WAITING",
                  style: AppStyle.purple12.copyWith(
                      fontWeight: FontWeight.w700),
                )
            ],
          ),
          if (!widget.fromScreen &&widget.model.isAcceptedByAstrologer.isFalse && widget.model.isAcceptedByMember.isFalse) ...[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: AppRoundedButton(text: AppStrings.rejects,
                      color: AppColors.red,
                      onTap: () {
                        context
                            .read<AuthProvider>()
                            .cancelRequest(type: widget.type, id: widget.model
                            .id!);
                      },),
                  ),
                  20.width,
                  Expanded(
                    child: AppRoundedButton(text: AppStrings.accept,
                      color: AppColors.colorPrimary,
                      onTap: () async {
                        await context.read<AuthProvider>().acceptRequest(
                            type: widget.type, model: widget.model);
                        context.read<AuthProvider>().waitList(widget.type);
                      },),
                  ),
                ],
              ),
            ),
          ],

        ],
      ),
    );
  }
}
