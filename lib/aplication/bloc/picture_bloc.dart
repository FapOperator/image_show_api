import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_show_api/domain/repository/picture_repository.dart';
import 'package:image_show_api/model/picture_model.dart';

part 'picture_event.dart';
part 'picture_state.dart';

class PictureBloc extends Bloc<PictureEvent, PictureState> {
  final PictureRepository _pictureRepository;
  PictureBloc(this._pictureRepository) : super(PictureInitial()) {
    on<StartPictureGetEvent>(_startPictureGetEvent);
  }

  FutureOr<void> _startPictureGetEvent(
      StartPictureGetEvent event, Emitter<PictureState> emit) async {
    emit(PictureLoading());
    List<PictureModel> pictureList = await _pictureRepository.getPictureList();
    emit(PicturesLoaded(pictureList: pictureList));
  }
}
