import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;


  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        style: const TextStyle(
          color: Colors.white),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          ),
          fillColor: Color.fromRGBO(18, 43, 29, 1),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white
          )
          
        ),
      ),
    );
  }
}