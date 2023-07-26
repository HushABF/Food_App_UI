import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/app/helper.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({
    super.key, required this.image, required this.text,  this.marginRight =0,  this.bgColor = AppColor.orange,  this.textColor = Colors.white,
  });
  final String image;
  final String text;
  final double marginRight;
  final Color bgColor;
  final Color textColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.only(right: marginRight),
      width: 100,
      // height: 60,

      decoration: ShapeDecoration(
          color: bgColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
      ),
      child: SizedBox(

        height: 60,
        child: Row(
          children: [
            Image.asset(Help.getAssetName(image),height: 40,width: 40,),
            Text(text,style: GoogleFonts.nunito(fontSize: 14,fontWeight: FontWeight.bold,color: textColor),)


          ],
        ),
      ),

    );
  }
}