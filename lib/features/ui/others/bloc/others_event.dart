part of 'others_bloc.dart';

sealed class OthersEvent extends Equatable {
  const OthersEvent();
}

class OtherCompanyInitEvent extends OthersEvent {
  @override
  List<Object?> get props => [];
}

class OtherCompanyPageIndexEvent extends OthersEvent {
  final int pageIndex;

  const OtherCompanyPageIndexEvent({required this.pageIndex});

  @override
  List<Object?> get props => [pageIndex];
}
