import 'package:equatable/equatable.dart';

class ImageModel extends Equatable{
  const ImageModel({required this.name,required this.url});
  final String name;
  final String url;

  @override
  List<Object> get props => [name, url];
}
