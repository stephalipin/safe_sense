import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final Function()? onTap;
  final String text;

  const Button({
    super.key, 
    required this.onTap, 
    required this.text,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(9),
        margin: EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          color: Color.fromRGBO(237,237,232,1.000),
          borderRadius: BorderRadius.circular(24)
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromRGBO(18,43,29,1.000),
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}