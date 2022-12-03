import 'package:image_show_api/domain/core/exeption.dart';
import 'package:image_show_api/domain/repository/picture_remote_data_source.dart';
import 'package:image_show_api/domain/repository/picture_repository.dart';
import 'package:image_show_api/model/picture_model.dart';

class PictureRepositoryImpl extends PictureRepository {
  final PictureRemoteDataSource _pictureRemoteDataSource;

  PictureRepositoryImpl(this._pictureRemoteDataSource);
  @override
  Future<List<PictureModel>> getPictureList() async {
    try {
      final tagInfo = await _pictureRemoteDataSource.getPictureList();
      return tagInfo;
    } on ServerException<String> catch (_) {
      return throw "error";
    } on Exception {
      return throw "error";
    }
  }
}
