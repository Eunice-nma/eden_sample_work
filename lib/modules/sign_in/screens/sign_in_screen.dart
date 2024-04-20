import 'package:dream_burger_sample_work/utils/components/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/components/app_button.dart';
import '../../../utils/text_styles.dart';
import '../../order/screens/order_details_screen.dart';
import '../viewmodel/sign_in_viewmodel.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  void handleSignin(bool signinResponse, BuildContext context) {
    if (signinResponse) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OrderDetailsScreen(),
        ),
      );
    } else {
      final error = Provider.of<SigninViewmodel>(context).error;
      if (error != null) {
        showToast(context, error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var signinController = Provider.of<SigninViewmodel>(context);
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
                      text: 'Taste the ',
                    ),
                    TextSpan(
                      text: 'Dreamy\n',
                      style: AppTextStyles.bodyTextBigYellow,
                    ),
                    TextSpan(
                      text: 'Delight',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              AppButton(
                'Sign in With Google',
                isLoading: signinController.isLoading,
                icon: 'assets/images/google_logo.png',
                ontap: () async {
                  bool signedIn = await signinController.signInWithGoogle();
                  if (context.mounted) {
                    handleSignin(signedIn, context);
                  }
                },
              ),
              const SizedBox(
                height: 12,
              ),
              AppButton(
                'Sign in With Github',
                icon: 'assets/images/github_logo.png',
                isSecondary: true,
                ontap: () async {
                  bool signedIn = await signinController.signInWithGithub();
                  if (context.mounted) {
                    handleSignin(signedIn, context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
