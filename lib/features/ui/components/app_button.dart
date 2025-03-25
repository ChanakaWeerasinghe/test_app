import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final bool isDisabled;
  final Color? color;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.h,
      child: ElevatedButton(
        onPressed: !isDisabled ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            isDisabled
                ? AppColors.buttonDisabled
                : color ?? AppColors.buttonEnabled,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color:
                isDisabled ? AppColors.buttonDisabledText : Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16.5.sp,
          ),
        ),
      ),
    );
  }
}
