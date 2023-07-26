import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/app/helper.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key, required this.image, required this.subTitle, required this.title1, required this.title2,
  });
  final String image;
  final String title1;
  final String title2;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(170),
              child: Image.asset(
                Help.getAssetName(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          RichText(
              text: TextSpan(
                  text: title1,
                  style: GoogleFonts.kurale(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primary),
                  children: [
                    TextSpan(
                        text: title2,
                        style: GoogleFonts.kurale(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFFF6838)))
                  ])),
          Text(
            subTitle,
            style: GoogleFonts.raleway(fontSize: 16, color: AppColor.placeholder),
          ),
        ],
      ),
    );
  }
}