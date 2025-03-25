import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_flutter_exam/features/domain/model/company_model.dart';
import 'package:technical_flutter_exam/features/domain/usecase/other_usecase.dart';

part 'others_event.dart';

part 'others_state.dart';

class OthersBloc extends Bloc<OthersEvent, OthersState> {
  OthersBloc({required OtherUseCase otherUseCase})
    : _otherUseCase = otherUseCase,
      super(OthersState()) {
    on<OtherCompanyInitEvent>(_otherCompanyInitEvent);
    on<OtherCompanyPageIndexEvent>(_otherCompanyPageIndexEvent);
  }

  final OtherUseCase _otherUseCase;

  void _otherCompanyInitEvent(
    OtherCompanyInitEvent event,
    Emitter<OthersState> emit,
  ) {
    final otherCompany = <CompanyModel>[];

    otherCompany.clear();
    otherCompany.addAll(_otherUseCase.getCompanyDetails());

    final companyModel = otherCompany[0];

    debugPrint('Other Company: $companyModel');

    emit(
      state.copyWith(
        otherStatus: OtherStatus.fetch,
        data: otherCompany,
        currentCompany: companyModel,
      ),
    );
  }

  void _otherCompanyPageIndexEvent(
    OtherCompanyPageIndexEvent event,
    Emitter<OthersState> emit,
  ) {
    final companyModel = state.data[event.pageIndex];
    emit(state.copyWith(currentCompany: companyModel));
  }
}
