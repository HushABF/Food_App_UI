import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/app/helper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/custom_elevated_image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passController;
  late TapGestureRecognizer _tapGestureRecognizer;

  bool _obscure = true;
  String? _emailErrorValue;
  String? _passErrorValue;

  savePrefs() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('username', _emailController.text);
    preferences.setString('password', _passController.text);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = createAccountFunction;
  }

  void createAccountFunction() {
    Navigator.pushReplacementNamed(context, '/signup_screen');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passController.dispose();
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SizedBox(
          height: Help.getScreenHeight(context),
          width: Help.getScreenWidth(context),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Login',
                    style: GoogleFonts.nunito(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: Help.getScreenWidth(context) - 70,
                    child: TextField(
                      controller: _emailController,
                      maxLines: 1,
                      minLines: 1,
                      expands: false,
                      style: GoogleFonts.nunito(),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 40,
                      decoration: InputDecoration(
                        constraints: BoxConstraints(
                          maxHeight: _emailErrorValue == null ? 50 : 70,
                          minHeight: 50,
                        ),
                        contentPadding: const EdgeInsets.only(left: 40),
                        counterText: '',
                        labelText: 'Email',
                        labelStyle:
                            GoogleFonts.nunito(color: AppColor.placeholder),
                        floatingLabelStyle: GoogleFonts.nunito(),
                        fillColor: AppColor.placeholderBg,
                        filled: true,
                        errorText: _emailErrorValue,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 2,
                            )),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.grey.shade200,
                              width: 2,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2,
                            )),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: Help.getScreenWidth(context) - 70,
                    child: TextField(
                      controller: _passController,
                      obscureText: _obscure,
                      maxLines: 1,
                      minLines: 1,
                      expands: false,
                      style: GoogleFonts.nunito(),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle:
                            GoogleFonts.nunito(color: AppColor.placeholder),
                        floatingLabelStyle: GoogleFonts.nunito(),
                        constraints: BoxConstraints(
                            maxHeight: _passErrorValue == null ? 50 : 70),
                        fillColor: AppColor.placeholderBg,
                        filled: true,
                        contentPadding: const EdgeInsets.only(left: 40),
                        errorText: _passErrorValue,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscure = !_obscure;
                            });
                          },
                          icon: Icon((_obscure
                              ? Icons.visibility_off
                              : Icons.visibility)),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 2,
                            )),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.grey.shade200,
                              width: 2,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2,
                            )),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: Help.getScreenWidth(context) - 70,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          backgroundColor: AppColor.orange),
                      onPressed: () => performLogin(),
                      child: Text(
                        'Login',
                        style: GoogleFonts.raleway(
                            color: AppColor.placeholderBg,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'or Login with',
                    style: GoogleFonts.nunito(color: AppColor.placeholder),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomElevatedImage(
                    image: 'imagefb',
                    bgColor: Colors.blue,
                    text: 'Login with Facebook',
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomElevatedImage(
                    image: 'imagegoogle',
                    bgColor: Color(0xFFDD4B39),
                    text: '   Login with Google',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "Don't Have an Account? ",
                          style: GoogleFonts.nunito(
                            color: Colors.grey.shade700,
                          ),
                          children: [
                        TextSpan(
                            recognizer: _tapGestureRecognizer,
                            text: "Create Now.",
                            style: GoogleFonts.nunito(
                                color: AppColor.orange,
                                fontWeight: FontWeight.bold)),
                      ])),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void performLogin() {
    if (checkData()) {
      login();
      state();
    }
  }

  bool checkData() {
    if (_emailController.text.isNotEmpty && _passController.text.isNotEmpty) {
      state();
      return true;
    }
    state();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        "ENTER REQUIRED DATA",
      ),
      backgroundColor: Colors.red,
      elevation: 5,
      duration: Duration(seconds: 2),
      dismissDirection: DismissDirection.horizontal,
    ));
    return false;
  }

  void state() {
    setState(() {
      _emailErrorValue = _emailController.text.isEmpty ? "Enter Email" : null;
      _passErrorValue = _passController.text.isEmpty ? "Enter Password" : null;
    });
  }

  void login() {
    savePrefs();
    Navigator.pushReplacementNamed(context, '/out_boarding_screen');
  }
}
