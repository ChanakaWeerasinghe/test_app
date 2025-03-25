import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';

class AppDialog {
  static bool isOpen = false;

  static Future<void> confirm(
    BuildContext context, {
    bool barrierDismissible = true,
    required String message,
    Function()? onConfirm,
    Function()? onCancel,
    Function? whenComplete,
  }) {
    dismiss(context);
    isOpen = true;

    return showDialog<dynamic>(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {
            if (barrierDismissible) {
              dismiss(context);
            }
          },
          child: Container(
            color: Colors.black12,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13.r),
                child: Material(
                  child: Container(
                    color: Colors.white,
                    width: 255.w,
                    height: 125.h,
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              children: [
                                SizedBox(height: 18.h),
                                Text(
                                  AppLocalizations.of(context)!.message,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  message,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.3.sp,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 0.8.h,
                          width: double.infinity,
                          color: Colors.black26,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Material(
                                color: Colors.white,
                                child: InkWell(
                                  onTap: onConfirm,
                                  child: Container(
                                    height: 40.h,
                                    alignment: Alignment.center,
                                    child: Text(
                                      AppLocalizations.of(context)!.confirm,
                                      style: TextStyle(
                                        color: AppColors.textGreen,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 0.8.h,
                              height: 40.h,
                              color: Colors.black26,
                            ),
                            Expanded(
                              child: Material(
                                color: Colors.white,
                                child: InkWell(
                                  onTap: onCancel,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 40.h,
                                    child: Text(
                                      AppLocalizations.of(context)!.cancel,
                                      style: TextStyle(
                                        color: AppColors.textRed,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ).whenComplete(() {
      isOpen = false;
      if (whenComplete != null) {
        whenComplete();
      }
    });
  }

  static Future<void> error(
    BuildContext context, {
    bool barrierDismissible = true,
    required String message,
    Function? whenComplete,
    Function()? onCancel,
  }) {
    dismiss(context);
    isOpen = true;

    return showDialog<dynamic>(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: GestureDetector(
                onTap: () {
                  if (barrierDismissible) {
                    dismiss(context);
                  }
                },
                child: Container(
                  color: Colors.black12,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13.r),
                      child: Material(
                        child: Container(
                          color: Colors.white,
                          width: 255.w,
                          height: 125.h,
                          child: Column(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 18.h),
                                      Text(
                                        AppLocalizations.of(context)!.error,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        message,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.3.sp,
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 0.8.h,
                                width: double.infinity,
                                color: Colors.black26,
                              ),
                              Material(
                                color: Colors.white,
                                child: InkWell(
                                  onTap: onCancel,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 40.h,
                                    child: Text(
                                      AppLocalizations.of(context)!.close,
                                      style: TextStyle(
                                        color: AppColors.textRed,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      isOpen = false;
      if (whenComplete != null) {
        whenComplete();
      }
    });
  }

  static Future<void> custom(
    BuildContext context, {
    required Widget child,
    bool barrierDismissible = true,
    Function? whenComplete,
  }) {
    dismiss(context);
    isOpen = true;

    return showDialog<dynamic>(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: GestureDetector(
                onTap: () {
                  if (barrierDismissible) {
                    dismiss(context);
                  }
                },
                child: Container(
                  color: Colors.black12,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13.r),
                      child: child,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      isOpen = false;
      if (whenComplete != null) {
        whenComplete();
      }
    });
  }

  static void dismiss(BuildContext context) {
    if (isOpen) {
      context.pop();
    }
  }
}
