import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTextStyle {
  static const TextStyle mainText = TextStyle(
    color: AppColors.mainGray,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle smallMainText = TextStyle(
    color: AppColors.mainGray,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle microMainText = TextStyle(
    color: AppColors.mainGray,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle microLightGrayMainText = TextStyle(
    color: AppColors.mainLightGray,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle mediumWhiteText = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle mediumLightGrayText = TextStyle(
    color: AppColors.mainLightGray,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
