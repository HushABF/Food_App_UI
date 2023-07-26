import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/app/helper.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.image,
    required this.mainText,
    required this.subText,
    required this.rating,
    required this.time,
    this.marginBottom = 0,
  });
  final String image;
  final String mainText;
  final String subText;
  final String rating;
  final String time;
  final double marginBottom;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(spreadRadius: 1, color: Colors.grey.shade100)],
          borderRadius: BorderRadius.circular(30)),

      width: double.infinity,
      height: 270,
      //change to some kind of builder
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            child: SizedBox.fromSize(
              size: const Size.fromHeight(150),
              child: Image.asset(
                Help.getAssetName(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mainText,
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold, fontSize: 18,height: 1),
                    ),
                    Text(
                      subText,
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w200,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'routeName');
                        },
                        icon: Image.asset(Help.getAssetName('rightArrow')))
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Help.getAssetName('orangeStar'),
                          height: 20,
                          width: 20,
                        ),
                        Text(rating)
                      ],
                    ),
                    Text(
                      time,
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w200,
                          fontSize: 13,
                          color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
