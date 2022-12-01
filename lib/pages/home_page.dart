import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<void> _launchGithub() async {
    Uri uri = Uri(scheme: 'https', host: 'github.com', path: 'envm92');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('📷 Mimi\'s Gallery'),
          actions: [
            IconButton(
                onPressed: _launchGithub,
                icon: const FaIcon(FontAwesomeIcons.github))
          ],
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CachedNetworkImage(
                  imageUrl:
                  'https://firebasestorage.googleapis.com/v0/b/mimi-gallery.appspot.com/o/profile%2FIMG_1522.jpg?alt=media&token=2e69b735-8f30-43c5-a27b-d9f27bbbdacd',
                  imageBuilder: (context, imageProvider) => Container(
                    height: 350,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => SizedBox(
                    width: 350,
                    height: 350,
                    child: Shimmer.fromColors(
                      baseColor: Colors.black38,
                      highlightColor: Colors.black26,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.black38,
                            shape: BoxShape.circle
                        ),
                      ),
                    ),
                  ),
                ),
                UnconstrainedBox(
                  child: LimitedBox(
                      maxWidth: 300,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Welcome to my gallery!\n',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 25),
                          children: const <TextSpan>[
                            TextSpan(
                                text: '\nHello world!',
                                style:
                                TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                ' I\'m Erika, software engineer and beginner photographer'),
                          ],
                        ),
                      )),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/gallery');
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Go to gallery',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),
                    ),
                  ),
                )
              ]),
        )
    );
  }
}
