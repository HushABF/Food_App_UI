import 'package:flutter/material.dart';
import 'package:food_app/screens/app/helper.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_elevated.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Help.getScreenWidth(context),
        height: Help.getScreenHeight(context),
        decoration: const BoxDecoration(
          color: Color(0xFF302F3C),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(120),
                child: Image.asset(
                  Help.getAssetName('image3'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            RichText(
                text: TextSpan(
                    text: 'Welcome to ',
                    style: GoogleFonts.kurale(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    children: [
                      TextSpan(
                          text: 'Gaza Food',
                          style: GoogleFonts.kurale(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFFF6838)))
                    ])),
            Text(
              'Enjoy your food journey with us',
              style: GoogleFonts.raleway(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(
              height: 100,
            ),
             CustomElevatedButton(title: 'Create an Account', textColor: const Color(0xFFFF6838), buttonColor: Colors.white, onPressed: () {Navigator.pushReplacementNamed(context, '/signup_screen');  },),
            const SizedBox(height: 20,),
             CustomElevatedButton(title: 'Log In', textColor: Colors.white, buttonColor: const Color(0xFFFF6838), onPressed: () { Navigator.pushReplacementNamed(context, '/login_screen'); },),
          ],
        ),
      ),
    );
  }
}


