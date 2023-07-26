import 'package:flutter/material.dart';
import 'package:food_app/screens/app/nav_bar_screen.dart';
import 'package:food_app/screens/core/landing_screen.dart';
import 'package:food_app/screens/core/launch_screen.dart';
import 'package:food_app/screens/core/login_screen.dart';
import 'package:food_app/screens/core/signup_screen.dart';
import 'package:food_app/screens/outBoarding/out_boarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen' ,
      routes: {
        '/launch_screen' : (context) => const LaunchScreen(),
        '/landing_screen': (context) => const LandingScreen(),
        '/out_boarding_screen': (context) => const OutBoardingScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/signup_screen': (context) => const SignUpScreen(),
        '/nav_bar_screen': (context) => const NavBarScreen(),
      },

    );
  }
}