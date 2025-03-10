import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/widgets/app_button.dart';
import 'package:jyotishee/presentation/widgets/widgets.dart';

import '../../../data/models/models.dart';
import '../../../data/providers/providers.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key, this.id});
  final String? id;
  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  void initState() {
    super.initState();
  }
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
        child: AppConsumer<AuthProvider, List<ReviewModel>>(
          taskName: AuthProvider.reviewListKey,
          load: (provider) => provider.reviewList(),
          successBuilder: (data, provider) {
            return ListView.builder(
              clipBehavior: Clip.none,
              itemBuilder: (context, index) => ReviewCard(model:widget.id.isNotNull ? data.where((element) => element.id==widget.id).first : data[index]),
              itemCount: widget.id.isNotNull ?1 :data.length,
              shrinkWrap: true,
            );
          },
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  ReviewCard({super.key, required this.model});

  final ReviewModel model;
  final TextEditingController controller = TextEditingController();

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
                Expanded(
                  child: Text(
                    "Order Id: #${model.orderId!.refCode.toStringOrEmpty}",
                    style: AppStyle.grey12
                        .copyWith(color: AppColors.greyDark, fontSize: 10),
                  ),
                ),
                Text(
                  "${DateTimeHelper.dateMonthWithTime(model.createdAt?.toLocal())}",
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
              UserDP(image: model.user!.image, radius: 22),
              20.width,
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(model.user!.name.isNotNull ? model.user!.name.toCapitalized() : "", style: AppStyle.black14,),
                        RatingBar.builder(
                          initialRating: model.rating.toString().toDouble(),
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
                    SvgImage(image: AppSvg.deleteRed,onTap: () => context.read<AuthProvider>().deleteReview(id: model.id!),)
                  ],
                ),
              ),
            ],
          ),
          if(model.message.isNotNull && model.message!.isNotEmpty)Container(
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 0, top: 10,left: 5),
            child: Text(
              model.message ?? "",
              style: AppStyle.black12,textAlign: TextAlign.start,
            ),
          ),
          if (model.astrologerResponse.isNotNull)
            Padding(
              padding:  EdgeInsets.only(top: model.message.isNotNull && model.message!.isNotEmpty ? 0 :10, bottom: 10,left: 5),
              child: Container(
                width: double.infinity,
                child: Text(
                  "Replied : " + (model.astrologerResponse?.message ?? ""),
                  style: AppStyle.black12,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          if (model.astrologerResponse.isNull && model.isFieldOpen==true)Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 10),
              decoration: AppDecoration.whiteShadowRounded
                  .copyWith(color: AppColors.hintGrey3, boxShadow: []),
              child: Column(
                children: [
                  HeaderTextField(
                    hint: "Enter your message here..",
                    controller: controller,
                    maxLines: 5,
                  ),
                  AppRoundedButton(
                    text: AppStrings.reply,
                    color: AppColors.colorPrimary,
                    onTap: () {
                      if(controller.isEmpty()){
                        AppHelper.showToast(message: "Please enter message");
                      }else{
                        context.read<AuthProvider>().addReview(id: model.id!,message: controller.text);
                      }
                    },
                  )
                ],
              ),
            ),
          if (model.astrologerResponse.isNull && model.isFieldOpen.isFalse)Padding(
            padding: const EdgeInsets.only(top: 10),
            child: AppRoundedButton(
              text: AppStrings.reply,
              color: AppColors.colorPrimary,
              onTap: () {
                model.isFieldOpen=true;
                context.read<AuthProvider>().updateReviewTextField();
              },
            ),
          ),
        ],
      ),
    );
  }
}
