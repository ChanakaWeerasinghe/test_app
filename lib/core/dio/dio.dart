import 'package:get_it/get_it.dart';
import 'package:technical_flutter_exam/core/constants/app_constants.dart';
import 'package:technical_flutter_exam/core/dio/api_wrapper.dart';
import 'package:technical_flutter_exam/core/dio/dio_client.dart';
import 'package:technical_flutter_exam/features/data/api/auth_api.dart';
import 'package:technical_flutter_exam/features/data/api/social_api.dart';
import 'package:technical_flutter_exam/features/data/repository/auth_repository_impl.dart';
import 'package:technical_flutter_exam/features/data/repository/other_repository_impl.dart';
import 'package:technical_flutter_exam/features/data/repository/social_repository_impl.dart';
import 'package:technical_flutter_exam/features/domain/repository/auth_repository.dart';
import 'package:technical_flutter_exam/features/domain/repository/others_repository.dart';
import 'package:technical_flutter_exam/features/domain/repository/social_repository.dart';
import 'package:technical_flutter_exam/features/domain/usecase/company_usecase.dart';
import 'package:technical_flutter_exam/features/domain/usecase/login_usecase.dart';
import 'package:technical_flutter_exam/features/bloc/global_bloc.dart';
import 'package:technical_flutter_exam/features/domain/usecase/logout_usecase.dart';
import 'package:technical_flutter_exam/features/domain/usecase/other_usecase.dart';
import 'package:technical_flutter_exam/features/domain/usecase/social_usecase.dart';
import 'package:technical_flutter_exam/features/ui/others/bloc/others_bloc.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  //Dio Client
  getIt.registerLazySingleton<DioClient>(
    () => DioClient(AppConstants.appBaseUrl),
  );

  //API Wrapper
  getIt.registerLazySingleton<ApiWrapper>(() => ApiWrapper(getIt<DioClient>()));

  //API
  getIt.registerLazySingleton<AuthApi>(
    () => AuthApi(apiWrapper: getIt<ApiWrapper>()),
  );

  getIt.registerLazySingleton<SocialApi>(
    () => SocialApi(apiWrapper: getIt<ApiWrapper>()),
  );

  //Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authApi: getIt<AuthApi>()),
  );

  getIt.registerLazySingleton<SocialRepository>(
    () => SocialRepositoryImpl(socialApi: getIt<SocialApi>()),
  );

  getIt.registerLazySingleton<OthersRepository>(() => OtherRepositoryImpl());

  //UseCase
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(authRepository: getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<GetSocialUseCase>(
    () => GetSocialUseCase(socialRepository: getIt<SocialRepository>()),
  );

  getIt.registerLazySingleton<CompanyUseCase>(
    () => CompanyUseCase(socialRepository: getIt<SocialRepository>()),
  );

  getIt.registerLazySingleton<OtherUseCase>(
    () => OtherUseCase(othersRepository: getIt<OthersRepository>()),
  );

  getIt.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(authRepository: getIt<AuthRepository>()),
  );

  //Bloc
  getIt.registerFactory<GlobalBloc>(
    () => GlobalBloc(
      loginUseCase: getIt<LoginUseCase>(),
      getSocialUseCase: getIt<GetSocialUseCase>(),
      companyUseCase: getIt<CompanyUseCase>(),
      logoutUseCase: getIt<LogoutUseCase>(),
    ),
  );

  getIt.registerFactory<OthersBloc>(
    () => OthersBloc(otherUseCase: getIt<OtherUseCase>()),
  );
}
