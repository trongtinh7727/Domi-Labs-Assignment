import 'package:domi/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextstyle {
  static final mobileHeadingH1 = TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary);
  static final desktopBodyB4 = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary);
  static final mobileBodyB4 = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.textSecondary);
  static final mobileBodyB3 = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.textTertiary);
  static final mobileBodyB2 = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary);
}
