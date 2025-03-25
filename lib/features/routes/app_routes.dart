import 'package:technical_flutter_exam/features/domain/model/company_model.dart';
import 'package:technical_flutter_exam/features/domain/model/social_model.dart';
import 'package:technical_flutter_exam/features/routes/routes.dart';
import 'package:technical_flutter_exam/features/ui/company_details/company_details.dart';
import 'package:technical_flutter_exam/features/ui/login/login_ui.dart';
import 'package:technical_flutter_exam/features/ui/others/others_ui.dart';
import 'package:technical_flutter_exam/features/ui/socials/socials_ui.dart';
import 'package:technical_flutter_exam/features/ui/webview/webview_ui.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final routers = GoRouter(
    initialLocation: Routes.login,
    routes: [
      //Login
      GoRoute(
        path: Routes.login,
        name: Routes.login,
        builder: (_, __) {
          return const LoginScreen();
        },
      ),
      //Socials
      GoRoute(
        path: Routes.socials,
        name: Routes.socials,
        builder: (_, __) {
          return const SocialsScreen();
        },
      ),
      //Company Details
      GoRoute(
        path: Routes.companyDetails,
        name: Routes.companyDetails,
        builder: (_, state) {
          final extras = state.extra as Map<String, dynamic>;
          final data = extras['socialModel'] as SocialModel;
          final companyData = extras['companyDetails'] as CompanyModel;
          return CompanyDetailsWidget(data: data, companyData: companyData);
        },
      ),
      //WebView
      GoRoute(
        path: Routes.web,
        name: Routes.web,
        builder: (_, state) {
          final data = state.extra as CompanyModel;
          return WebViewScreen(data: data);
        },
      ),
      //Others
      GoRoute(
        path: Routes.others,
        name: Routes.others,
        builder: (_, __) {
          return OthersScreen();
        },
      ),
    ],
  );
}
