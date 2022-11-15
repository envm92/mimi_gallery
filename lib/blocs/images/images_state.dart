import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mimi_gallery/models/image.dart';

abstract class ImagesState extends Equatable {
  const ImagesState();
}
class ImagesInitial extends ImagesState {
  @override
  List<Object> get props => [];
}
class LoadReferenceProgress extends ImagesState {
  @override
  List<Object> get props => [];
}
class LoadReferencesSuccess extends ImagesState {
  final  List<Reference> imagesReferences;

  const LoadReferencesSuccess(this.imagesReferences);

  @override
  List<Object> get props => [imagesReferences];
}

class LoadUrlProgress extends ImagesState {
  @override
  List<Object> get props => [];
}
class LoadUrlsSuccess extends ImagesState {
  final  List<ImageModel> images;

  const LoadUrlsSuccess(this.images);

  @override
  List<Object> get props => [images];
}
class LoadFailure extends ImagesState {
  @override
  List<Object> get props => [];
}