import 'package:flutter/material.dart';
import 'package:mimi_gallery/widgets/images_grid_view.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ImagesGridView(),
    );
  }
}