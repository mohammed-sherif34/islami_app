class Failure {
  String errMessage;

  Failure({
    required this.errMessage,
  });
}

class ServerErr extends Failure {
  ServerErr({required super.errMessage});
}

class NetworkErr extends Failure {
  NetworkErr({required super.errMessage});
}
