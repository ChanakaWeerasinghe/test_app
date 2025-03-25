import 'package:technical_flutter_exam/core/dio/api_response.dart';
import 'package:technical_flutter_exam/core/dio/api_wrapper.dart';
import 'package:technical_flutter_exam/features/domain/entity/social_result_entity.dart';

class SocialApi {
  final ApiWrapper apiWrapper;

  SocialApi({required this.apiWrapper});

  Future<ApiResponse<List<SocialResultEntity>>> getSocial() async {
    return await apiWrapper.request<List<SocialResultEntity>>(
      () async => await apiWrapper.dio.get('/socials'),
      fromJson:
          (json) =>
              List.from(
                json,
              ).map((e) => SocialResultEntity.fromJson(e)).toList(),
    );
  }
}
