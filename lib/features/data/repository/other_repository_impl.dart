import 'package:technical_flutter_exam/core/constants/app_assets.dart';
import 'package:technical_flutter_exam/core/constants/app_constants.dart';
import 'package:technical_flutter_exam/features/domain/model/company_model.dart';
import 'package:technical_flutter_exam/features/domain/repository/others_repository.dart';

class OtherRepositoryImpl extends OthersRepository {
  @override
  List<CompanyModel> getOtherCompany() {
    final companyDetails = <CompanyModel>[];

    companyDetails.add(
      CompanyModel(
        name: AppConstants.samsung,
        webUrl: AppConstants.samsungUrl,
        imgAsset: AppAssets.samsung,
        isFromApi: false,
      ),
    );

    companyDetails.add(
      CompanyModel(
        name: AppConstants.apple,
        webUrl: AppConstants.appleUrl,
        imgAsset: AppAssets.apple,
        isFromApi: false,
      ),
    );

    companyDetails.add(
      CompanyModel(
        name: AppConstants.windows,
        webUrl: AppConstants.windowsUrl,
        imgAsset: AppAssets.windows,
        isFromApi: false,
      ),
    );

    return companyDetails;
  }
}
