import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewScreen extends StatelessWidget {
  final String? image;
  const ImageViewScreen({super.key,  this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
          children: [
            PhotoView(
              imageProvider: CachedNetworkImageProvider(image??""),
              loadingBuilder: (context, event) {
                if (event == null) return Container();
                return Center(
                  child: CircularProgressIndicator(
                    value: event.cumulativeBytesLoaded / event.expectedTotalBytes!,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Text('Failed to load image'),
                );
              },
            ),
            Positioned(
                top: 40,
                right: 20,
                child: InkWell(
                    onTap: () => context.pop(),
                    child: Icon(Icons.close,color: Colors.white,)))
          ],
        )
    );
  }
}
