import 'package:dio/dio.dart';
import 'package:technical_flutter_exam/core/constants/app_constants.dart';
import 'package:technical_flutter_exam/core/logging/app_logging.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.connectTimeout = const Duration(seconds: 30);
    options.receiveTimeout = const Duration(seconds: 30);
    options.headers[AppConstants.appClientId] = "rgbexam";

    logger.info(
      'Request[${options.method}] => PATH: ${options.path},'
      'Headers: ${options.headers}, Body: ${options.data}',
    );

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.info(
      'Response[${response.statusCode}] => PATH: ${response.requestOptions.path}, '
      'Data: ${response.data}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.severe(
      'Error[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}, '
      'Message: ${err.message}, Data: ${err.response?.data}',
      err.error,
      err.stackTrace,
    );
    super.onError(err, handler);
  }
}
