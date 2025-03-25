import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_flutter_exam/core/dio/dio.dart' as dio;
import 'package:technical_flutter_exam/core/logging/app_logging.dart';
import 'package:technical_flutter_exam/features/bloc/global_bloc.dart';
import 'package:technical_flutter_exam/features/domain/usecase/company_usecase.dart';
import 'package:technical_flutter_exam/features/domain/usecase/login_usecase.dart';
import 'package:technical_flutter_exam/features/domain/usecase/logout_usecase.dart';
import 'package:technical_flutter_exam/features/domain/usecase/social_usecase.dart';
import 'package:technical_flutter_exam/features/routes/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  logger.info('Application Successfully Initialized');
  dio.setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => GlobalBloc(
            loginUseCase: dio.getIt<LoginUseCase>(),
            getSocialUseCase: dio.getIt<GetSocialUseCase>(),
            companyUseCase: dio.getIt<CompanyUseCase>(),
            logoutUseCase: dio.getIt<LogoutUseCase>(),
          ),
      child: ScreenUtilInit(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(useMaterial3: true),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [const Locale('en')],
          routerConfig: AppRoutes.routers,
        ),
      ),
    );
  }
}
