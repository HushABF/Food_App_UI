import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/app/helper.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key, required this.icon, required this.text,
  });
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
      child: TextButton.icon(
          onPressed: () {},
          icon: ImageIcon(AssetImage(Help.getAssetName(icon))),
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              text,
              style:
              GoogleFonts.kurale(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            alignment: AlignmentDirectional.centerStart,
            fixedSize: const Size.fromWidth(500),
          )
      ),
    );
  }
}