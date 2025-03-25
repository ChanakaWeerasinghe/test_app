import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppIcon extends StatelessWidget {
  final String iconString;
  final double? borderRadius;
  final double? width;
  final double? height;

  const AppIcon({
    super.key,
    required this.iconString,
    this.borderRadius,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final widgetBorderRadius = borderRadius ?? 10.r;
    final widgetWidth = width ?? 80.h;
    final widgetHeight = height ?? 80.h;
    return ClipRRect(
      borderRadius: BorderRadius.circular(widgetBorderRadius),
      child: Image.asset(iconString, width: widgetWidth, height: widgetHeight),
    );
  }
}
