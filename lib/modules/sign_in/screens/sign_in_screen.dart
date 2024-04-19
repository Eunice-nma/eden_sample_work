// ignore_for_file: use_build_context_synchronously

import 'package:dream_burger_sample_work/utils/components/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/components/app_button.dart';
import '../../../utils/text_styles.dart';
import '../../order/screens/order_details_screen.dart';
import '../viewmodel/sign_in_viewmodel.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                isLoading: signinController.isLoading,
                icon: 'assets/images/google_logo.png',
                ontap: () async {
                  bool signedIn = await signinController.signInWithGoogle();
                  if (signedIn) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderDetailsScreen(),
                      ),
                    );
                  } else {
                    final error = signinController.error;
                    if (error != null) {
                      showToast(context, error);
                    }
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
