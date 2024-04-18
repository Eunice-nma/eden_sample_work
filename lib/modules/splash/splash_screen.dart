import 'dart:async';

import 'package:dream_burger_sample_work/modules/sign_in/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 1800),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const SignInScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/burger.png',
              height: 250,
              width: 300,
            ),
            const SizedBox(
              height: 16,
            ),
            SvgPicture.asset(
              'assets/images/logo.svg',
            ),
          ],
        ),
      ),
    );
  }
}
