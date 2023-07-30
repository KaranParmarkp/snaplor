import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/screens/chat/chat_screen.dart';
import 'package:jyotishee/presentation/widgets/widgets.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.reviews,
        showNotification: true,
        showProfile: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        clipBehavior: Clip.none,
        child: ListView.builder(
          clipBehavior: Clip.none,
          itemBuilder: (context, index) => WaitlistCard(index: index),
          itemCount: 10,
          shrinkWrap: true,
        ),
      ),
    );
  }
}

class WaitlistCard extends StatelessWidget {
  const WaitlistCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 20),
      decoration: AppDecoration.whiteShadowRounded,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order Id: #1654358757",
                  style: AppStyle.grey12
                      .copyWith(color: AppColors.greyDark, fontSize: 10),
                ),
                Text(
                  "8 May 2023, 04:15 Pm",
                  style: AppStyle.grey12
                      .copyWith(color: AppColors.greyDark, fontSize: 10),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserDP(radius: 22),
              20.width,
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Suhel Ahmed", style: AppStyle.black14),
                        RatingBar.builder(
                          initialRating: 3,
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
                        )
                      ],
                    ),
                    Spacer(),
                    SvgImage(image: AppSvg.deleteRed)
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10,top: 10),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard...",
              style: AppStyle.black12,
            ),
          ),
          if(index!=1)Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: AppRoundedButton(text: AppStrings.viewChat,color: AppColors.colorPrimary,onTap: () => context.push(ChatScreen()),),
                ),
                20.width,
                Expanded(
                  child: AppRoundedButton(text: AppStrings.reply,color: AppColors.colorPrimary,),
                ),
              ],
            ),
          ),
          if(index==1)Container(
            padding: EdgeInsets.all(15),
            decoration: AppDecoration.whiteShadowRounded.copyWith(
              color: AppColors.hintGrey3,boxShadow: []
            ),
            child: Column(
              children: [
                HeaderTextField(hint: "Enter your message here..",maxLines: 5,),
                AppButton(title: AppStrings.reply,)
              ],
            ),
          ),

        ],
      ),
    );
  }
}
