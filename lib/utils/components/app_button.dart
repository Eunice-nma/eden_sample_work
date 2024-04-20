import 'package:flutter/material.dart';

import '../colors.dart';
import '../text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton(
    this.text, {
    super.key,
    required this.ontap,
    this.icon,
    this.isLoading = false,
    this.isSecondary = false,
  });
  final String text;
  final Function ontap;
  final String? icon;
  final bool isLoading;
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
          color: isSecondary ? AppColors.greenColor : AppColors.white,
          borderRadius: BorderRadius.circular(24),
          border: isSecondary
              ? null
              : Border.all(
                  width: 0.3,
                  color: AppColors.greenColor.withOpacity(0.3),
                ),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: AppColors.yellowColor,
                )
              : Row(
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
                            ? AppTextStyles.buttonTextLight
                            : AppTextStyles.buttonText,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
