import 'package:equatable/equatable.dart';
import 'package:mimi_gallery/models/image.dart';

enum ImagesStatus { initial, success, failure }
class ImagesState extends Equatable {
  const ImagesState({
    this.status = ImagesStatus.initial,
    this.images = const <ImageModel>[],
    this.hasReachedMax = false
  });

  final ImagesStatus status;
  final List<ImageModel> images;
  final bool hasReachedMax;

  ImagesState copyWith({
    ImagesStatus? status,
    List<ImageModel>? images,
    bool? hasReachedMax
  }){
    return ImagesState(
      status:  status ?? this.status,
      images: images ?? this.images,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax
    );
  }

  @override
  String toString() {
    return '''ImagesState { status: $status, hasReachedMax: $hasReachedMax, posts: ${images.length} }''';
  }

  @override
  List<Object> get props => [status, images, hasReachedMax];
}