import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class ImagesEvent extends Equatable {
  const ImagesEvent();

  @override
  List<Object> get props => [];
}

class ListRequested extends ImagesEvent {}
class LoadBunchRequested extends ImagesEvent{
  final List<Reference> listReference;
  final int size;
  final int from;
  const LoadBunchRequested({required this.listReference, required this.size, required this.from});

  @override
  List<Object> get props => [listReference];
}