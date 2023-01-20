import 'package:flutter/material.dart';
import 'constants.dart';
class BottomWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonTitle;
  BottomWidget({ required this.onTap, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(buttonTitle,style: labelTextStyle,),
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          color: const Color(0xFFEB1555),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}