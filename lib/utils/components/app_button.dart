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
  });
  final String text;
  final Function ontap;
  final String? icon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ontap(),
      child: Container(
        width: double.infinity,
        height: 64,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
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
                        style: AppTextStyles.buttonText,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
