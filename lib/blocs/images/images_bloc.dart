import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi_gallery/blocs/images/images_event.dart';
import 'package:mimi_gallery/blocs/images/images_repository.dart';
import 'package:mimi_gallery/blocs/images/images_state.dart';
import 'package:mimi_gallery/models/image.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  ImagesRepository imagesRepository;

  ImagesBloc({required this.imagesRepository}) : super(ImagesInitial()) {
    on<ListRequested>((event, emit) async {
      emit(LoadProgress());
      try{
        List<ImageModel> images = await imagesRepository.getImages(36);
        emit(LoadSuccess(images));
      } catch(error){
        emit(LoadFailure());
      }
    });
  }
}