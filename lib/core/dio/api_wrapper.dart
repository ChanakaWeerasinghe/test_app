import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:technical_flutter_exam/core/dio/api_response.dart';
import 'package:technical_flutter_exam/core/dio/dio_client.dart';

class ApiWrapper {
  final Dio _dio;

  final Logger logger = Logger('ApiWrapper');

  ApiWrapper(DioClient dioClient) : _dio = dioClient.dio;

  Dio get dio => _dio;

  Future<ApiResponse<T>> request<T>(
    Future<Response> Function() apiCall, {
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final response = await apiCall();

      logger.info('API Response: ${response.data}');

      if (response.statusCode == 200) {
        final data = fromJson(response.data);
        return ApiResponse.success(data);
      } else {
        logger.warning(
          'API Error: Status Code ${response.statusCode}, Response: ${response.data}',
        );

        return ApiResponse.failure(
          'Error: ${response.statusMessage ?? "Unknown Error"}',
        );
      }
    } on DioException catch (e) {
      logger.severe('DioError: ${e.message}', e.error);
      return ApiResponse.failure(
        'Request failed: ${e.response?.statusMessage ?? e.message}',
      );
    } catch (e, stackTrace) {
      logger.severe('Unexpected Error: $e', stackTrace);
      return ApiResponse.failure('Unexpected error occurred: $e');
    }
  }
}
