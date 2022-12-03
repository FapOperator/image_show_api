import 'package:image_show_api/model/picture_model.dart';

abstract class PictureRemoteDataSource {
  Future<List<PictureModel>> getPictureList();
}
