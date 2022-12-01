import 'package:cached_network_image/cached_network_image.dart';
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

  const ImagesGridView({Key? key}) : super(key: key);

  @override
  State<ImagesGridView> createState() => _ImagesGridViewState();
}

class _ImagesGridViewState extends State<ImagesGridView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }
  @override
  Widget build(BuildContext context) {
    /*var imagesBloc = BlocProvider.of<ImagesBloc>(context);
    return BlocBuilder(
        bloc: imagesBloc,
        builder: (BuildContext context, ImagesState state) {
          if(state is LoadReferencesSuccess) {
            imagesBloc.add(LoadBunchRequested(listReference: widget.imagesReferences,size: 16, from:0));
          }
          if (state is LoadUrlProgress && images.length == 0) {
            return Center( child: CircularProgressIndicator(),);
          }
          if(state is LoadUrlsSuccess) {
            images.addAll(state.images);
          }
          return _buildGrid();
        });*/
    return BlocBuilder<ImagesBloc, ImagesState>(
        builder: (context, state) {
          switch (state.status) {
            case ImagesStatus.failure:
              return const Center(child: Text('failed to fetch posts'));
            case ImagesStatus.success:
              if (state.images.isEmpty) {
                return const Center(child: Text('no posts'));
              }
              return _buildGrid(
                  state.images,
                  state.hasReachedMax ?
                  state.images.length :
                  state.images.length + 1
              );
            case ImagesStatus.initial:
              return const Center(child: CircularProgressIndicator());

          }
        });
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<ImagesBloc>().add(ImagesFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  _buildItem(List<ImageModel>images, int index) {
    return GestureDetector(
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
    );
  }

  _buildBottomLoader() {
    return SizedBox(
      width: 200.0,
      height: 100.0,
      child: Shimmer.fromColors(
        baseColor: Colors.black38,
        highlightColor: Colors.black26,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black38,
              shape: BoxShape.rectangle
          ),
        )
      )
    );
  }

  _buildGrid(List<ImageModel>images, int count) {
    return GridView.custom(
      controller: _scrollController,
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
              (context, index) => (index >= images.length) ?
              _buildBottomLoader() : _buildItem(images, index),
          childCount: count
      ),
    );
  }

}
