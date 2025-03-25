import 'package:technical_flutter_exam/features/domain/repository/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository authRepository;

  LogoutUseCase({required this.authRepository});

  Future<void> logout() async {
    await authRepository.logout();
  }
}
