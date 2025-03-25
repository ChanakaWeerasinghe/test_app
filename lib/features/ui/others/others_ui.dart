import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_flutter_exam/core/util/app_theme.dart';
import 'package:technical_flutter_exam/features/domain/usecase/other_usecase.dart';
import 'package:technical_flutter_exam/features/routes/routes.dart';
import 'package:technical_flutter_exam/features/ui/components/app_button.dart';
import 'package:technical_flutter_exam/features/ui/components/app_scaffold.dart';
import 'package:technical_flutter_exam/features/ui/others/bloc/others_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:technical_flutter_exam/core/dio/dio.dart' as dio;
import 'package:go_router/go_router.dart';

class OthersScreen extends StatelessWidget {
  const OthersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (BuildContext context) =>
              OthersBloc(otherUseCase: dio.getIt<OtherUseCase>())
                ..add(OtherCompanyInitEvent()),
      child: const _OthersForm(),
    );
  }
}

class _OthersForm extends StatelessWidget {
  const _OthersForm();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.determineThemeByName("others");
    final primaryColor = theme.primary;
    return AppScaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black45,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: primaryColor,
        systemOverlayStyle: AppTheme.getSystemOverlayStyle(),
        title: Text(
          AppLocalizations.of(context)!.others,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          Text(
            AppLocalizations.of(context)!.msgLike,
            style: TextStyle(color: Colors.black, fontSize: 14.sp),
          ),
          SizedBox(height: 20.h),
          const _CarouselView(),
          SizedBox(height: 10.h),
          const _LabelView(),
          SizedBox(height: 20.h),
          _VisitButtonView(color: primaryColor),
        ],
      ),
    );
  }
}

class _CarouselView extends StatelessWidget {
  const _CarouselView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OthersBloc, OthersState>(
      builder: (context, state) {
        if (state.data.isNotEmpty) {
          return CarouselSlider.builder(
            itemCount: state.data.length,
            itemBuilder: (
              BuildContext context,
              int itemIndex,
              int pageViewIndex,
            ) {
              return SizedBox(
                height: 250.h,
                width: 350.w,
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  child: Image.asset(
                    state.data[itemIndex].imgAsset,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 200.h,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlay: true,
              viewportFraction: 0.8,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              scrollDirection: Axis.horizontal,
              onPageChanged: (pageIndex, __) {
                context.read<OthersBloc>().add(
                  OtherCompanyPageIndexEvent(pageIndex: pageIndex),
                );
              },
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class _LabelView extends StatelessWidget {
  const _LabelView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OthersBloc, OthersState>(
      builder: (context, state) {
        return Text(
          state.currentCompany.name,
          style: TextStyle(color: Colors.black, fontSize: 20.sp),
        );
      },
    );
  }
}

class _VisitButtonView extends StatelessWidget {
  final Color color;

  const _VisitButtonView({required this.color});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OthersBloc, OthersState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: AppButton(
            color: color,
            onPressed: () {
              context.push(Routes.web, extra: state.currentCompany);
            },
            text:
                "${AppLocalizations.of(context)!.visit} ${state.currentCompany.name} ${AppLocalizations.of(context)!.website}",
          ),
        );
      },
    );
  }
}
