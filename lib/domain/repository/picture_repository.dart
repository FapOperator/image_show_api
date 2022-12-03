import 'package:image_show_api/model/picture_model.dart';

abstract class PictureRepository {
  Future<List<PictureModel>> getPictureList();
}
