import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';
import 'widgets.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key, this.playing=false});
  final bool playing;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 18,
        backgroundColor: AppColors.white,
        child: CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.purpleLight,
            child: !playing ? SvgImage(
              image: AppSvg.play,
              size: 25,
            ): Icon(Icons.pause,color: AppColors.colorPrimary,size: 25,)));
  }
}