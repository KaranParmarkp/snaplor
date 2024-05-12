import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jyotishee/data/models/message_model.dart';
import 'package:jyotishee/data/models/waitlist_model.dart';

import '../../../app/utils/utils.dart';
import '../../../data/providers/providers.dart';
import '../../widgets/widgets.dart';
class ChatScreen extends StatefulWidget {
  ChatScreen({super.key,  this.model,this.readOnly=false});
  final WaitListModel? model;
  final bool readOnly;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageController = TextEditingController();
  final messageFocus = FocusNode();
  @override
  void initState() {
    super.initState();
    if(!widget.readOnly)Future.microtask(() => context.read<AuthProvider>().updateCurrentChatModel(widget.model));
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DismissKeyBoard(
      child: Scaffold(
        appBar: CustomAppBar(
          title: widget.model?.user?.name.toCapitalized() ?? "",
          trailingIcon: !widget.readOnly ?  Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10,left: 10),
                child: CircleNetworkImageAvatar(
                    radius: 20,
                    image: widget.model?.user?.image),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10,left: 10),
                child: AppRoundedButton(text: "End chat",color: AppColors.colorPrimary,onTap: () => context.read<AuthProvider>().endChat(id:widget.model!.id!),),
              ),
            ],
          ) : SizedBox(),

          //showProfile: true,
        ),
        backgroundColor: AppColors.white,
        body: Container(
          color: Colors.white,
          height: double.infinity,
          child: Column(
            children: [
              20.height,
              Expanded(
                child: AppConsumer<AuthProvider, List<MessageModel>>(
                  taskName: AuthProvider.getMessagesKey,
                  load: (provider) => provider.getMessages(id: widget.model!.id.toString()),
                  successBuilder: (data, provider) => ListView.builder(
                    //reverse: true,
                    itemBuilder: (context, index) => MessageText(
                        time: DateTimeHelper.convertTimeTo12HourFormat(data[index].createdAt!.toLocal().toString()),
                        text: data[index].message ?? "", messageType: data[index].senderId!=provider.userModel?.id ? MessageType.sender  : MessageType.receiver),
                    itemCount: data.length,

                  ),
                ),
              ),
              if(!widget.readOnly)Container(
                height: 80,
                decoration: AppDecoration.whiteShadow,
                padding: EdgeInsets.only(left: 15,right: 15,bottom: 15,top: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    10.width,
                    Expanded(
                      child: HeaderTextField(
                        hint: AppStrings.messageHere,
                        focusNode: messageFocus,
                        controller: messageController,
                        borderRadius: 30,bottomPadding: 0,
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgImage(image: AppSvg.attach,color: AppColors.hintGrey),
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
                        if(messageController.isEmpty()){
                          AppHelper.showToast(message: "Please enter message");
                        }else{
                          context.read<AuthProvider>().sendMessage(chatId: widget.model!.id!, recipientId: widget.model!.user!.id!, message: messageController.text);
                          messageController.clear();
                        }
                      },
                      child: CircleAvatar(radius: 20,
                          backgroundColor: AppColors.colorPrimary,child:SvgImage(image: AppSvg.send,)),
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

class MessageText extends StatelessWidget {
  const MessageText({super.key, required this.text, required this.messageType, required this.time});

  final String text;
  final MessageType messageType;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        margin: EdgeInsets.only(bottom: 10,right: messageType == MessageType.sender ? 80:0,left: messageType != MessageType.sender ? 80:0),
        decoration: AppDecoration.purpleLightRounded.copyWith(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(messageType == MessageType.sender ? 3 : 15),
              topRight: Radius.circular(messageType != MessageType.sender ? 3 : 15),
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
              text,
              style: messageType == MessageType.sender ? AppStyle.white14W400 : AppStyle.black14,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                time,
                style: messageType == MessageType.sender ? AppStyle.white10: AppStyle.black10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
