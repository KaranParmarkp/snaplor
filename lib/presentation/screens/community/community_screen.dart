import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      body: AppConsumer<SocialProvider, List<SocialPostModel>>(
        taskName: SocialProvider.getPostKey,
        refresh: true,
        load: (provider) {
          skip=0;
          showViewMore = true;
          provider.getPost(skip: skip,showMainLoader: true,resetData: true);
          if(mounted)setState(() {

          });
        },
        successBuilder: (data, provider) => SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
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
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: AppConsumer<SocialProvider, List<UserModel>>(
                  taskName: SocialProvider.whoToFollowKey,
                  load: (provider) {
                    provider.whoToFollow();
                  },
                  successBuilder: (data1, provider) => ListView.builder(
                    itemCount: data1.length,
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
                                height: 90,
                                width: 150,
                                image: data1[index].profileImage,

                              ),
                              Positioned(
                                top: 6,
                                right: 10,
                                child: Container(
                                  width: 50,
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
                                      Text(data1[index].avgRating.toString(),style: AppStyle.white12w500,)
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
                          Row(
                            children: [
                              SvgImage(image: AppSvg.verified),
                              3.width,
                              Expanded(
                                child: Text(
                                  data1[index].name.toStringOrEmpty.toTitleCase(),
                                  style: AppStyle.black16w500,
                                  //maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),



                            ],
                          ),
                          10.height,
                          InkWell(
                            onTap: () {
                              provider.followUnFollow(id: data1[index].id);
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: AppDecoration.purpleLightRounded.copyWith(
                                  color: AppColors.lightGreen,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Center(child: Text("Follow",style: AppStyle.white12w500,)),
                            ),
                          ),
                        ],
                      ),
                    ),),
                ),
              ),
              AppDivider(gray: true),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),

                shrinkWrap: true,
                itemCount: data.length,
                separatorBuilder: (context, index) => AppDivider(color: AppColors.hintGrey3),
                itemBuilder: (context, index) => PaginatedView(
                    index: index,
                    length: data.length,
                    showViewMore: showViewMore,
                    child: PostCard(model: data[index])),

                //shrinkWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

