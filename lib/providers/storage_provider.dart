import 'package:firebase_storage/firebase_storage.dart';
class StorageProvider {
  final storage = FirebaseStorage.instance;

  Future<ListResult> _listAll(ref) {
    final storageRef = storage.ref(ref);
    return storageRef.listAll();
  }
  Future<ListResult> listAllImages() {
    return _listAll('images');
  }

  Future<ListResult> list(limit, [String pageToken = '']) {
    final storageRef = storage.ref('images');
    return storageRef.list(ListOptions(
      maxResults: limit,
      pageToken: pageToken,
    ));
  }
}