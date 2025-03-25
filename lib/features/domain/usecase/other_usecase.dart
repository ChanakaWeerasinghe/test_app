import 'package:technical_flutter_exam/features/domain/model/company_model.dart';
import 'package:technical_flutter_exam/features/domain/repository/others_repository.dart';

class OtherUseCase {
  final OthersRepository othersRepository;

  OtherUseCase({required this.othersRepository});

  List<CompanyModel> getCompanyDetails() {
    return othersRepository.getOtherCompany();
  }
}
