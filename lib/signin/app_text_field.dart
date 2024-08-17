import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {

  final String label;
  final bool obscureText;

  const AppTextField({
    super.key,
    required this.label,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.black26,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
