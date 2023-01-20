import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onpressed;
  RoundedButton({required this.iconData,required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(iconData),
      shape:CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      onPressed:onpressed,
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
