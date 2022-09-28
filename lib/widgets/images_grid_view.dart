import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mimi_gallery/models/image.dart';
import 'package:mimi_gallery/widgets/images_carousel.dart';
import 'package:shimmer/shimmer.dart';

class ImagesGridView extends StatelessWidget {
  final List<ImageModel> images;

  const ImagesGridView({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          const QuiltedGridTile(2, 2),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 2),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => GestureDetector(
            onTap: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => Dialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: ImagesCarousel(images:images, imageSelected: index),
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: images[index].url,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context,url) => Shimmer.fromColors(
                baseColor: const Color(0xFFEBEBF4),
                highlightColor: const Color(0xFFEBEBF4),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.pinkAccent,
                      shape: BoxShape.rectangle
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          childCount: images.length),
    );
  }
}
