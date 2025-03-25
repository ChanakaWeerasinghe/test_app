import 'package:technical_flutter_exam/core/dio/api_response.dart';
import 'package:technical_flutter_exam/core/dio/api_wrapper.dart';
import 'package:technical_flutter_exam/features/domain/entity/auth_payload_entity.dart';
import 'package:technical_flutter_exam/features/domain/entity/auth_result_entity.dart';

class AuthApi {
  final ApiWrapper apiWrapper;

  AuthApi({required this.apiWrapper});

  Future<ApiResponse<AuthResultEntity>> login(AuthPayloadEntity payload) async {
    return await apiWrapper.request<AuthResultEntity>(
      () async => await apiWrapper.dio.post('/login', data: payload.toJson()),
      fromJson: (json) => AuthResultEntity.fromJson(json),
    );
  }
}
