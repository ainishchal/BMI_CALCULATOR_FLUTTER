import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableWidget extends StatelessWidget {
  ReusableWidget({required this.icon,required this.label});
  final IconData icon;
  final String label;



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Icon(
            icon,
            color: Colors.white,

            size: 50.0
        ),

        Text(label,style:labelTextStyle,)
      ],
    );
  }
}
