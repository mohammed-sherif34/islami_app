import 'package:dio/dio.dart';



class ApiManager {
  factory ApiManager() {
    return _instance;
  }

  late Dio dio;
  ApiManager._() {
    dio = Dio();
  }
  static final ApiManager _instance = ApiManager._();
  Future<Response> get(
      {required String endPoint,
      Map<String, dynamic>? param,
      Map<String, dynamic>? headers}) {
    return dio.get(
      endPoint,
      queryParameters: param,
      options: Options(
        headers: headers,
      ),
    );
  }

}
