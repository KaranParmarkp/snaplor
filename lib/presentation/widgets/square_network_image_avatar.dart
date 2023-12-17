import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SquareNetworkImageAvatar extends StatelessWidget {
  const SquareNetworkImageAvatar({
    Key? key,
     this.image, this.size,this.radius, this.height, this.width
  }) : super(key: key);

  final String? image;
  final double? size;
  final double? height;
  final double? width;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image ?? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
      imageBuilder: (context, imageProvider) => Container(
        width:size??width ?? 60,
        height: size??height??60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 4),
          image: DecorationImage(
              image: imageProvider, fit: BoxFit.cover
          ),
        ),
      ),
      placeholder: (context, url) => SizedBox(
        height: size ??height?? 60,
        width: size ??width?? 60,
        child:
        SkeletonAvatar(style: SkeletonAvatarStyle()),
      ),
      errorWidget: (context, url, error) => Container(
          height: size ?? 60,
          width: size ?? 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 4),
          ),
          child: Icon(Icons.error)),
    );
  }
}