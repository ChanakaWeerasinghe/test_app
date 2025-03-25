import 'package:either_dart/either.dart';
import 'package:technical_flutter_exam/core/usecase/usecase_base_model.dart';
import 'package:technical_flutter_exam/features/domain/model/auth_model.dart';
import 'package:technical_flutter_exam/features/domain/model/fail_model.dart';
import 'package:technical_flutter_exam/features/domain/model/user_model.dart';
import 'package:technical_flutter_exam/features/domain/repository/auth_repository.dart';

import '../model/success_model.dart';

class LoginUseCase
    extends Usecase<Either<Fail, Success<UserModel>>, AuthModel> {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  @override
  Future<Either<Fail, Success<UserModel>>> call(AuthModel param) async {
    return await authRepository.login(param);
  }
}
