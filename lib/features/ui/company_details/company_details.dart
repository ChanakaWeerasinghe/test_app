import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:technical_flutter_exam/core/util/app_theme.dart';
import 'package:technical_flutter_exam/features/domain/model/company_model.dart';
import 'package:technical_flutter_exam/features/domain/model/social_model.dart';
import 'package:technical_flutter_exam/features/routes/routes.dart';
import 'package:technical_flutter_exam/features/ui/components/app_button.dart';
import 'package:technical_flutter_exam/features/ui/components/app_scaffold.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class CompanyDetailsWidget extends StatelessWidget {
  final SocialModel data;
  final CompanyModel companyData;

  const CompanyDetailsWidget({
    super.key,
    required this.data,
    required this.companyData,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.determineThemeByName(data.name);
    return AppScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black45,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        systemOverlayStyle: AppTheme.getSystemOverlayStyle(),
        backgroundColor: theme.primary,
        title: Text(
          data.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: data.imgUrl,
              width: double.infinity,
              height: 180.h,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Text(
                data.history,
                style: TextStyle(color: Colors.black, fontSize: 15.sp),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: AppButton(
                color: theme.primary,
                onPressed: () {
                  context.push(Routes.web, extra: companyData);
                },
                text: "${AppLocalizations.of(context)!.visit} ${data.name}",
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
