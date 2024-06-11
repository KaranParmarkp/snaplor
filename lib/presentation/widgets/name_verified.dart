import 'package:flutter/material.dart';
import 'package:jyotishee/data/providers/auth_provider.dart';
import 'package:jyotishee/data/providers/providers.dart';
import 'package:jyotishee/presentation/screens/community/community_profile_screen.dart';
import 'package:jyotishee/presentation/widgets/svg_image.dart';

import '../../app/utils/utils.dart';

class NameVerified extends StatelessWidget {
  const NameVerified({super.key, this.name, this.verified = false, this.showAst=false,this.center=false, this.id});

  final String? name;
  final bool? verified;
  final bool showAst;
  final bool center;
  final String? id;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: center ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            if(id.isNotNull && id.toStringOrEmpty.toLowerCase()==context.read<AuthProvider>().userModel!.userName?.toLowerCase()){
              context.push(CommunityProfileScreen());
            }
            else if(id.isNotNull)context.push(CommunityUserProfileScreen(id: id!,));
          },
          child: Text(
            name.toStringOrEmpty,
            style: AppStyle.black16w500,
          ),
        ),
        5.width,
        if (verified!) SvgImage(image: AppSvg.verified),
        if (showAst) Container(
            decoration: AppDecoration.skyBlueRounded.copyWith(
              color: AppColors.hintGrey3
            ),
            margin: EdgeInsets.only(left: 6),
            padding: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
            child: Text(AppStrings.astrologer,style: AppStyle.black8w400.copyWith(fontSize: 10),))
      ],
    );
  }
}
