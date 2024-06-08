import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:jyotishee/data/models/generic_user_model.dart';
import 'package:jyotishee/data/models/message_model.dart';
import 'package:jyotishee/data/models/waitlist_model.dart';
import 'package:jyotishee/presentation/widgets/image_view_screen.dart';
import 'package:url_launcher/url_launcher.dart';

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
  MessageModel? replyMessageModel;

  @override
  void initState() {
    super.initState();
    if (!widget.readOnly) {
      Future.microtask(() =>
          context.read<AuthProvider>().updateCurrentChatModel(widget.model));
      Timer.periodic(Duration(seconds: 5), (timer) {
        context.read<AuthProvider>().seenUserMessages();
      });
      /*Future.delayed(
        Duration(seconds: 2),
        () => context.read<AuthProvider>().seenUserMessages(),
      );*/
    }
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
              title: widget.model!.user!.name.toStringOrEmpty.toTitleCase(),
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
                          Duration difference = currentTime
                              .difference(authProvider.currentChat!.createdAt!);
                          int minutes = difference.inMinutes;
                          int seconds = difference.inSeconds.remainder(60);

                          String formattedTime = DateFormat('mm:ss')
                              .format(DateTime(0, 0, 0, 0, minutes, seconds));

                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  AppHelper.showCustomDialog(
                                    context: context,
                                    title: "Are you sure want to end chat?",
                                    subText: context
                                                .read<AuthProvider>()
                                                .currentChat !=
                                            null
                                        ? "Your current chat will end."
                                        : null,
                                    onNegativeTap: () {
                                      context.pop();
                                    },
                                    onPositiveTap: () {
                                      context.pop();
                                      authProvider.endChat(
                                          id: widget.model!.id!);
                                    },
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 6),
                                  margin: EdgeInsets.only(bottom: 5),
                                  decoration: AppDecoration.rounded12.copyWith(
                                      color: AppColors.red,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    "End",
                                    style: AppStyle.white12,
                                  ),
                                ),
                              ),
                              Text(
                                '$formattedTime',
                                style: AppStyle.purple12,
                              ),
                            ],
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
                  /*Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: AppDecoration.purpleLightRounded
                          .copyWith(color: AppColors.colorPrimary),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      child: Text(
                        "Chat Id : #${widget.model?.id!}",
                        style: AppStyle.white10,
                      )),*/
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
                            user: widget.model?.user,
                            onReplyAnimationEnd: () {
                              replyMessageModel = data[index];
                              setState(() {});
                            },
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
                      decoration: AppDecoration.whiteShadow,
                      child: Column(
                        children: [
                          if (replyMessageModel.isNotNull)
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 0, right: 15),
                              child: IntrinsicHeight(
                                child: Row(
                                  children: [
                                    VerticalDivider(
                                        color: AppColors.colorPrimary,
                                        thickness: 5,
                                        width: 4),
                                    10.width,
                                    Expanded(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        5.height,
                                        Text(
                                          replyMessageModel!.senderId !=
                                                  context
                                                      .read<AuthProvider>()
                                                      .userModel
                                                      ?.id
                                              ? widget.model!.user!.name
                                                  .toStringOrEmpty
                                                  .toTitleCase()
                                              : "You",
                                          style: AppStyle.purple14w600,
                                        ),
                                        Text(
                                          replyMessageModel!.attachments!.isNotEmpty
                                              ? replyMessageModel!.attachments!
                                                  .first
                                                  .url!
                                                  .split("/")
                                                  .last
                                                  .toTitleCase()
                                              : replyMessageModel!
                                                  .message.toStringOrEmpty,
                                          style: AppStyle.black12w400,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        5.height,
                                      ],
                                    )),
                                    5.width,
                                    InkWell(
                                        onTap: () {
                                          replyMessageModel = null;
                                          setState(() {});
                                        },
                                        child: Icon(Icons.close))
                                  ],
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15,
                                right: 15,
                                bottom: 25,
                                top: replyMessageModel.isNotNull ? 5 : 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                10.width,
                                Expanded(
                                  child: HeaderTextField(
                                    isDense: true,
                                    hint: AppStrings.messageHere,
                                    style: AppStyle.black12,
                                    focusNode: messageFocus,
                                    controller: messageController,
                                    borderRadius: 30,
                                    bottomPadding: 0,
                                    onChanged: (p0) {
                                      context
                                          .read<AuthProvider>()
                                          .typingMessage(
                                            recipientId:
                                                widget.model!.user!.id!,
                                          );
                                    },
                                    suffixIconConstraints:
                                        BoxConstraints(maxHeight: 40),
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgImage(
                                          onTap: () async {
                                            File? file =
                                                await AppHelper.pickFile();
                                            print(file);
                                            if (file.isNotNull) {
                                              context
                                                  .read<AuthProvider>()
                                                  .sendMessage(
                                                      chatId: widget.model!.id!,
                                                      recipientId: widget
                                                          .model!.user!.id!,
                                                      messageId:
                                                          replyMessageModel?.id,
                                                      file: file,
                                                      type: "application/pdf");
                                              messageController.clear();
                                              replyMessageModel = null;
                                              setState(() {});
                                            }
                                          },
                                          image: AppSvg.attach,
                                          color: AppColors.hintGrey,
                                          size: 18,
                                        ),
                                        10.width,
                                        SvgImage(
                                          image: AppSvg.camera,
                                          size: 18,
                                          onTap: () async {
                                            File? image =
                                                await showSelectImageSheet();
                                            print(image);
                                            if (image.isNotNull) {
                                              context
                                                  .read<AuthProvider>()
                                                  .sendMessage(
                                                      chatId: widget.model!.id!,
                                                      recipientId: widget
                                                          .model!.user!.id!,
                                                      messageId:
                                                          replyMessageModel?.id,
                                                      file: image,
                                                      type: "image");
                                              messageController.clear();
                                              replyMessageModel = null;
                                              setState(() {});
                                            }
                                          },
                                        ),
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
                                          message: messageController.text,
                                          messageId: replyMessageModel?.id);
                                      messageController.clear();
                                      replyMessageModel = null;
                                      setState(() {});
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: CircleAvatar(
                                        radius: 16,
                                        backgroundColor: AppColors.colorPrimary,
                                        child: SvgImage(
                                          image: AppSvg.send,
                                          size: 20,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
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

  showSelectImageSheet() async {
    File? file;
    return await AppHelper.showBottomSheet(
        context: context,
        isDismissible: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_rounded),
              title: const Text('Camera'),
              onTap: () async {
                file = await AppHelper.pickImage(fromCamera: true);
                Navigator.pop(context, file);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Gallery'),
              onTap: () async {
                file = await AppHelper.pickImage(fromCamera: false);
                Navigator.pop(context, file);
              },
            ),
          ],
        ));
  }
}

class MessageText extends StatefulWidget {
  const MessageText(
      {super.key,
      required this.text,
      required this.messageType,
      required this.time,
      required this.model,
      this.onReplyAnimationEnd,
      this.user});

  final String text;
  final MessageType messageType;
  final String time;
  final MessageModel model;
  final GenericUserModel? user;
  final Function()? onReplyAnimationEnd;

  @override
  State<MessageText> createState() => _MessageTextState();
}

class _MessageTextState extends State<MessageText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> animation;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animation = Tween(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.3, 0.0),
    ).animate(
      CurvedAnimation(
        curve: Curves.decelerate,
        parent: _controller,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.messageType == MessageType.sender
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 1) {
            _controller.forward().whenComplete(() {
              _controller.reverse();
              widget.onReplyAnimationEnd?.call();
            });
          }
        },
        child: SlideTransition(
          position: animation,
          child: Container(
            constraints: BoxConstraints(maxWidth: context.screenWidth * 0.90),
            margin: EdgeInsets.only(
                bottom: 10,
                left: widget.model.originalMessageId.isNotNull ? 0 : 0),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IntrinsicWidth(
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 10,
                  //    right: widget.messageType == MessageType.sender ? 80 : 0,
                  //    left: widget.messageType != MessageType.sender ? 80 : 0
                ),
                decoration: AppDecoration.purpleLightRounded.copyWith(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      topLeft: Radius.circular(
                          widget.messageType == MessageType.sender ? 3 : 15),
                      topRight: Radius.circular(
                          widget.messageType != MessageType.sender ? 3 : 15),
                    ),
                    color: widget.messageType == MessageType.sender
                        ? AppColors.colorPrimary
                        : AppColors.purpleLight1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: widget.messageType == MessageType.sender ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                  children: [
                    if (widget.model.originalMessageId.isNotNull)ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.only(left: 0, right: 15),
                          color: AppColors.black.withOpacity(0.10),
                          child: IntrinsicHeight(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                VerticalDivider(
                                    color:
                                        widget.messageType == MessageType.sender
                                            ? AppColors.primaryAccent
                                            : AppColors.colorPrimary,
                                    thickness: 5,
                                    width: 4),
                                10.width,
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    5.height,
                                    Text(
                                      widget.model.originalMessageId!
                                                  .senderId !=
                                              context
                                                  .read<AuthProvider>()
                                                  .userModel
                                                  ?.id
                                          ? widget.user!.name.toStringOrEmpty
                                              .toTitleCase()
                                          : "You",
                                      style: AppStyle.purple14w600.copyWith(
                                          color: widget.messageType ==
                                                  MessageType.sender
                                              ? Colors.white
                                              : AppColors.black),
                                    ),
                                    if(widget.model.originalMessageId!.attachments!.isNotEmpty)...[
                                      /// original message image
                                      if(widget.model.isImageOriginalId())Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 10),
                                      child: SquareNetworkImageAvatar(
                                        image: widget.model.originalMessageId!.attachments!.first.url,
                                        radius: 12,
                                        height: 60,
                                      ),
                                    ),
                                      if(widget.model.isFileOriginalId())Padding(
                                        padding: const EdgeInsets.only(bottom: 5),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(right: 10),
                                              child: CircleAvatar(
                                                child: Icon(
                                                  CupertinoIcons.arrow_down_doc,
                                                  color: AppColors.black,
                                                ),
                                                backgroundColor:
                                                AppColors.hintGrey3,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                widget.model.originalMessageId!.attachments!.first.url!.split("/").last,
                                                style: AppStyle.black12w400.copyWith(
                                                    color: widget.messageType ==
                                                        MessageType.sender
                                                        ? Colors.white
                                                        : AppColors.black),
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],

                                    /// original message text
                                    if(widget.model.originalMessageId!.message.isNotNull && widget.model.originalMessageId!.attachments!.isEmpty)Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        widget.model.originalMessageId!.message.toStringOrEmpty,
                                        style: AppStyle.black12w400.copyWith(
                                            color: widget.messageType ==
                                                    MessageType.sender
                                                ? Colors.white
                                                : AppColors.black),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.model.attachments.isNotNull &&
                              widget.model.attachments!.isNotEmpty &&
                              widget.model.attachments!.any(
                                  (element) => element.type!.contains("image")))
                            InkWell(
                              onTap: () => context.push(ImageViewScreen(
                                image: widget.model.attachments!
                                    .where((element) =>
                                        element.type!.contains("image"))
                                    .first
                                    .url,
                              )),
                              child: SquareNetworkImageAvatar(
                                height: 300,
                                width: 300,
                                image: widget.model.attachments!
                                    .where((element) =>
                                        element.type!.contains("image"))
                                    .first
                                    .url,
                              ),
                            ),
                          if(widget.model.originalMessageId.isNull)Wrap(
                            crossAxisAlignment: WrapCrossAlignment.end,
                            alignment: WrapAlignment.end,
                            children: [
                              if (widget.model.attachments.isNotNull &&
                                  widget.model.attachments!.isNotEmpty &&
                                  widget.model.attachments!.any((element) =>
                                      element.type!.contains("app")))
                                InkWell(
                                  onTap: () {
                                    AppHelper.launchWebUrl(
                                        widget.model.attachments!
                                            .where((element) =>
                                                element.type!.contains("app"))
                                            .first
                                            .url!,
                                        mode: LaunchMode.platformDefault);
                                  },
                                  child: Container(
                                    width: context.screenWidth * 0.8,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: CircleAvatar(
                                            child: Icon(
                                              CupertinoIcons.arrow_down_doc,
                                              color: AppColors.black,
                                            ),
                                            backgroundColor:
                                                AppColors.hintGrey3,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            widget.model.attachments!
                                                .where((element) => element
                                                    .type!
                                                    .contains("app"))
                                                .first
                                                .url!
                                                .split("/")
                                                .last
                                                .toTitleCase(),
                                            style: widget.messageType ==
                                                    MessageType.sender
                                                ? AppStyle.white14W400
                                                : AppStyle.black14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              Text(
                                convertNewLine(widget.text),
                                style: widget.messageType == MessageType.sender
                                    ? AppStyle.white14W400
                                    : AppStyle.black14,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      widget.time,
                                      style: widget.messageType ==
                                              MessageType.sender
                                          ? AppStyle.white10
                                          : AppStyle.black10,
                                    ),
                                    if (widget.messageType ==
                                        MessageType.receiver) ...[
                                      2.width,
                                      if (widget.model.isDelivered.isFalse)
                                        SvgImage(
                                          image: AppSvg.single,
                                          color: AppColors.hintGrey2,
                                          size: 15,
                                        ),
                                      if (widget.model.isDelivered.isTrue)
                                        SvgImage(
                                          image: AppSvg.seen,
                                          color: widget.model.isSeen.isTrue
                                              ? AppColors.colorPrimary
                                              : AppColors.hintGrey2,
                                        )
                                    ]
                                  ],
                                ),
                              ),
                            ],
                          ),
                            if(widget.model.originalMessageId.isNotNull)Row(children: [
                              Expanded(
                                child: Text(
                                  convertNewLine(widget.text),
                                  style: widget.messageType == MessageType.sender
                                      ? AppStyle.white14W400
                                      : AppStyle.black14,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      widget.time,
                                      style: widget.messageType ==
                                          MessageType.sender
                                          ? AppStyle.white10
                                          : AppStyle.black10,
                                    ),
                                    if (widget.messageType ==
                                        MessageType.receiver) ...[
                                      2.width,
                                      if (widget.model.isDelivered.isFalse)
                                        SvgImage(
                                          image: AppSvg.single,
                                          color: AppColors.hintGrey2,
                                          size: 15,
                                        ),
                                      if (widget.model.isDelivered.isTrue)
                                        SvgImage(
                                          image: AppSvg.seen,
                                          color: widget.model.isSeen.isTrue
                                              ? AppColors.colorPrimary
                                              : AppColors.hintGrey2,
                                        )
                                    ]
                                  ],
                                ),
                              ),
                            ],)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String convertNewLine(String content) {
    return content.replaceAll(r'\n', '\n');
  }
}
