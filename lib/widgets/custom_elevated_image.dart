import 'package:flutter/material.dart';

import '../screens/app/helper.dart';

class CustomElevatedImage extends StatelessWidget {
  const CustomElevatedImage({
    super.key, required this.image, required this.bgColor, required this.text, required this.width, required this.height,
  });
  final String image;
  final Color bgColor;
  final String text;
  final double width;
  final double height;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: Help.getScreenWidth(context)-70,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)),

        ),
        onPressed: (){},
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
                child: Image.asset(Help.getAssetName(image),height: height,width: width,)),
            Text(text,style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
