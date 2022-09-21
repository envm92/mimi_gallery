import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MimiGallery());
}

class MimiGallery extends StatelessWidget {
  const MimiGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mimi Gallery',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Set setImagesToDisplay;
  List images = [
    '0064',
    '0066',
    '0086',
    '0112',
    '0145',
    '0156',
    '0157',
    '0615',
    '0636',
    '0665',
    '0678',
    '0695',
    '0744',
    '0761',
    '0777',
    '0811',
    '0820',
    '0839',
    '0843',
    '0849',
    '0852',
    '0880',
    '0919',
    '0927',
    '0941',
    '0943',
    '0973',
    '0978',
    '0998',
    '1036',
    '1087',
    '1090',
    '1092',
    '1102',
    '1104',
    '1117',
    '1184',
    '1187',
    '1200',
    '1207',
    '1211',
    '1235',
    '1248',
    '1259',
    '1277',
    '1289',
    '1297',
    '1316',
    '1368',
    '1381',
    '1408',
    '1424',
    '1437',
    '1449',
    '1463',
    '1465',
    '1506',
    '1523',
    '1542',
    '1562',
    '1566',
    '1576',
    '1629',
    '1641',
    '1688',
    '1774',
    '1782',
    '1814',
    '1820',
    '1825',
    '1826',
    '1979',
    '1984',
    '1985',
    '1992',
    '1998',
    '2005',
    '2006',
    '2015',
    '2017',
    '2019',
    '2023',
    '2061',
    '2064',
    '2079',
    '2167',
    '2173',
    '2181',
    '2230',
    '2251',
    '2281',
    '2290',
    '2294',
    '2298',
    '2317',
  ];
  List imagesToDisplay = [];

  _MyHomePageState() {
    setImagesToDisplay = Set();
    Random random = Random();
    while(setImagesToDisplay.length < 36) {
      setImagesToDisplay.add(images[random.nextInt(images.length)]);
    }
    imagesToDisplay = setImagesToDisplay.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.custom(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 2),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => GestureDetector(
            onLongPress: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                content: Image.asset('images/' +imagesToDisplay[index] +'.webp'),
              ),
            ),
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset('images/' +imagesToDisplay[index] +'.webp').image,
                        fit: BoxFit.cover))),
          ),
          childCount: 36),
    ));
  }
}
