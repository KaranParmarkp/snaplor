import 'package:flutter/material.dart';
import 'package:jyotishee/data/models/models.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/widgets/paginated_view.dart';

import '../../../app/utils/utils.dart';
import '../../widgets/widgets.dart';
import 'add_post_screen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key, this.showBack=false});
  final bool showBack;

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  bool showViewMore = true;
  int skip=0;
  ScrollController _scrollController = ScrollController();
  bool isShowMoreApiLoading = false;
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: AppStrings.snaplorCommunity, showProfile: true,showBack: widget.showBack,communityScreen: true,showNotification: true,),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: AppColors.colorPrimary, onPressed: () {
          AppHelper.showBottomSheet(context: context, isScrollControlled: true,padding: EdgeInsets.zero,
              innerPadding: EdgeInsets.zero,
              child: AddPostScreen(fromMyPost: false,));
      },
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: 150,
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SquareNetworkImageAvatar(
                          radius: 12,
                          height: 80,
                          width: 150,
                          image: "https://images.unsplash.com/photo-1567324216289-97cc4134f626?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
                        ),
                        Positioned(
                          top: 6,
                          right: 10,
                          child: Container(
                            width: 60,
                            decoration: AppDecoration.purpleLightRounded.copyWith(
                                color: AppColors.lightGreen,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgImage(image: AppSvg.star,color: AppColors.white,size: 15,),
                                4.width,
                                Text("4.5",style: AppStyle.white12w500,)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    10.height,
                    Container(
                        decoration: AppDecoration.skyBlueRounded.copyWith(color: AppColors.hintGrey3),
                        padding: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                        child: Text(AppStrings.astrologer,style: AppStyle.black8w400,)),
                    5.height,
                    NameVerified(name: "Karan",verified: true),
                    5.height,
                    /*Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: AppDecoration.purpleLightRounded.copyWith(
                              color: AppColors.lightGreen,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgImage(image: AppSvg.call,color: AppColors.white,size: 15,),
                                4.width,
                                Text(AppStrings.call,style: AppStyle.white12w500,)
                              ],
                            ),
                          ),
                        ),
                        4.width,
                        Expanded(
                          child: Container(
                            decoration: AppDecoration.purpleLightRounded.copyWith(
                                color: AppColors.lightGreen,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgImage(image: AppSvg.chat,color: AppColors.white,size: 15,),
                                4.width,
                                Text(AppStrings.chat,style: AppStyle.white12w500,)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),*/
                  ],
                ),
              ),),
            ),
            AppDivider(gray: true),
            Expanded(
              child: AppConsumer<SocialProvider, List<SocialPostModel>>(
                taskName: SocialProvider.getPostKey,
                load: (provider) {
                  skip=0;
                  showViewMore = true;
                  provider.getPost(skip: skip,showMainLoader: true,resetData: true);
                  if(mounted)setState(() {

                  });
                },
                successBuilder: (data, provider) => ListView.separated(
                  controller: _scrollController..addListener(() {
                    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && showViewMore && !isShowMoreApiLoading) {
                      setState(() {
                        isShowMoreApiLoading=true;
                        skip = skip+10;
                        provider.getPost(
                          showMainLoader: false,
                          skip: skip,onSuccess: (data) {
                            if(data.isEmpty){
                            showViewMore=false;
                            }else{
                            showViewMore=true;
                          }
                            isShowMoreApiLoading=false;
                        },);
                      });
                    }
                  }),
                  itemCount: data.length,
                  separatorBuilder: (context, index) => AppDivider(color: AppColors.hintGrey3),
                  itemBuilder: (context, index) => PaginatedView(
                      index: index,
                      length: data.length,
                      showViewMore: showViewMore,
                      child: PostCard(model: data[index])),

                  //shrinkWrap: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

