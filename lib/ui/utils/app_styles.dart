
import 'package:flutter/material.dart';
import 'package:flutter_basics_c17/ui/utils/app_colors.dart';

abstract final class AppStyles{
  static const white40Thick = TextStyle(
    color: AppColors.white,
    fontSize: 40,
    fontWeight: FontWeight.w900,
  );
  static const white36Bold = TextStyle(
    color: AppColors.white,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );
  static const black32SemiBold = TextStyle(
    color: AppColors.black,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );
  static const white24Medium = TextStyle(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
}