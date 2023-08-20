import 'package:flutter/material.dart';
import 'package:jyotishee/data/models/message_model.dart';
import 'package:jyotishee/data/models/waitlist_model.dart';
import '../../../app/utils/utils.dart';
import '../../../data/providers/providers.dart';
import '../../../data/sources/remote/network_services/api_service.dart';
import '../../widgets/widgets.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
class ChatScreen extends StatefulWidget {
  ChatScreen({super.key,  this.model});
  final WaitListModel? model;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> chats = [
    "Hey",
    "How are you?",
    "How are you?",
    "I'm fine, what about you?",
    "I'm good what you doin nowadays",
    "I'm good what you doin nowadays",
  ];
   IO.Socket? socket;
  Future<void> initSocket() async {
    print('Connecting to chat service');
    String? token = await ApiService.getToken();
    socket = IO.io("http://api.jyotishee.com:3000/",<String, dynamic>{
      "Authorization": "Bearer $token",
      "transports": ["websocket","polling"],
    });
    socket!.connect();
    setState(() {

    });
    socket!.onConnect((_) {
      print('connected to websocket');
    });
    socket!.onConnectError((m) {
      print('connected to websocket Error'+m);
    });

    socket!.on('chatStatus', (message) {
      print("ChatStatus");
      print(message);
      setState(() {
        //MessagesModel.messages.add(message);
      });
    });
    socket!.on('privateMessage', (message) {
      print("private message");
      print(message);
      setState(() {
        //MessagesModel.messages.add(message);
      });
    });
  }


  @override
  void initState() {
    initSocket();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    socket?.disconnect();
    //context.read<AuthProvider>().socket!.sink.close();
  }
  @override
  Widget build(BuildContext context) {
    return DismissKeyBoard(
      child: Scaffold(
        appBar: CustomAppBar(
          title: widget.model?.user?.name ?? "",
          //showProfile: true,
        ),
        backgroundColor: AppColors.white,
        body: Container(
          color: Colors.white,
          height: double.infinity,
          child: Column(
            children: [
              20.height,

              Text("${socket?.opts}"),
              Text("${socket?.acks}"),
              Text("${socket?.flags}"),
              Text("${socket?.connected}"),
              InkWell(
                  onTap: () => initSocket(),
                  child: Text("connect")),
              /*Expanded(
                child: AppConsumer<AuthProvider, List<MessageModel>>(
                  taskName: AuthProvider.getMessagesKey,
                  load: (provider) => provider.getMessages(id: widget.model!.id.toString()),
                  successBuilder: (data, provider) => ListView.builder(
                    //reverse: true,
                    itemBuilder: (context, index) => MessageText(text: data[index].message ?? "", messageType: data[index].senderId!=provider.userModel?.id ? MessageType.sender  : MessageType.receiver),
                    itemCount: data.length,
                    shrinkWrap: true,
                  ),
                ),
              ),*/
              Spacer(),
              Container(
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
                        //focusNode: commentFocus,
                        //controller: commentController,
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
                    CircleAvatar(radius: 20,
                        backgroundColor: AppColors.colorPrimary,child:SvgImage(image: AppSvg.send,))
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
  const MessageText({super.key, required this.text, required this.messageType});

  final String text;
  final MessageType messageType;

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
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Text(
          text,
          style: AppStyle.black12.copyWith(
              color: messageType == MessageType.sender
                  ? AppColors.white
                  : AppColors.black),
        ),
      ),
    );
  }
}
