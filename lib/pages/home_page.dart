import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi_gallery/blocs/images/images_bloc.dart';
import 'package:mimi_gallery/widgets/images_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ImagesGridView(imagesBloc: BlocProvider.of<ImagesBloc>(context))
    );
  }
}