import 'package:billminder/utils/color_pallette.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String label;
  final TextEditingController controllerName;
  final TextInputAction textInputAction;
  final bool isPassword;

  CustomTextField({
    required this.label,
    required this.controllerName,
    required this.textInputAction,
    required this.hintText,
    this.isPassword = false, // Default to false if not provided
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * .1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Pallette.billminder_primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              obscureText: isPassword, // Use isPassword to determine if text should be obscured
              textInputAction: textInputAction,
              controller: controllerName,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: height * .02,
                  fontWeight: FontWeight.w300,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Add padding here
              ),
            ),
          ),
        ],
      ),
    );
  }
}
