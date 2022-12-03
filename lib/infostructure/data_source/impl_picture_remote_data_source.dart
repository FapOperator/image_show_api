import 'package:image_show_api/common/constants/api_constans.dart';
import 'package:image_show_api/domain/core/api_client.dart';
import 'package:image_show_api/domain/repository/picture_remote_data_source.dart';
import 'package:image_show_api/model/picture_model.dart';

class ImplPictureRemoteDataSource extends PictureRemoteDataSource {
  final ApiClient _client;

  ImplPictureRemoteDataSource(this._client);
  @override
  Future<List<PictureModel>> getPictureList() async {
    final response = await _client.get(
      'photos/',
      params: {"client_id": ApiConstants.client_token},
    );
    return pictureModelFromJson(response);
  }
}
