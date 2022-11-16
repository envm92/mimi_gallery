import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi_gallery/blocs/images/images_event.dart';
import 'package:mimi_gallery/blocs/images/images_repository.dart';
import 'package:mimi_gallery/blocs/images/images_state.dart';
import 'package:mimi_gallery/models/image.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  ImagesRepository imagesRepository;

  ImagesBloc({required this.imagesRepository}) : super(ImagesInitial()) {
    on<ListRequested>((event, emit) async {
      emit(LoadReferenceProgress());
      try{
        List<Reference>  imagesReferences = await imagesRepository.getReferenceImages();
        emit(LoadReferencesSuccess(imagesReferences));
      } catch(error){
        emit(LoadFailure());
      }
    });
    on<LoadBunchRequested>((event, emit) async {
      emit(LoadUrlProgress());
      try{
        List<ImageModel>  imagesReferences = await imagesRepository.getImages(event.listReference, event.size, from: event.from);
        emit(LoadUrlsSuccess(imagesReferences));
      } catch(error){
        emit(LoadFailure());
      }
    });
  }
}