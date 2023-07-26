import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app/helper.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}


class _LaunchScreenState extends State<LaunchScreen> {

  getPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userName = preferences.get('username');
    var password  = preferences.get('password');
    print(userName);
    print(password);

    if (userName != null && password != null){
      Navigator.pushReplacementNamed(context, '/nav_bar_screen');
    }
    else {
      Navigator.pushReplacementNamed(context, '/landing_screen');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      getPrefs();
      // Navigator.pushReplacementNamed(context, '/landing_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Help.getScreenWidth(context),
        height: Help.getScreenHeight(context),
        child: Stack(
          children: [
            SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  Help.getAssetName('splashIcon'),
                  fit: BoxFit.fill,
                )),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(150),
                      child: Image.asset(
                        Help.getAssetName('image1'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    'Gaza Food',
                    style: GoogleFonts.kurale(
                        fontSize: 26,
                        color: const Color(0xFFFF6838),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
