import 'package:flutter/material.dart';
import 'package:food_app/widgets/custom_indicator.dart';
import 'package:food_app/widgets/custom_page_view.dart';
import 'package:google_fonts/google_fonts.dart';


import '../app/helper.dart';


class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({super.key});

  @override
  State<OutBoardingScreen> createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  int _currentPage = 0;

  @override

// find your Taste
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          SizedBox(
            height: 600,
              child: PageView(
            physics: const BouncingScrollPhysics(),

            onPageChanged: (int value){
              setState(() {
                _currentPage = value;
              });
            },
            scrollDirection: Axis.horizontal,
            children: const [
              CustomPageView(image: 'imagePage1', subTitle: 'Order from your favourite restaurants', title1:'Find your ' , title2:'Delight' ),
              CustomPageView(image: 'imagePage2', subTitle:'Order anytime from your favourite restaurants', title1: 'Order ' , title2:'Perfection' ),
            ],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIndicator(isSelected: _currentPage == 0, marginEnd: 10,),
              CustomIndicator(isSelected: _currentPage == 1),
            ],
          ),
          const SizedBox(height: 30,),
          Visibility(
            visible: _currentPage == 1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.orange,
                minimumSize:  const Size( 180, 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
                onPressed: (){
                Navigator.pushReplacementNamed(context, '/nav_bar_screen');
                }, child: Text('Get Started',style: GoogleFonts.raleway(fontSize: 18,fontWeight: FontWeight.bold),)),
          )
        ],
      ),
    );
  }
}


