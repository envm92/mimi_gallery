import 'package:firebase_storage/firebase_storage.dart';
import 'package:mimi_gallery/models/image.dart';
import 'package:mimi_gallery/providers/storage_provider.dart';

class ImagesRepository {
  final storageProvider = StorageProvider();
  List<ImageModel> images = [];

  Future<List<Reference>> getReferenceImages() {
    return storageProvider.listAllImages()
        .then((ListResult listResult) => listResult.items.reversed.toList());
  }


  Future<List<ImageModel>> _getUrls(List<Reference> imagesToDisplayReference, int size, {int from = 0}) async {
    List<ImageModel> imagesToDisplay = [];
    for (var i = from; i < (from + size); i++) {
      var image = ImageModel();
      image.name = imagesToDisplayReference[i].name;
      image.url = await imagesToDisplayReference[i].getDownloadURL();
      imagesToDisplay.add(image);
    }
    return imagesToDisplay;
  }

  Future<List<ImageModel>> getImages(List<Reference> imagesToDisplayReference,int count, {int from = 0}) {
    return _getUrls(imagesToDisplayReference, count, from: from);
  }
}