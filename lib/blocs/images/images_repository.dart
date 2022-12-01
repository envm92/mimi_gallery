import 'package:firebase_storage/firebase_storage.dart';
import 'package:mimi_gallery/models/image.dart';
import 'package:mimi_gallery/providers/storage_provider.dart';

class ImagesRepository {
  final storageProvider = StorageProvider();
  String _pageToken = '';

  Future<List<Reference>> getReferenceImages() {
    return storageProvider.listAllImages()
        .then((ListResult listResult) => listResult.items.reversed.toList());
  }


  Future<List<ImageModel>> _getUrls(List<Reference> imagesToDisplayReference, int size, {int from = 0}) async {
    List<ImageModel> imagesToDisplay = [];
    for (var i = from; i < (from + size); i++) {
      var url = await imagesToDisplayReference[i].getDownloadURL();
      var image = ImageModel(name: imagesToDisplayReference[i].name, url: url);
      imagesToDisplay.add(image);
    }
    return imagesToDisplay;
  }

  Future<List<ImageModel>> getImages(List<Reference> imagesToDisplayReference,int count, {int from = 0}) {
    return _getUrls(imagesToDisplayReference, count, from: from);
  }

  Future<List<ImageModel>> fetchImages(limit) async {
    List<ImageModel> imagesToDisplay = [];
    var listResult = await storageProvider.list(limit, _pageToken);
    var referenceImages = listResult.items;
    _pageToken = listResult.nextPageToken ?? '';
    for (var i = 0; i < referenceImages.length; i++) {
      var url = await referenceImages[i].getDownloadURL();
      var image = ImageModel(name: referenceImages[i].name, url: url);
      imagesToDisplay.add(image);
    }
    return imagesToDisplay;
  }
}