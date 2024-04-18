import 'package:flutter/material.dart';

import '../../../utils/components/app_button.dart';
import '../../../utils/text_styles.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/burger.png',
              ),
              const SizedBox(
                height: 16,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: AppTextStyles.bodyTextBig,
                  children: [
                    TextSpan(
                      text: 'Join the ',
                    ),
                    TextSpan(
                      text: 'Dream \n',
                      style: AppTextStyles.bodyTextBigYellow,
                    ),
                    TextSpan(
                      text: 'Team',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              AppButton(
                'Sign in With Google',
                ontap: () {},
                icon: 'assets/images/google_logo.png',
                isSecondary: true,
              ),
              const SizedBox(
                height: 12,
              ),
              AppButton(
                'Sign in With GitHub',
                ontap: () {},
                icon: 'assets/images/github_logo.png',
              )
            ],
          ),
        ),
      ),
    );
  }
}
