import 'package:flutter/material.dart';
import 'package:food_app/screens/app/helper.dart';
import 'package:food_app/widgets/home_section.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> items = [
    'Gaza',
    'Rafah',
    'Nusairat',
  ];

  String? selectedValue;

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
                            .map((String item) => DropdownMenuItem<String>(
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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 100,
                          // width: 190,
                          child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text(
                                    'What do you',
                                    style: GoogleFonts.kurale(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: 'Want for ',
                                          style: GoogleFonts.kurale(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.primary),
                                          children: [
                                        TextSpan(
                                            text: 'Dinner',
                                            style: GoogleFonts.kurale(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xFFFF6838)))
                                      ])),
                                ],
                              )),
                        ),
                      ],
                    ),
                    Container(
                      height: 70,
                      width: double.infinity,
                      decoration: const ShapeDecoration(
                        shape: StadiumBorder(),
                        color: AppColor.placeholderBg,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Help.getScreenWidth(context) - 88,
                            child: const TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.search),
                                  hintText: 'Search food',
                                  hintStyle: TextStyle(
                                    color: AppColor.placeholder,
                                    fontSize: 14,
                                  ),
                                  contentPadding: EdgeInsets.only(top: 15)),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                Help.getAssetName('filter'),
                                height: 25,
                                width: 25,
                              )),
                        ],
                      ),
                    ),
                    HomeSection(title: 'Categories', onPressed: () {}),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      // padding: const EdgeInsets.only(right: ),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            //try to change it to buttons to change color
                            const CustomItem(
                              image: 'burgerImage',
                              text: 'Burger',
                              marginRight: 10,
                            ),
                            CustomItem(
                              image: 'pizza',
                              text: 'Pizza',
                              marginRight: 10,
                              bgColor: Colors.grey.shade100,
                              textColor: Colors.black,
                            ),
                            CustomItem(
                              image: 'salad',
                              text: 'Salad',
                              marginRight: 10,
                              bgColor: Colors.grey.shade100,
                              textColor: Colors.black,
                            ),
                            CustomItem(
                              image: 'donut',
                              text: 'Donut',
                              marginRight: 10,
                              bgColor: Colors.grey.shade100,
                              textColor: Colors.black,
                            ),
                            CustomItem(
                              image: 'sushi',
                              text: 'Sushi',
                              bgColor: Colors.grey.shade100,
                              textColor: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    HomeSection(title: 'Popular', onPressed: () {}),
                    const CustomContainer(
                      image: 'burgers',
                      mainText: "Chill ox Burger",
                      subText: 'Burgers - Fast Food',
                      rating: ' 4.9',
                      time: '10 min',
                      marginBottom: 10,
                    ),
                    const CustomContainer(
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
          ]),
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //
      //   currentIndex: _currentIndex,
      //   onTap: (int value) {
      //     setState(() {
      //       _currentIndex = value;
      //     });
      //   },
      //   type: BottomNavigationBarType.fixed,
      //   elevation: 0,
      //   selectedItemColor: Colors.orange,
      //   unselectedItemColor: Colors.grey,
      //   selectedFontSize: 14,
      //   unselectedFontSize: 14,
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   items: [
      //     BottomNavigationBarItem(
      //       label: '',
      //       activeIcon:ImageIcon( AssetImage(Help.getAssetName('homeNav'))),
      //       icon:ImageIcon( AssetImage(Help.getAssetName('homeNav'))) ,
      //       // backgroundColor: Colors.black,
      //     ),
      //     BottomNavigationBarItem(
      //       label: '',
      //       activeIcon:ImageIcon( AssetImage(Help.getAssetName('starNav'))),
      //       icon:ImageIcon( AssetImage(Help.getAssetName('starNav'))) ,
      //     ),
      //     BottomNavigationBarItem(
      //       label: '',
      //       activeIcon:ImageIcon( AssetImage(Help.getAssetName('cartNav'))),
      //       icon:ImageIcon( AssetImage(Help.getAssetName('cartNav'))) ,
      //     ),
      //     BottomNavigationBarItem(
      //       label: '',
      //       activeIcon:ImageIcon( AssetImage(Help.getAssetName('profileNav'))),
      //       icon:ImageIcon( AssetImage(Help.getAssetName('profileNav'))) ,
      //     ),
      //   ],
      // ),
    );
  }
}
