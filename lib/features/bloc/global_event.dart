part of 'global_bloc.dart';

abstract class GlobalEvent extends Equatable {
  const GlobalEvent();
}

class LoginPressButtonEvent extends GlobalEvent {
  @override
  List<Object?> get props => [];
}

class LoginUsernameTextEvent extends GlobalEvent {
  final String userName;

  const LoginUsernameTextEvent({required this.userName});

  @override
  List<Object?> get props => [userName];
}

class LoginVerifyEvent extends GlobalEvent {
  final String otp;

  const LoginVerifyEvent({required this.otp});

  @override
  List<Object?> get props => [otp];
}

class LoginHideDialogEvent extends GlobalEvent {
  @override
  List<Object?> get props => [];
}

class LoginResetEvent extends GlobalEvent {
  @override
  List<Object?> get props => [];
}

class GetSocialDataEvent extends GlobalEvent {
  @override
  List<Object?> get props => [];
}

class GetCompanyDetailsEvent extends GlobalEvent {
  @override
  List<Object?> get props => [];
}

class LogoutEvent extends GlobalEvent {
  @override
  List<Object?> get props => [];
}
