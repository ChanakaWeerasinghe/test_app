part of 'others_bloc.dart';

enum OtherStatus { init, fetch }

final class OthersState extends Equatable {
  static const CompanyModel defaultCompanyModel = CompanyModel(
    name: "",
    webUrl: "",
    imgAsset: "",
    isFromApi: false,
  );

  const OthersState({
    this.otherStatus = OtherStatus.init,
    this.data = const [],
    this.currentCompany = defaultCompanyModel,
  });

  final OtherStatus otherStatus;
  final List<CompanyModel> data;
  final CompanyModel currentCompany;

  OthersState copyWith({
    OtherStatus? otherStatus,
    List<CompanyModel>? data,
    CompanyModel? currentCompany,
  }) => OthersState(
    otherStatus: otherStatus ?? this.otherStatus,
    data: data ?? this.data,
    currentCompany: currentCompany ?? this.currentCompany,
  );

  @override
  List<Object> get props => [otherStatus, data, currentCompany];
}
