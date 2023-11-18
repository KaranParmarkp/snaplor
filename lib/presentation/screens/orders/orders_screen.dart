import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/screens/chat/chat_screen.dart';
import 'package:jyotishee/presentation/widgets/widgets.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../data/models/models.dart';
import '../../../data/providers/providers.dart';

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
  String audioasset = "assets/audio/red-indian-music.mp3";
  bool isplaying = false;
  bool audioplayed = false;

  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
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
    super.initState();
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
                  id: widget.model.chatRequestId,
                  user: User(
                    name: widget.model.user?.name,
                    id: widget.model.user?.id,
                    image: widget.model.user?.image,
                  )),
            ));
        },
        child: Column(
          children: [
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
              value:
                  "${DateTimeHelper.dateMonthWithTime(widget.model.intakeForm?.dateOfBirth)}",
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
                  style: AppStyle.purple14w800,
                )
              ],
            ),
            if (widget.type == ComType.call)
              Row(
                children: [
                  Text(
                    currentpostlabel + " ",
                    style: AppStyle.purple14w600,
                  ),
                  Expanded(
                    child: Container(
                        child: Slider(
                      value: double.parse(currentpos.toString()),
                      min: 0,
                      max: double.parse(maxduration.toString()),
                      divisions: maxduration,
                      label: currentpostlabel,
                      activeColor: AppColors.colorPrimary,
                      thumbColor: AppColors.colorPrimary,
                      inactiveColor: AppColors.colorPrimary.withOpacity(0.50),
                      onChanged: (double value) async {
                        int seekval = value.round();
                        await player
                            .seek(Duration(milliseconds: seekval))
                            .then((value) {
                          currentpos = seekval;
                          /*if(value == 1){ //seek successful
                              currentpos = seekval;
                            }else{
                              print("Seek unsuccessful.");
                            }*/
                        });
                      },
                    )),
                  ),
                  IconButton(
                    icon: Icon(isplaying ? Icons.pause:Icons.play_arrow),
                    color: AppColors.colorPrimary,
                    onPressed: () async {
                      await player.play(UrlSource('http://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3'));
                      //if(!isplaying)await player.pause();
                    },
                  ),
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
                  if (widget.model.reviewOrder == null)
                    AppRoundedButton(
                      text: AppStrings.askForReview,
                      color: AppColors.colorPrimary,
                    ),
                ],
              ),
            ),
            Padding(
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
            )
          ],
        ),
      ),
    );
  }
}
