part of 'image_cubit.dart';

abstract class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

class ImageInitial extends ImageState {}

class ImagePickSuccess extends ImageState {
  final XFile pickedImage;

  const ImagePickSuccess(this.pickedImage);
}

class ImageFail extends ImageState {}
