import 'package:flutter/material.dart';
import 'package:mimi_gallery/routes.dart';
import 'package:mimi_gallery/theme.dart';

void main() {
  runApp(const MimiGallery());
}

class MimiGallery extends StatelessWidget {
  const MimiGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mimi Gallery',
      theme: galleryTheme,
      routes: Routes.get(),
      home: Routes.getHome(),
    );
  }
}

