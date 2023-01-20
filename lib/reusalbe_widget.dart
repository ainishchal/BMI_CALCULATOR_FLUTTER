import 'package:flutter/material.dart';

class Reuse_container extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  const Reuse_container({ @required this.colour= const Color(0xFF1D1E33), required this.cardChild});
  @override
  Widget build(BuildContext context) {
    return Container(

      child: cardChild,
      margin: const EdgeInsets.all(10.0),
      height: 200.0,
      width: 170.0,
      decoration: BoxDecoration(
          color: colour,
          borderRadius:BorderRadius.circular(10.0)
      ),
    );
  }
}
