import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    super.key,  this.marginEnd=0, required this.isSelected,
  });
  final double marginEnd;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      width: 16,
      height: 4,
      decoration: BoxDecoration(
        color: isSelected? Colors.orange:Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
