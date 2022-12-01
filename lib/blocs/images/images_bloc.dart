import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:mimi_gallery/blocs/images/images_event.dart';
import 'package:mimi_gallery/blocs/images/images_repository.dart';
import 'package:mimi_gallery/blocs/images/images_state.dart';

const _imagesLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> {
  ImagesRepository imagesRepository;

  ImagesBloc({required this.imagesRepository}) : super(const ImagesState()) {
    on<ImagesFetched>(
      _onImagesFetched,
      transformer: throttleDroppable(throttleDuration)
    );
  }

  Future<void> _onImagesFetched(
    ImagesFetched event,
    Emitter<ImagesState> emit
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == ImagesStatus.initial) {
        final images = await imagesRepository.fetchImages(_imagesLimit);
        return emit(
            state.copyWith(
                status: ImagesStatus.success,
                images: images,
                hasReachedMax: false //TODO: comprobar que ha llegado al limite
            )
        );
      }
      final images = await imagesRepository.fetchImages(_imagesLimit);
      images.isEmpty
        ? emit(state.copyWith(hasReachedMax: true))
        : emit(state.copyWith(
          status: ImagesStatus.success,
        images: List.of(state.images)..addAll(images),
        hasReachedMax: false
      ));
    } catch (_) {
      emit(state.copyWith(status: ImagesStatus.failure));
    }
  }
}