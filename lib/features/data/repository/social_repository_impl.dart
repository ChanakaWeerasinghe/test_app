import 'package:either_dart/either.dart';
import 'package:technical_flutter_exam/core/constants/app_assets.dart';
import 'package:technical_flutter_exam/core/constants/app_constants.dart';
import 'package:technical_flutter_exam/features/data/api/social_api.dart';
import 'package:technical_flutter_exam/features/domain/model/company_model.dart';
import 'package:technical_flutter_exam/features/domain/model/fail_model.dart';
import 'package:technical_flutter_exam/features/domain/model/social_model.dart';
import 'package:technical_flutter_exam/features/domain/model/success_model.dart';
import 'package:technical_flutter_exam/features/domain/repository/social_repository.dart';

class SocialRepositoryImpl extends SocialRepository {
  final SocialApi socialApi;

  SocialRepositoryImpl({required this.socialApi});

  @override
  Future<Either<Fail, Success<List<SocialModel>>>> getSocial() async {
    final response = await socialApi.getSocial();

    if (response.isSuccess == true) {
      final List<SocialModel> socialList = [];
      for (final result in response.data ?? []) {
        socialList.add(
          SocialModel(
            name: result.name,
            history: result.history,
            imgUrl: result.imgUrl,
          ),
        );
      }
      return Right(Success(data: socialList));
    } else {
      return Left(Fail(message: response.errorMessage ?? ""));
    }
  }

  @override
  List<CompanyModel> getCompanyDetails() {
    final companyDetails = <CompanyModel>[];

    companyDetails.add(
      CompanyModel(
        name: AppConstants.youtube,
        webUrl: AppConstants.youtubeUrl,
        imgAsset: AppAssets.youtube,
        isFromApi: true,
      ),
    );

    companyDetails.add(
      CompanyModel(
        name: AppConstants.spotify,
        webUrl: AppConstants.spotifyUrl,
        imgAsset: AppAssets.spotify,
        isFromApi: true,
      ),
    );

    companyDetails.add(
      CompanyModel(
        name: AppConstants.facebook,
        webUrl: AppConstants.facebookUrl,
        imgAsset: AppAssets.facebook,
        isFromApi: true,
      ),
    );

    companyDetails.add(
      CompanyModel(name: "Others", webUrl: "", imgAsset: "", isFromApi: false),
    );

    return companyDetails;
  }
}
