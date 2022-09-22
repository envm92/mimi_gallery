import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mimi_gallery/blocs/images/images_bloc.dart';
import 'package:mimi_gallery/blocs/images/images_event.dart';
import 'package:mimi_gallery/blocs/images/images_state.dart';
import 'package:mimi_gallery/models/image.dart';
import 'package:mimi_gallery/widgets/images_carousel.dart';

class ImagesGridView extends StatelessWidget {
  final ImagesBloc imagesBloc;

  const ImagesGridView({Key? key, required this.imagesBloc}) : super(key: key);

  GridView _buildGridView(List<ImageModel> images) {
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
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
          childCount: images.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: imagesBloc,
      builder: (BuildContext context, ImagesState state) {
        if (state is ImagesInitial) {
          imagesBloc.add(ListRequested());
        }
        if (state is LoadSuccess) {
          return _buildGridView(state.images);
        }
        if (state is LoadFailure) {
          return const ListTile(title: Text('Error'));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
