import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 22,
    fontFamily: 'Domine',
    fontWeight: FontWeight.w600,
    color: AppColors.darkGreenColor,
  );
  static const TextStyle heading1Yellow = TextStyle(
    fontSize: 22,
    fontFamily: 'Domine',
    fontWeight: FontWeight.w600,
    color: AppColors.yellowColor,
  );
  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontFamily: 'Domine',
    fontWeight: FontWeight.w600,
    color: AppColors.darkGreenColor,
  );

  static const TextStyle bodyText1Bold = TextStyle(
    fontSize: 16,
    color: AppColors.darkGreenColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Lato',
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    color: AppColors.darkGreenColor,
    fontFamily: 'Lato',
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    color: AppColors.darkGreenColor,
    fontFamily: 'Lato',
  );

  static const TextStyle bodyText3 = TextStyle(
    fontSize: 12,
    color: AppColors.darkGreenColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Lato',
  );
  static const TextStyle bodyTextBig = TextStyle(
    fontSize: 32,
    fontFamily: 'Lato',
    color: AppColors.darkGreenColor,
  );
  static const TextStyle bodyTextBigYellow = TextStyle(
    fontSize: 32,
    fontFamily: 'Lato',
    color: AppColors.yellowColor,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.darkGreenColor,
    fontFamily: 'Lato',
  );
  static const TextStyle buttonTextLight = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.lightGreenColor,
    fontFamily: 'Lato',
  );
}
