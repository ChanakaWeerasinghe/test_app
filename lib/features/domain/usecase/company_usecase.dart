import 'package:technical_flutter_exam/features/domain/model/company_model.dart';
import 'package:technical_flutter_exam/features/domain/repository/social_repository.dart';

class CompanyUseCase {
  final SocialRepository socialRepository;

  CompanyUseCase({required this.socialRepository});

  List<CompanyModel> getCompanyDetails() {
    return socialRepository.getCompanyDetails();
  }
}
