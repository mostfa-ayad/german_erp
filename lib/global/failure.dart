// ignore_for_file: public_member_api_docs, sort_constructors_first
class ServerException implements Exception {
  String msg;
  ServerException({
    required this.msg,
  });
}

class Failure {
  String msg;
  Failure({
    required this.msg,
  });
}
