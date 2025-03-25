import 'package:either_dart/either.dart';
import 'package:technical_flutter_exam/features/domain/model/auth_model.dart';
import 'package:technical_flutter_exam/features/domain/model/fail_model.dart';
import 'package:technical_flutter_exam/features/domain/model/success_model.dart';
import 'package:technical_flutter_exam/features/domain/model/user_model.dart';

abstract class AuthRepository {
  Future<Either<Fail, Success<UserModel>>> login(AuthModel authModel);

  Future<void> logout();
}
