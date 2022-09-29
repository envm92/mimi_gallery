import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mimi_gallery/models/image.dart';
import 'package:shimmer/shimmer.dart';

class ImagesCarousel extends StatefulWidget {
  const ImagesCarousel(
      {Key? key, required this.images, required this.imageSelected})
      : super(key: key);

  final List<ImageModel> images;
  final int imageSelected;

  @override
  State<StatefulWidget> createState() => ImagesCarouselState();
}

class ImagesCarouselState extends State<ImagesCarousel> {
  int _currentSelected = 0;

  @override
  void initState() {
    super.initState();
    _currentSelected = widget.imageSelected;
  }

  _goBack() {
    setState(() {
      _currentSelected -= 1;
    });
  }

  _goForward() {
    setState(() {
      _currentSelected += 1;
    });
  }

  ElevatedButton _buildButton(IconData iconData, VoidCallback? onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
      ),
      child: Icon(iconData, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 1000,
          width: 1000,
          child: CachedNetworkImage(
            imageUrl: widget.images[_currentSelected].url,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.black38,
              highlightColor: Colors.black26,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black38,
                    shape: BoxShape.rectangle),
              ),
            ),
            fit: BoxFit.fill,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildButton(
                Icons.arrow_back, (_currentSelected > 0) ? _goBack : null),
            _buildButton(
                Icons.arrow_forward,
                (_currentSelected < widget.images.length - 1)
                    ? _goForward
                    : null),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded( // 20%
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildButton(
                      Icons.close,
                      () {
                        Navigator.pop(context);
                      })
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
