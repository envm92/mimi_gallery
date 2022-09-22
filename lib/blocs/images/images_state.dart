import 'package:equatable/equatable.dart';
import 'package:mimi_gallery/models/image.dart';

abstract class ImagesState extends Equatable {
  const ImagesState();
}
class ImagesInitial extends ImagesState {
  @override
  List<Object> get props => [];
}
class LoadProgress extends ImagesState {
  @override
  List<Object> get props => [];
}
class LoadSuccess extends ImagesState {
  final List<ImageModel> images;

  const LoadSuccess(this.images);

  @override
  List<Object> get props => [images];
}
class LoadFailure extends ImagesState {
  @override
  List<Object> get props => [];
}