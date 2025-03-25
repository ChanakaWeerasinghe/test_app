import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_flutter_exam/core/logging/app_logging.dart';
import 'package:technical_flutter_exam/core/usecase/usecase_base_model.dart';
import 'package:technical_flutter_exam/core/util/app_regex.dart';
import 'package:technical_flutter_exam/features/domain/model/auth_model.dart';
import 'package:technical_flutter_exam/features/domain/model/company_model.dart';
import 'package:technical_flutter_exam/features/domain/model/social_model.dart';
import 'package:technical_flutter_exam/features/domain/model/user_model.dart';
import 'package:technical_flutter_exam/features/domain/usecase/company_usecase.dart';
import 'package:technical_flutter_exam/features/domain/usecase/login_usecase.dart';
import 'package:technical_flutter_exam/features/domain/usecase/logout_usecase.dart';
import 'package:technical_flutter_exam/features/domain/usecase/social_usecase.dart';

part 'global_event.dart';

part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc({
    required LoginUseCase loginUseCase,
    required GetSocialUseCase getSocialUseCase,
    required CompanyUseCase companyUseCase,
    required LogoutUseCase logoutUseCase,
  }) : _loginUseCase = loginUseCase,
       _getSocialUseCase = getSocialUseCase,
       _companyUseCase = companyUseCase,
       _logoutUseCase = logoutUseCase,
       super(GlobalState()) {
    on<LoginPressButtonEvent>(_loginPressBtnEvent);
    on<LoginVerifyEvent>(_loginVerifyEvent);
    on<LoginHideDialogEvent>(_loginHideDialogEvent);
    on<LoginUsernameTextEvent>(_loginUsernameTxtEvent);
    on<LoginResetEvent>(_loginResetEvent);
    on<GetSocialDataEvent>(_getSocialDataEvent);
    on<GetCompanyDetailsEvent>(_getCompanyDetailsEvent);
    on<LogoutEvent>(_logoutEvent);
  }

  final LoginUseCase _loginUseCase;
  final GetSocialUseCase _getSocialUseCase;
  final CompanyUseCase _companyUseCase;
  final LogoutUseCase _logoutUseCase;

  void _loginResetEvent(LoginResetEvent event, Emitter<GlobalState> emit) =>
      emit(
        state.copyWith(
          loginStatus: LoginStatus.initial,
          errorMsgStatus: ErrorMsgStatus.initial,
          isBtnEnabled: false,
          userName: "",
          otp: "",
        ),
      );

  void _loginPressBtnEvent(
    LoginPressButtonEvent event,
    Emitter<GlobalState> emit,
  ) {
    emit(state.copyWith(loginStatus: LoginStatus.showPin));
  }

  Future<void> _loginVerifyEvent(
    LoginVerifyEvent event,
    Emitter<GlobalState> emit,
  ) async {
    emit(state.copyWith(loginStatus: LoginStatus.verifying));

    final data = AuthModel(userName: state.userName, otp: event.otp);
    final response = await _loginUseCase.call(data);

    response.fold(
      (left) {
        debugPrint(left.message);
        logger.severe(left.message);

        if (left.data == null) {
          emit(state.copyWith(loginStatus: LoginStatus.error));
        }
      },
      (right) {
        debugPrint('${right.data}');
        logger.fine(right.data);
        logger.fine(right.message);

        if (right.data != null) {
          emit(
            state.copyWith(
              loginStatus: LoginStatus.verified,
              userModel: UserModel(
                username: right.data?.username ?? "",
                userId: right.data?.userId ?? "",
                imgUrl: right.data?.imgUrl ?? "",
              ),
            ),
          );

          add(GetSocialDataEvent());
        }
      },
    );
  }

  void _loginHideDialogEvent(
    LoginHideDialogEvent event,
    Emitter<GlobalState> emit,
  ) {
    emit(state.copyWith(loginStatus: LoginStatus.closePin));
  }

  void _loginUsernameTxtEvent(
    LoginUsernameTextEvent event,
    Emitter<GlobalState> emit,
  ) {
    debugPrint('Event: ${event.userName}');
    final textTrim = event.userName.trim();
    if (event.userName.length > 24) {
      emit(
        state.copyWith(
          errorMsgStatus: ErrorMsgStatus.exceedLimit,
          isBtnEnabled: false,
        ),
      );
    } else if (textTrim.isEmpty || textTrim == " ") {
      emit(
        state.copyWith(
          errorMsgStatus: ErrorMsgStatus.emptyUsername,
          isBtnEnabled: false,
        ),
      );
    } else if (!AppRegex.isAlphanumeric(event.userName)) {
      emit(
        state.copyWith(
          errorMsgStatus: ErrorMsgStatus.specialChar,
          isBtnEnabled: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isBtnEnabled: true,
          userName: event.userName,
          errorMsgStatus: ErrorMsgStatus.initial,
        ),
      );
    }
  }

  Future<void> _getSocialDataEvent(
    GetSocialDataEvent event,
    Emitter<GlobalState> emit,
  ) async {
    emit(
      state.copyWith(
        socialStatus: SocialStatus.loading,
        userName: "",
        otp: "",
        isBtnEnabled: false,
      ),
    );

    final response = await _getSocialUseCase.call(NoParams());

    response.fold(
      (left) {
        debugPrint(left.message);
        logger.severe(left.message);

        if (left.data == null) {
          emit(state.copyWith(socialStatus: SocialStatus.error));
        }
      },
      (right) {
        debugPrint('${right.data}');
        logger.fine(right.data);
        logger.fine(right.message);

        if (right.data != null) {
          emit(
            state.copyWith(
              socialStatus: SocialStatus.fetch,
              socialModel: right.data,
            ),
          );
        }
      },
    );

    add(GetCompanyDetailsEvent());
  }

  void _getCompanyDetailsEvent(
    GetCompanyDetailsEvent event,
    Emitter<GlobalState> emit,
  ) {
    final companyList = _companyUseCase.getCompanyDetails();

    emit(state.copyWith(companyModel: companyList));
  }

  Future<void> _logoutEvent(
    LogoutEvent event,
    Emitter<GlobalState> emit,
  ) async {
    emit(state.copyWith(socialStatus: SocialStatus.simulateLogout));
    await _logoutUseCase.logout();
    emit(state.copyWith(socialStatus: SocialStatus.logout));
    add(LoginResetEvent());
  }
}
