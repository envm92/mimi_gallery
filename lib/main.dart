import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi_gallery/blocs/images/images_bloc.dart';
import 'package:mimi_gallery/blocs/images/images_repository.dart';
import 'firebase_options.dart';
import 'package:mimi_gallery/routes.dart';
import 'package:mimi_gallery/theme.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final imagesRepository = ImagesRepository();
  runApp(BlocProvider(
      create: (BuildContext context) =>
          ImagesBloc(imagesRepository: imagesRepository),
    child: const MimiGallery(),
  ));
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
