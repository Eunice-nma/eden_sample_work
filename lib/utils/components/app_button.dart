import 'package:flutter/material.dart';

import '../colors.dart';
import '../text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton(
    this.text, {
    super.key,
    required this.ontap,
    this.icon,
    this.isSecondary = false,
  });
  final String text;
  final Function ontap;
  final String? icon;
  final bool isSecondary;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ontap(),
      child: Container(
        width: double.infinity,
        height: 64,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSecondary ? AppColors.white : AppColors.greenColor,
          borderRadius: BorderRadius.circular(24),
          border: isSecondary
              ? Border.all(
                  width: 0.3,
                  color: AppColors.greenColor.withOpacity(0.3),
                )
              : null,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) Image.asset(icon!),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Text(
                  text,
                  style: isSecondary
                      ? AppTextStyles.buttonText
                      : AppTextStyles.buttonTextLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
