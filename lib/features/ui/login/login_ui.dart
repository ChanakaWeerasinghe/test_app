import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_flutter_exam/core/constants/app_assets.dart';
import 'package:technical_flutter_exam/features/routes/routes.dart';
import 'package:technical_flutter_exam/features/ui/components/app_dialog.dart';
import 'package:technical_flutter_exam/features/ui/components/app_icons.dart';
import 'package:technical_flutter_exam/features/ui/components/app_loading.dart';
import 'package:technical_flutter_exam/features/ui/components/app_textfield.dart';
import 'package:technical_flutter_exam/features/bloc/global_bloc.dart';
import 'package:technical_flutter_exam/features/ui/login/show_pin_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../components/app_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalBloc, GlobalState>(
      listenWhen: (prev, curr) => prev.loginStatus != curr.loginStatus,
      buildWhen: (prev, curr) => prev.loginStatus != curr.loginStatus,
      listener: (context, state) {
        debugPrint('LoginStatus: ${state.loginStatus}');

        switch (state.loginStatus) {
          case LoginStatus.initial:
            break;
          case LoginStatus.showPin:
            showPinDialog(context);
            break;
          case LoginStatus.closePin:
            AppDialog.dismiss(context);
            break;
          case LoginStatus.verifying:
            break;
          case LoginStatus.verified:
            context.pushNamed(Routes.socials);
            break;
          case LoginStatus.error:
            showErrorDialog(context);
            break;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 60.w),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _StackIcons(),
                    SizedBox(height: 100.h),
                    _LoginForm(),
                    SizedBox(height: 10.h),
                    _ButtonWidget(),
                  ],
                ),
                if (context.watch<GlobalBloc>().state.loginStatus ==
                    LoginStatus.verifying)
                  AppLoading(message: AppLocalizations.of(context)!.msgLogin),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _StackIcons extends StatelessWidget {
  const _StackIcons();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      height: 120.h,
      child: const Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: AppIcon(iconString: AppAssets.youtube),
          ),
          Align(
            alignment: Alignment.center,
            child: AppIcon(iconString: AppAssets.spotify),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: AppIcon(iconString: AppAssets.facebook),
          ),
        ],
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    void inputText(String data) {
      debugPrint('textfield: $data');
      context.read<GlobalBloc>().add(LoginUsernameTextEvent(userName: data));
    }

    return BlocBuilder<GlobalBloc, GlobalState>(
      buildWhen: (prev, curr) => prev.errorMsgStatus != curr.errorMsgStatus,
      builder: (context, state) {
        String errorMessage = "";

        switch (state.errorMsgStatus) {
          case ErrorMsgStatus.initial:
            break;
          case ErrorMsgStatus.emptyUsername:
            errorMessage = AppLocalizations.of(context)!.msgEnterUsername;
            break;
          case ErrorMsgStatus.exceedLimit:
            errorMessage = AppLocalizations.of(context)!.msgNotExceed24;
            break;
          case ErrorMsgStatus.specialChar:
            errorMessage = AppLocalizations.of(context)!.msgMustBeAlphaNumeric;
            break;
        }

        return AppTextField(
          hintText: AppLocalizations.of(context)!.username,
          errorMessage: errorMessage,
          onTextChanged: inputText,
        );
      },
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      buildWhen: (prev, curr) => prev.isBtnEnabled != curr.isBtnEnabled,
      builder: (context, state) {
        debugPrint('Button: ${state.isBtnEnabled}');
        return AppButton(
          text: AppLocalizations.of(context)!.enter,
          isDisabled: !state.isBtnEnabled,
          onPressed: () {
            context.read<GlobalBloc>().add(LoginPressButtonEvent());
          },
        );
      },
    );
  }
}

void showPinDialog(BuildContext context) {
  final loginBloc = context.read<GlobalBloc>();

  AppDialog.custom(
    barrierDismissible: false,
    context,
    child: PinDialogWidget(
      onClose: () {
        loginBloc.add(LoginHideDialogEvent());
      },
      onEnter: (pin) {
        if (pin.length >= 6) {
          loginBloc.add(LoginVerifyEvent(otp: pin));
          context.pop();
        }
      },
    ),
  );
}

void showErrorDialog(BuildContext context) {
  final loginBloc = context.read<GlobalBloc>();

  AppDialog.error(
    barrierDismissible: false,
    context,
    message: AppLocalizations.of(context)!.msgLoginFailed,
    onCancel: () {
      loginBloc.add(LoginResetEvent());
      AppDialog.dismiss(context);
    },
  );
}
