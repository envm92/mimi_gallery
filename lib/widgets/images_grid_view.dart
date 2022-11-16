import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mimi_gallery/blocs/images/images_event.dart';
import 'package:mimi_gallery/blocs/images/images_state.dart';
import 'package:mimi_gallery/models/image.dart';
import 'package:mimi_gallery/widgets/images_carousel.dart';
import 'package:shimmer/shimmer.dart';

import '../blocs/images/images_bloc.dart';

class ImagesGridView extends StatefulWidget {

  final List<Reference> imagesReferences;
  const ImagesGridView({Key? key, required this.imagesReferences}) : super(key: key);

  @override
  State<ImagesGridView> createState() => _ImagesGridViewState();
}

class _ImagesGridViewState extends State<ImagesGridView> {
  List<ImageModel> images = [];
  late ScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(handleScrolling);
  }
  void handleScrolling() {
    if (controller.offset >= controller.position.maxScrollExtent) {
      var imagesBloc = BlocProvider.of<ImagesBloc>(context);
      imagesBloc.add(LoadBunchRequested(listReference: widget.imagesReferences,size: 20, from: images.length));
    }
  }
  _buildGrid() {
    var imagesBloc = BlocProvider.of<ImagesBloc>(context);
    var count = images.length;
    if(imagesBloc.state is LoadUrlProgress) {
      count = count + 1;
    }
    return GridView.custom(
      controller: controller,
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
              (context, index) => (imagesBloc.state is LoadUrlProgress && index == count-1 ) ? Center(child: Shimmer.fromColors(
                baseColor: Colors.black38,
                highlightColor: Colors.black26,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black38,
                      shape: BoxShape.rectangle
                  ),
                ),
              )) : GestureDetector(
            onTap: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => Dialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: ImagesCarousel(images: images, imageSelected: index),
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
                baseColor: Colors.black38,
                highlightColor: Colors.black26,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black38,
                      shape: BoxShape.rectangle
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          childCount: count
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var imagesBloc = BlocProvider.of<ImagesBloc>(context);
    return BlocBuilder(
        bloc: imagesBloc,
        builder: (BuildContext context, ImagesState state) {
          if(state is LoadReferencesSuccess) {
            imagesBloc.add(LoadBunchRequested(listReference: widget.imagesReferences,size: 20, from:0));
          }
          if (state is LoadUrlProgress && images.length == 0) {
            return Center( child: CircularProgressIndicator(),);
          }
          if(state is LoadUrlsSuccess) {
            images.addAll(state.images);
          }
          return _buildGrid();
        });
  }
}
