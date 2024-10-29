import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stripe_payment_flutter/pages/profile_page.dart';
import 'firebase_options.dart';
import 'package:stripe_payment_flutter/pages/home_page.dart';
import 'package:stripe_payment_flutter/pages/login_page.dart';
import 'package:stripe_payment_flutter/pages/onboarding_pages.dart';

import 'package:stripe_payment_flutter/pages/register_page.dart';
import 'package:stripe_payment_flutter/pages/spalsh_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  await dotenv.load(fileName: ".env");
  Stripe.publishableKey=dotenv.env["STRIPE_PUBLISH_KEY"]!;
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stripe Payment Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
    routes: {
      
      '/':(context) =>SpalshPage(),
      '/onboard':(Context)=>OnboardingPage(),
      '/login':(Context)=>LoginPage(),
      '/register': (context) => RegistrationPage(),
      '/home': (context) => HomePage(),
      '/profile':(context)=>ProfilePage(),
      
      
      

    },
    );
  }
}