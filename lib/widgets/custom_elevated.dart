import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/app/helper.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key, required this.title, required this.textColor, required this.buttonColor, required this.onPressed,
  });
  final String title;
  final Color textColor;
  final Color buttonColor;
  final void Function() onPressed;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Help.getScreenWidth(context) - 50,
      height: 70,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)),
            backgroundColor: buttonColor),

        onPressed: onPressed,
        child: Text(title,style: GoogleFonts.raleway(color: textColor,fontSize: 18,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
