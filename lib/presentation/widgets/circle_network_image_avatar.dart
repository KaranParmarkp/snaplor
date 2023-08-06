import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:skeletons/skeletons.dart';

import '../../app/utils/constants/constants.dart';

class CircleNetworkImageAvatar extends StatelessWidget {
  final double? radius;
  final String? image;
  final Color? errorColor;

  const CircleNetworkImageAvatar({Key? key, this.radius, this.image, this.errorColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image.isNotNull ? image! : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
      placeholder: (context, url) => SizedBox(
        height: radius?? 36,
        width: radius ?? 36,
        child: SkeletonAvatar(style: SkeletonAvatarStyle(shape: BoxShape.circle)),
      ),
      errorWidget: (context, url, error) => CircleAvatar(
          radius: radius ?? 40,
          backgroundColor: errorColor ?? AppColors.colorPrimary.withOpacity(0.20),
          child: SizedBox()),
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: radius ?? 36,
        backgroundColor: AppColors.shimmerColor,
        backgroundImage: imageProvider,
      ),
    );
  }
}
