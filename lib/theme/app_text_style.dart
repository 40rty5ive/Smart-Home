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
}
