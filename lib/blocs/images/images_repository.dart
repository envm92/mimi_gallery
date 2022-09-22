import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:mimi_gallery/models/image.dart';
import 'package:mimi_gallery/providers/storage_provider.dart';

class ImagesRepository {
  final storageProvider = StorageProvider();
  List<ImageModel> images = [];

  List<Reference> _sortImages(ListResult images, int count) {
    var setImagesToDisplay = Set();
    var items = images.items;
    Random random = Random();
    while (setImagesToDisplay.length < count) {
      setImagesToDisplay.add(items[random.nextInt(items.length)]);
    }
    List<Reference> result = [];
    for (var element in setImagesToDisplay) {
      result.add(element);
    }
    return result;
  }

  Future<List<ImageModel>> _getUrls(List<Reference> imagesToDisplayReference) async {
    List<ImageModel> imagesToDisplay = [];
    for (var element in imagesToDisplayReference) {
      var image = ImageModel();
      image.name = element.name;
      image.url = await element.getDownloadURL();
      imagesToDisplay.add(image);
    }
    return imagesToDisplay;
  }

  Future<List<ImageModel>> getImages(int count) {
    return storageProvider.listAllImages()
        .then((ListResult listResult) => _sortImages(listResult, count))
        .then((List<Reference> listReference) => _getUrls(listReference))
    ;
  }
}