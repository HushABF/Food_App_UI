import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_container.dart';
import 'helper.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<String> items = [
    'Gaza',
    'Rafah',
    'Nusairat',
  ];

  String? selectedValue;
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            Help.getAssetName('threeLines'),
                            height: 30,
                            width: 30,
                          )),
                      Row(
                        children: [
                          Image.asset(
                            Help.getAssetName('location'),
                            width: 30,
                            height: 30,
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: Text(
                                'Current Location',
                                style: GoogleFonts.raleway(
                                  fontSize: 12,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: items
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.only(right: 0),
                                height: 40,
                                width: 100,
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                              ),
                              iconStyleData: IconStyleData(
                                icon: Image.asset(
                                  Help.getAssetName('arrow'),
                                  width: 15,
                                  height: 15,
                                ),
                              ),
                              dropdownStyleData: DropdownStyleData(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14))),
                            ),
                          )
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            Help.getAssetName('bell'),
                            height: 25,
                            width: 25,
                          )),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          // width: 190,
                          child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text(
                                    'Find Food Around',
                                    style: GoogleFonts.kurale(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: 'Your ',
                                          style: GoogleFonts.kurale(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.primary),
                                          children: [
                                        TextSpan(
                                            text: 'Area',
                                            style: GoogleFonts.kurale(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    const Color(0xFFFF6838)))
                                      ])),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isSelected = 0;
                                    });
                                  },
                                  style: TextButton.styleFrom(
                                      foregroundColor: isSelected ==0? Colors.white:Colors.black,
                                      backgroundColor: isSelected ==0? AppColor.orange:Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),),
                                  child: Text(
                                    "Nearby Restaurant",
                                    style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),),
                              const SizedBox(width: 20,),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    isSelected = 1;
                                  });
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: isSelected ==1? Colors.white:Colors.black,
                                  backgroundColor: isSelected ==1? AppColor.orange:Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(20)),
                                  padding: const EdgeInsets.symmetric(horizontal: 45,vertical: 17),),
                                child: Text(
                                  "Favourite",
                                  style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),)
                            ],
                          ),
                        ),
                        Visibility(
                          visible:isSelected == 0 ,
                          replacement:
                          const Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              physics: BouncingScrollPhysics(),
                              child:  Column(
                                children: [

                                  CustomContainer(
                                    image: 'burgers2',
                                    mainText: "Mac Burger",
                                    subText: 'Burgers - Fast Food',
                                    rating: ' 4.7',
                                    time: '10 min',
                                    marginBottom: 10,
                                  ),
                                  CustomContainer(
                                    image: 'burgers',
                                    mainText: "Chill ox Burger",
                                    subText: 'Burgers - Fast Food',
                                    rating: ' 4.9',
                                    time: '10 min',
                                    marginBottom: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          child: const Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              physics: BouncingScrollPhysics(),
                              child:  Column(
                                children: [
                                  CustomContainer(
                                    image: 'burgers',
                                    mainText: "Chill ox Burger",
                                    subText: 'Burgers - Fast Food',
                                    rating: ' 4.9',
                                    time: '10 min',
                                    marginBottom: 10,
                                  ),
                                  CustomContainer(
                                    image: 'burgers2',
                                    mainText: "Mac Burger",
                                    subText: 'Burgers - Fast Food',
                                    rating: ' 4.7',
                                    time: '10 min',
                                    marginBottom: 10,
                                  ),
                                  CustomContainer(
                                    image: 'burgers2',
                                    mainText: "Mac Burger",
                                    subText: 'Burgers - Fast Food',
                                    rating: ' 4.7',
                                    time: '10 min',
                                    marginBottom: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),



                      ],
                    ),
                  ),

                ]))));
  }
}
