import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/data/providers/providers.dart';

import '../../../data/models/notification_data_model.dart';
import '../../../data/models/wallet_model.dart';
import '../../../data/providers/auth_provider.dart';
import '../../widgets/widgets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.notification,
        showProfile: false,
      ),
      body: Container(
        height: context.screenHeight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: AppConsumer<AuthProvider, List<NotificationDataModel>>(
          taskName: AuthProvider.notificationListKey,
          load: (provider) => provider.notificationList(),
          successBuilder: (data, provider) => ListView.builder(
            padding: EdgeInsets.only(top: 20),
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => NotificationCard(model : data[index]),
          ),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key,required this.model});
  final NotificationDataModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 20),
      decoration: AppDecoration.whiteShadowRounded.copyWith(
        color: model.seen ? null : AppColors.black.withOpacity(0.1)
      ),
      child: InkWell(
        onTap: () {
          if(model.seen.isFalse){
            context.read<AuthProvider>().notificationRead(id: model.id,onSuccess: () {
              model.seen=true;
            },);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.colorPrimary,
              child: CircleNetworkImageAvatar(
                  radius: 20,
                  image:model.actorId.image),
            ),
            10.width,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          model.createdAt.toLocal().formatElapsedTimeString(),
                          style: AppStyle.grayDark12.copyWith(fontSize: 10),
                        ),
                      ),
                      Icon(
                        Icons.close,
                        size: 20,
                        color: AppColors.greyDark,
                      ),
                    ],
                  ),
                  //Text(model.actorId.name.toStringOrEmpty.toTitleCase(), style: AppStyle.black14),
                  Text(model.title.toStringOrEmpty, style: AppStyle.black12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
