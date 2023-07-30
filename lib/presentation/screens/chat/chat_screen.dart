import 'package:flutter/material.dart';
import 'package:jyotishee/presentation/widgets/custom_app_bar.dart';

import '../../../app/utils/utils.dart';
import '../../widgets/widgets.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final List<String> chats = [
    "Hey",
    "How are you?",
    "How are you?",
    "I'm fine, what about you?",
    "I'm good what you doin nowadays",
    "I'm good what you doin nowadays",
  ];

  @override
  Widget build(BuildContext context) {
    return DismissKeyBoard(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Suhel Ahmed",
          showProfile: true,
        ),
        backgroundColor: AppColors.white,
        body: Container(
          color: Colors.white,
          height: double.infinity,
          child: Column(
            children: [
              20.height,
              Expanded(
                child: ListView.builder(
                itemCount: chats.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => MessageText(
                      text: chats[index],
                      messageType: index % 2 == 0
                          ? MessageType.sender
                          : MessageType.receiver),
                ),
              ),
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
