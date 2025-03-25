import 'package:either_dart/either.dart';
import 'package:technical_flutter_exam/core/usecase/usecase_base_model.dart';
import 'package:technical_flutter_exam/features/domain/model/fail_model.dart';
import 'package:technical_flutter_exam/features/domain/model/social_model.dart';
import 'package:technical_flutter_exam/features/domain/model/success_model.dart';
import 'package:technical_flutter_exam/features/domain/repository/social_repository.dart';

class GetSocialUseCase
    extends Usecase<Either<Fail, Success<List<SocialModel>>>, NoParams> {
  final SocialRepository socialRepository;

  GetSocialUseCase({required this.socialRepository});

  @override
  Future<Either<Fail, Success<List<SocialModel>>>> call(NoParams param) async {
    return await socialRepository.getSocial();
  }
}
