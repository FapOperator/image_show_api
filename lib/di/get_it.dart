import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:image_show_api/aplication/bloc/picture_bloc.dart';
import 'package:image_show_api/domain/core/api_client.dart';
import 'package:image_show_api/domain/repository/picture_remote_data_source.dart';
import 'package:image_show_api/domain/repository/picture_repository.dart';
import 'package:image_show_api/infostructure/data_source/impl_picture_remote_data_source.dart';
import 'package:image_show_api/infostructure/repositories/picture_repository_impl.dart';

final getIt = GetIt.I;

Future init() async {
  getIt.registerLazySingleton<Client>(() => Client());

  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt()));

  getIt.registerLazySingleton<PictureRepository>(
      () => PictureRepositoryImpl(getIt()));

  getIt.registerLazySingleton<PictureRemoteDataSource>(
      () => ImplPictureRemoteDataSource(getIt()));

  getIt.registerFactory<PictureBloc>(() => PictureBloc(getIt()));
}
