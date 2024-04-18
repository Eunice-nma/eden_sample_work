import 'package:flutter/material.dart';

import '../colors.dart';

class AppStepperDotIcon extends StatelessWidget {
  const AppStepperDotIcon(
    this.active, {
    super.key,
  });
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: active ? AppColors.yellowColor : AppColors.lightGreenColor),
      child: active
          ? const Center(
              child: Icon(Icons.fastfood_rounded, color: AppColors.white))
          : null,
    );
  }
}
