import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData prefixIcon;
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  const CustomTextField({
    super.key,
    this.obscureText = false,
    required this.prefixIcon,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.1,
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xff10172A),
            label: Text(
              label,
              style: TextStyle(color: Colors.grey.shade200),
            ),
            prefixIcon: Icon(
              prefixIcon,
              size: 15,
              color: Colors.white,
            ),
            // hintText: 'Bul...',
            contentPadding: EdgeInsets.zero,
            hintStyle: TextStyle(color: Colors.grey),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
