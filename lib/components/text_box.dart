import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  const MyTextBox({
    super.key,
    required this.text,
    required this.sectionName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 236, 236, 236),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.only(top: 10,left: 15, bottom: 15),
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // section name
              Text(
                sectionName,
                style: TextStyle(color: Color.fromARGB(255, 166, 166, 166)),
              ),
            ],
          ),
          Text(text),
        ],
      ),
    );
  }
}