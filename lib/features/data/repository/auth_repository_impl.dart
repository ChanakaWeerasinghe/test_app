import 'package:either_dart/either.dart';
import 'package:technical_flutter_exam/features/data/api/auth_api.dart';
import 'package:technical_flutter_exam/features/domain/entity/auth_payload_entity.dart';
import 'package:technical_flutter_exam/features/domain/model/auth_model.dart';
import 'package:technical_flutter_exam/features/domain/model/fail_model.dart';
import 'package:technical_flutter_exam/features/domain/model/success_model.dart';
import 'package:technical_flutter_exam/features/domain/model/user_model.dart';
import 'package:technical_flutter_exam/features/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends Authimport 'package:either_dart/either.dart';
import 'package:technical_flutter_exam/features/data/api/auth_api.dart';
import 'package:technical_flutter_exam/features/domain/entity/auth_payload_entity.dart';
import 'package:technical_flutter_exam/features/domain/model/auth_model.dart';
import 'package:technical_flutter_exam/features/domain/model/fail_model.dart';
import 'package:technical_flutter_exam/features/domain/model/success_model.dart';
import 'package:technical_flutter_exam/features/domain/model/user_model.dart';
import 'package:technical_flutter_exam/features/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthApi authApi;

  AuthRepositoryImpl({required this.authApi});

  @override
  Future<Either<Fail, Success<UserModel>>> login(AuthModel authModel) async {
    final data = AuthPayloadEntity(
      userName: authModel.userName,
      otp: authModel.otp,
    );
    final response = await authApi.login(data);

    if (response.isSuccess == true) {
      final userId = response.data?.userId ?? "";
      final userImg = response.data?.profilePicture ?? "";
      final username = response.data?.userName ?? "";

      return Right(
        Success(
          data: UserModel(username: username, userId: userId, imgUrl: userImg),
        ),
      );
    } else {
      return Left(Fail(message: response.errorMessage ?? ""));
    }
  }

  @override
  Future<void> logout() async {
    await Future.delayed(Duration(seconds: 3));
  }
}
Repository {
  final AuthApi authApi;

  AuthRepositoryImpl({required this.authApi});

  @override
  Future<Either<Fail, Success<UserModel>>> login(AuthModel authModel) async {
    final data = AuthPayloadEntity(
      userName: authModel.userName,
      otp: authModel.otp,
    );
    final response = await authApi.login(data);

    if (response.isSuccess == true) {
      final userId = response.data?.userId ?? "";
      final userImg = response.data?.profilePicture ?? "";
      final username = response.data?.userName ?? "";

      return Right(
        Success(
          data: UserModel(username: username, userId: userId, imgUrl: userImg),
        ),
      );
    } else {
      return Left(Fail(message: response.errorMessage ?? ""));
    }
  }

  @override
  Future<void> logout() async {
    await Future.delayed(Duration(seconds: 3));
  }
}
