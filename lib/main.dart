import 'package:dream_burger_sample_work/modules/order/viewmodel/order_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modules/sign_in/viewmodel/sign_in_viewmodel.dart';
import 'modules/splash/splash_screen.dart';
import 'services/ably.dart';
import 'utils/colors.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AblyService();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SigninViewmodel()),
        ChangeNotifierProvider(create: (_) => OrderViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.lightYellowColor,
      ),
      home: const SplashScreen(),
    );
  }
}
