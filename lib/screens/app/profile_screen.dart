import 'package:flutter/material.dart';
import 'package:food_app/screens/app/helper.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_text_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final double coverHeight = 230;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor:Colors.white ,
          onPressed: () {},
          child: ImageIcon(AssetImage(Help.getAssetName('leaveProfile')),color: Colors.black,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: SafeArea(
            child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: bottom),
                  color: Colors.grey,
                  child: Image.asset(
                    Help.getAssetName('bgProfile2'),
                    width: double.infinity,
                    height: coverHeight,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: top,
                  child: CircleAvatar(
                    radius: profileHeight / 2,
                    backgroundColor: Colors.grey.shade800,
                    backgroundImage: AssetImage(
                      Help.getAssetName('bgProfile'),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Ahmed Alhaj',
              style: GoogleFonts.kurale(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            const CustomTextButton(
              icon: 'settingsProfile',
              text: 'Profile Settings',
            ),
            const CustomTextButton(
              icon: 'locationProfile',
              text: 'Locations',
            ),
            const CustomTextButton(
              icon: 'paymentProfile',
              text: 'Payment',
            ),
            const CustomTextButton(
              icon: 'historyProfile',
              text: 'History',
            ),
            const CustomTextButton(
              icon: 'notifProfile',
              text: 'Notification',
            ),
          ],
        )));
  }
}
