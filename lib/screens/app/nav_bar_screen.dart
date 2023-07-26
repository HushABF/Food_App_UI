import 'package:flutter/material.dart';
import 'package:food_app/screens/app/profile_screen.dart';

import 'cart_screen.dart';
import 'favorite_screen.dart';
import 'helper.dart';
import 'home_screen.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  final screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    const ProfileScreen()

  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: screens[_currentIndex],
      bottomNavigationBar:  NavigationBarTheme(
        data: const NavigationBarThemeData(
          indicatorColor: AppColor.orange,
          indicatorShape: CircleBorder(),
        ),

        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          onDestinationSelected: (int value) => setState(() {
            _currentIndex = value;
          }),
          elevation: 0,
          backgroundColor: Colors.white,
          height: 60,
          selectedIndex: _currentIndex,
          destinations: [
            NavigationDestination(icon: ImageIcon( AssetImage(Help.getAssetName('homeNav'))), label: ''),
            NavigationDestination(icon: ImageIcon( AssetImage(Help.getAssetName('starNav'))), label: ''),
            NavigationDestination(icon: ImageIcon( AssetImage(Help.getAssetName('cartNav'))), label: ''),
            NavigationDestination(icon: ImageIcon( AssetImage(Help.getAssetName('profileNav'))), label: ''),
          ],
        ),
      ),
    );
  }
}
