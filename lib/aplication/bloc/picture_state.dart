part of 'picture_bloc.dart';

abstract class PictureState {}

class PictureInitial extends PictureState {}

class PicturesLoaded extends PictureState {
  final List<PictureModel> pictureList;

  PicturesLoaded({required this.pictureList});
}

class PictureLoading extends PictureState {}

class PictureError extends PictureState {}
