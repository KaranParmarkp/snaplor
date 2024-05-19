import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:jyotishee/data/models/message_model.dart';
import 'package:jyotishee/data/models/waitlist_model.dart';

import '../../../app/utils/utils.dart';
import '../../../data/providers/providers.dart';
import '../../widgets/widgets.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key, this.model, this.readOnly = false});

  final WaitListModel? model;
  final bool readOnly;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageController = TextEditingController();
  final messageFocus = FocusNode();
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    if (!widget.readOnly)
      Future.microtask(() =>
          context.read<AuthProvider>().updateCurrentChatModel(widget.model));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DismissKeyBoard(
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return Scaffold(
            appBar: CustomAppBar(
              title: widget.model?.user?.name.toCapitalized() ?? "",
              subtitle: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: CircleNetworkImageAvatar(
                        radius: 20, image: widget.model?.user?.image),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.model?.user?.name.toCapitalized() ?? "",
                          style: AppStyle.black16.copyWith(
                              fontWeight: FontWeight.w700, fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (authProvider.currentChat.isNotNull)
                          Text(
                            "Chat in progress",
                            style: AppStyle.lightGreen12,
                          ),
                        if (!widget.readOnly &&
                            authProvider.currentChat.isNotNull &&
                            authProvider.currentChat!.isTyping.isTrue)
                          Text(
                            "Typing...",
                            style: AppStyle.grayDark10,
                          ),
                      ],
                    ),
                  ),
                  if (!widget.readOnly && authProvider.currentChat.isNotNull)
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: StreamBuilder<int>(
                        stream: Stream.periodic(Duration(seconds: 1), (i) => i),
                        builder: (context, snapshot) {
                          DateTime currentTime = DateTime.now();
                          Duration difference = currentTime.difference(authProvider.currentChat!.createdAt!);
                          int minutes = difference.inMinutes;
                          int seconds = difference.inSeconds.remainder(60);

                          String formattedTime = DateFormat('mm:ss').format(DateTime(0, 0, 0, 0, minutes, seconds));

                          return Text(
                            '$formattedTime',
                            style: AppStyle.purple12,
                          );
                        },
                      ),
                    ),

                ],
              ),

              //showProfile: true,
            ),
            backgroundColor: AppColors.white,
            body: Container(
              color: Colors.white,
              height: double.infinity,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: AppDecoration.purpleLightRounded
                          .copyWith(color: AppColors.colorPrimary),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      child: Text(
                        "Chat Id : #${widget.model?.id!}",
                        style: AppStyle.white10,
                      )),
                  Expanded(
                    child: AppConsumer<AuthProvider, List<MessageModel>>(
                      taskName: AuthProvider.getMessagesKey,
                      load: (provider) =>
                          provider.getMessages(id: widget.model!.id.toString()),
                      successBuilder: (data, provider) => ListView.builder(
                        //reverse: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        controller: widget.readOnly
                            ? controller
                            : authProvider.currentChat.isNotNull
                                ? authProvider.currentChat!.controller
                                : controller,
                        itemBuilder: (context, index) => MessageText(
                            model: data[index],
                            time: DateTimeHelper.convertTimeTo12HourFormat(
                                data[index].createdAt!.toLocal().toString()),
                            text: data[index].message ?? "",
                            messageType:
                                data[index].senderId != provider.userModel?.id
                                    ? MessageType.sender
                                    : MessageType.receiver),
                        itemCount: data.length,
                      ),
                    ),
                  ),
                  if (!widget.readOnly)
                    Container(
                      height: 80,
                      decoration: AppDecoration.whiteShadow,
                      padding: EdgeInsets.only(
                          left: 15, right: 15, bottom: 15, top: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          10.width,
                          Expanded(
                            child: HeaderTextField(
                              hint: AppStrings.messageHere,
                              focusNode: messageFocus,
                              controller: messageController,
                              borderRadius: 30,
                              bottomPadding: 0,
                              onChanged: (p0) {
                                context.read<AuthProvider>().typingMessage(
                                      recipientId: widget.model!.user!.id!,
                                    );
                              },
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgImage(
                                      image: AppSvg.attach,
                                      color: AppColors.hintGrey),
                                  10.width,
                                  SvgImage(image: AppSvg.camera),
                                  10.width,
                                ],
                              ),
                            ),
                          ),
                          10.width,
                          InkWell(
                            onTap: () {
                              if (messageController.isEmpty()) {
                                AppHelper.showToast(
                                    message: "Please enter message");
                              } else {
                                context.read<AuthProvider>().sendMessage(
                                    chatId: widget.model!.id!,
                                    recipientId: widget.model!.user!.id!,
                                    message: messageController.text);
                                messageController.clear();
                              }
                            },
                            child: CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColors.colorPrimary,
                                child: SvgImage(
                                  image: AppSvg.send,
                                )),
                          )
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
  }
}

class MessageText extends StatelessWidget {
  const MessageText(
      {super.key,
      required this.text,
      required this.messageType,
      required this.time,
      required this.model});

  final String text;
  final MessageType messageType;
  final String time;
  final MessageModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        margin: EdgeInsets.only(
            bottom: 10,
            right: messageType == MessageType.sender ? 80 : 0,
            left: messageType != MessageType.sender ? 80 : 0),
        decoration: AppDecoration.purpleLightRounded.copyWith(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topLeft:
                  Radius.circular(messageType == MessageType.sender ? 3 : 15),
              topRight:
                  Radius.circular(messageType != MessageType.sender ? 3 : 15),
            ),
            color: messageType == MessageType.sender
                ? AppColors.colorPrimary
                : AppColors.purpleLight1),
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              convertNewLine(text),
              style: messageType == MessageType.sender
                  ? AppStyle.white14W400
                  : AppStyle.black14,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    time,
                    style: messageType == MessageType.sender
                        ? AppStyle.white10
                        : AppStyle.black10,
                  ),
                  if (messageType == MessageType.receiver) ...[
                    2.width,
                    SvgImage(
                      image: AppSvg.seen,
                      color: model.isSeen.isTrue
                          ? AppColors.colorPrimary
                          : AppColors.hintGrey2,
                    )
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String convertNewLine(String content) {
    return content.replaceAll(r'\n', '\n');
  }
}
