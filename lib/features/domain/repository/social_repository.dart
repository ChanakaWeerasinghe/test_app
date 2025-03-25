import 'package:either_dart/either.dart';
import 'package:technical_flutter_exam/features/domain/model/company_model.dart';
import 'package:technical_flutter_exam/features/domain/model/fail_model.dart';
import 'package:technical_flutter_exam/features/domain/model/social_model.dart';
import 'package:technical_flutter_exam/features/domain/model/success_model.dart';

abstract class SocialRepository {
  Future<Either<Fail, Success<List<SocialModel>>>> getSocial();
  List<CompanyModel> getCompanyDetails();
}
