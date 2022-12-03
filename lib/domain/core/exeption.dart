class ServerException<T> implements Exception {
  T? erorr;
  ServerException({this.erorr});
}
