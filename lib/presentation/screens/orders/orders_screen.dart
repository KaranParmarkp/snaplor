import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/screens/chat/chat_screen.dart';
import 'package:jyotishee/presentation/widgets/widgets.dart';
import '../../../data/models/generic_user_model.dart';
import '../../../data/models/models.dart';
import '../../../data/providers/providers.dart';
import 'package:just_audio/just_audio.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
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
        title: AppStrings.orders,
    /*    showNotification: true,
        showProfile: true,
    */  ),
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
                    text: AppStrings.chatHistory,
                  ),
                  Tab(
                    text: AppStrings.callHistory,
                  ),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [
                AppConsumer<AuthProvider, List<OrderModel>>(
                  taskName: AuthProvider.orderListKey,
                  load: (provider) => provider.orderList(ComType.chat),
                  successBuilder: (data, provider) => ListView.builder(
                    itemBuilder: (context, index) =>
                        OrderCard(model: data[index], type: ComType.chat),
                    itemCount: data.length,
                    shrinkWrap: true,
                  ),
                ),
                AppConsumer<AuthProvider, List<OrderModel>>(
                  taskName: AuthProvider.orderListKey,
                  load: (provider) => provider.orderList(ComType.call),
                  successBuilder: (data, provider) => ListView.builder(
                    itemBuilder: (context, index) =>
                        OrderCard(model: data[index], type: ComType.call),
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

class OrderCard extends StatefulWidget {
  const OrderCard({super.key, required this.model, required this.type});

  final OrderModel model;
  final ComType type;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";
  bool isplaying = false;
  bool audioplayed = false;

  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    /*Future.delayed(Duration.zero, () async {
      player.onDurationChanged.listen((Duration d) {
        //get the duration of audio
        maxduration = d.inMilliseconds;
        setState(() {});
      });

      player.onPositionChanged.listen((Duration p) {
        currentpos =
            p.inMilliseconds; //get the current position of playing audio

        //generating the duration label
        int shours = Duration(milliseconds: currentpos).inHours;
        int sminutes = Duration(milliseconds: currentpos).inMinutes;
        int sseconds = Duration(milliseconds: currentpos).inSeconds;

        int rhours = shours;
        int rminutes = sminutes - (shours * 60);
        int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

        currentpostlabel = "$rhours:$rminutes:$rseconds";

        setState(() {
          //refresh the UI
        });
      });
    });
    player.onPlayerStateChanged.listen((state) {
      switch (state) {
        case PlayerState.playing:
          isplaying= true;
          if(mounted)setState(() {

          });
          break;

        case PlayerState.stopped:
          isplaying= false;
          if(mounted)setState(() {

          });
          break;
        case PlayerState.completed:
          isplaying= false;
          if(mounted)setState(() {

          });
          break;
        default:
          break;
      }

    });
    */
    super.initState();
    initSetup();
  }

  initSetup() async {
    setAudio(widget.model.voiceCallUrl??"http://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3");
    //setAudio("http://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3");
    //final duration = await player.setUrl("http://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3");
  }

  @override
  void dispose() {
    super.dispose();
    player.stop();
    player.dispose();
  }

  String currentTime = "", endTime = "";
  double minDuration = 0, maxDuration = 0, currentDuration = 0;
  bool isLoadAudio = false;
  bool isPlaying = false;
  bool isRepeating = false;

  void setAudio(String url) async {
    setState(() => isLoadAudio = true);
    await player.setUrl(url);
    currentDuration = minDuration;
    maxDuration = player.duration!.inMilliseconds.toDouble();
    setState(() {
      currentTime = getDuration(currentDuration);
      endTime = getDuration(maxDuration);
    });
    isPlaying = false;
    //changeStatusPlaying();
    player.positionStream.listen((duration) {
      currentDuration = duration.inMilliseconds.toDouble();
      setState(() => currentTime = getDuration(currentDuration));
    });
    setState(() => isLoadAudio = false);
    player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        setState(() {
          currentDuration = minDuration;
          if (isRepeating == true) {
            isPlaying = true;
          } else {
            isPlaying = false;
            isRepeating = false;
          }
        });
      }
    });
  }

  void changeStatusPlaying() {
    setState(() => isPlaying = !isPlaying);
    isPlaying ? player.play() : player.pause();
    currentDuration == maxDuration ? isPlaying : !isPlaying;
  }

  String getDuration(double value) {
    Duration duration = Duration(milliseconds: value.round());
    return [duration.inHours, duration.inMinutes, duration.inSeconds]
        .map((e) => e.remainder(60).toString().padLeft(2, "0"))
        .join(":");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 10, right: 4, left: 4, top: 8),
      width: double.infinity,
      decoration: AppDecoration.whiteShadowRounded,
      child: InkWell(
        onTap: () {
          if (widget.type == ComType.chat)
            context.push(ChatScreen(
              readOnly: true,
              model: WaitListModel(
                  id: widget.model.chatRequestId?.id,
                  user: widget.model.user),
            ));
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Order Id: #${widget.model.refCode}",
                      style: AppStyle.grey12
                          .copyWith(color: AppColors.greyDark, fontSize: 10),
                    ),
                  ),
                  Text(
                    "${DateTimeHelper.dateMonthWithTime(widget.model.createdAt?.toLocal())}",
                    style: AppStyle.grey12
                        .copyWith(color: AppColors.greyDark, fontSize: 10),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: NameValue(
                        name: AppStrings.name,
                        value: widget.model.intakeForm!.name.toCapitalized())),
                Text(
                  widget.model.status.isNotNull
                      ? widget.model.status!.toCapitalized()
                      : "",
                  style: AppStyle.lightGreen12,
                )
              ],
            ),
            NameValue(
                name: AppStrings.gender,
                value: widget.model.intakeForm?.gender.toCapitalized() ?? ""),
            NameValue(
              name: AppStrings.dob,
              value: "${DateTimeHelper.dateMonth(widget.model.intakeForm?.dateOfBirth?.toLocal())}, ${widget.model.intakeForm!.timeOfBirth}",
            ),
            NameValue(
                name: AppStrings.pob,
                value:
                    widget.model.intakeForm?.birthPlace.toCapitalized() ?? ""),
            NameValue(
                name: AppStrings.problemArea,
                value:
                    widget.model.intakeForm?.topicOfConcern.toCapitalized() ??
                        ""),
            NameValue(
                name: AppStrings.duration,
                value: "${widget.model.duration ?? ""} Minutes"),
            Row(
              children: [
                Expanded(
                    child: NameValue(
                        name: AppStrings.rateWithout,
                        value: AppStrings.rupee +
                            "${widget.model.pricePerMinute}/Min")),
                Text(
                  AppStrings.rs + "${widget.model.totalPaid}",
                  style: AppStyle.purple14w600,
                )
              ],
            ),
            if (widget.type == ComType.call)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: StreamBuilder(
                        stream: player.positionStream,
                        builder: (context, snapshot) {
                          return ProgressBar(
                            progress:
                                snapshot.data ?? const Duration(seconds: 0),
                            total:
                                player.duration ?? const Duration(seconds: 0),
                            thumbColor: AppColors.colorPrimary,
                            baseBarColor:
                                AppColors.colorPrimary.withOpacity(0.50),
                            bufferedBarColor:
                                AppColors.colorPrimary.withOpacity(0.70),
                            progressBarColor: AppColors.colorPrimary,
                            timeLabelTextStyle: AppStyle.purple14w600,
                            onSeek: (duration) {
                              player.seek(duration);
                              setState(() {});
                            },
                          );
                        }),
                  ),
                  10.width,
                  InkWell(
                      onTap: () async {
                        if (!player.playing) await player.play();
                        if (player.playing) await player.pause();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10,right: 0,left: 10),
                        child: Icon(
                            player.playing ? Icons.pause : Icons.play_arrow,color: AppColors.colorPrimary,),
                      )),
                ],
              ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (widget.model.reviewOrder != null)
                    RatingBar.builder(
                      initialRating:
                          widget.model.reviewOrder!.rating!.toDouble(),
                      minRating: 1,
                      itemSize: 15,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.zero,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: AppColors.lightGreen,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  if (widget.model.askedReview==true)
                    AppRoundedButton(
                      text: AppStrings.askForReview,
                      color: AppColors.colorPrimary,
                      onTap: () {
                        context.read<AuthProvider>().askReview(id: widget.model.id!,type: widget.type);
                      },
                    ),
                ],
              ),
            ),
            /*Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: AppRoundedButton(
                      text: AppStrings.refundAmount,
                      color: AppColors.red,
                      onTap: () {
                        var provider = context.read<AuthProvider>();
                        provider.refundAmount(id: widget.model.id.toString());
                        if (provider.getStatus(
                                taskName: AuthProvider.refundAmountKey) ==
                            Status.Success) {
                          provider.orderList(widget.type);
                        }
                      },
                    ),
                  ),
                  20.width,
                  Expanded(
                    child: AppRoundedButton(
                      text: AppStrings.openKundli,
                      color: AppColors.colorPrimary,
                    ),
                  ),
                ],
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
