import 'package:dio/dio.dart';
import 'package:technical_flutter_exam/core/dio/dio_interceptor.dart';

class DioClient {
  final Dio dio;

  DioClient(String baseUrl) : dio = Dio(BaseOptions(baseUrl: baseUrl)) {
    dio.interceptors.add(DioInterceptor());
  }
}
