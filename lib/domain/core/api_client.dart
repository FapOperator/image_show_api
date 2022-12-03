import 'package:http/http.dart' as http;
import 'package:image_show_api/common/constants/api_constans.dart';

import 'exeption.dart';

class ApiClient {
  final http.Client _client;

  ApiClient(this._client);

  Uri getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params?.forEach((dynamic key, dynamic value) {
        paramsString += '?$key=$value';
      });
    }

    return Uri.parse('${ApiConstants.BASE_URL}$path$paramsString');
  }

  dynamic get(
    String path, {
    Map<dynamic, dynamic>? params,
  }) async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 500));
    final response = await _client.get(
      getPath(path, params),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return response.body;
    } else if (response.statusCode == 400) {
      throw ServerException<dynamic>();
    } else if (response.statusCode == 404) {
      ServerException<dynamic>();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
