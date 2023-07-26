import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/app/helper.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TapGestureRecognizer _tapGestureRecognizer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = signInFunction;
  }
  void signInFunction() {
    Navigator.pushReplacementNamed(context, '/login_screen');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tapGestureRecognizer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SizedBox(
        width: Help.getScreenWidth(context),
        height: Help.getScreenHeight(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Column(
              children: [
                Text('Sign Up',style: GoogleFonts.nunito(fontSize: 25),),
                const Spacer(),
                const CustomTextField(hintText: 'Name',),
                const Spacer(),
                const CustomTextField(hintText: 'Email',),
                const Spacer(),
                const CustomTextField(hintText: 'Mobile No.',),
                const Spacer(),
                const CustomTextField(hintText: 'Address',),
                const Spacer(),
                const CustomTextField(hintText: 'Password',),
                const Spacer(),
                const CustomTextField(hintText: 'ConfirmPassword',),
                const Spacer(),
                SizedBox(
                  width: Help.getScreenWidth(context) - 70,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.orange,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
                    ),
                    onPressed: (){},
                    child: Text("Sign Up",style: GoogleFonts.nunito(),),
                  ),),
                const Spacer(),
                RichText(
                    text: TextSpan(
                        text: "Already have an Account? ",
                        style: GoogleFonts.nunito(
                          color: Colors.grey.shade700,
                        ),
                        children: [
                          TextSpan(
                              recognizer: _tapGestureRecognizer,
                              text: "Sign In.",
                              style: GoogleFonts.nunito(
                                  color: AppColor.orange,
                                  fontWeight: FontWeight.bold)),
                        ])),



              ],
            ),
          ),
        ),
      ),
    );
  }
}


