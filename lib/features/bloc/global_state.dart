part of 'global_bloc.dart';

enum LoginStatus { initial, showPin, closePin, verifying, verified, error }

enum ErrorMsgStatus { initial, emptyUsername, exceedLimit, specialChar }

enum SocialStatus { initial, loading, simulateLogout, fetch, error, logout }

final class GlobalState extends Equatable {
  const GlobalState({
    this.loginStatus = LoginStatus.initial,
    this.errorMsgStatus = ErrorMsgStatus.initial,
    this.socialStatus = SocialStatus.initial,
    this.userName = "",
    this.otp = "",
    this.isBtnEnabled = false,
    this.userModel = const UserModel(username: "", userId: "", imgUrl: ""),
    this.socialModel = const [],
    this.companyModel = const [],
  });

  final LoginStatus loginStatus;
  final ErrorMsgStatus errorMsgStatus;
  final SocialStatus socialStatus;
  final String userName;
  final String otp;
  final bool isBtnEnabled;
  final UserModel userModel;
  final List<SocialModel> socialModel;
  final List<CompanyModel> companyModel;

  GlobalState copyWith({
    LoginStatus? loginStatus,
    ErrorMsgStatus? errorMsgStatus,
    SocialStatus? socialStatus,
    String? userName,
    String? otp,
    bool? isBtnEnabled,
    List<String>? socialList,
    List<CompanyModel>? companyModel,
    UserModel? userModel,
    List<SocialModel>? socialModel,
  }) {
    return GlobalState(
      loginStatus: loginStatus ?? this.loginStatus,
      errorMsgStatus: errorMsgStatus ?? this.errorMsgStatus,
      socialStatus: socialStatus ?? this.socialStatus,
      userName: userName ?? this.userName,
      otp: otp ?? this.otp,
      isBtnEnabled: isBtnEnabled ?? this.isBtnEnabled,
      userModel: userModel ?? this.userModel,
      socialModel: socialModel ?? this.socialModel,
      companyModel: companyModel ?? this.companyModel,
    );
  }

  @override
  List<Object?> get props => [
    loginStatus,
    errorMsgStatus,
    socialStatus,
    userName,
    otp,
    isBtnEnabled,
    userModel,
    socialModel,
    companyModel,
  ];
}
