import 'package:flutter/material.dart';
import 'package:mimi_gallery/pages/gallery_page.dart';
import 'package:mimi_gallery/pages/home_page.dart';

class Routes {
  static Map<String, WidgetBuilder> get()  {
    return <String, WidgetBuilder> {
      '/home' : (BuildContext context) => const HomePage(),
      '/gallery' : (BuildContext context) => const GalleryPage()
    };
  }

  static getHome() {
    return const HomePage();
  }
}