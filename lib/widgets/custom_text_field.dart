import 'package:flutter/material.dart';

import '../screens/app/helper.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.hintText,
  });
final String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Help.getScreenWidth(context) - 70,
      height: 50,
      decoration: const ShapeDecoration(
        color: AppColor.placeholderBg,
        shape: StadiumBorder(),

      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColor.placeholder,
          ),
          contentPadding: const EdgeInsets.only(left: 40),
        ),
      ),
    );
  }
}