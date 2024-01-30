import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:viacepapp/repository/cep_back_interceptor.dart';

class BackCustomDio {
  final _dio = Dio();

  Dio get dio => _dio;

  BackCustomDio() {
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = dotenv.get("BACKCEPURL");
    _dio.interceptors.add(BackCepInterceptor());
  }
}
