import 'package:billminder/utils/color_pallette.dart';
import 'package:flutter/material.dart';

class BillTextField extends StatelessWidget {
  final String hintText;
  final String label;
  final TextEditingController controllerName;
  final TextInputAction textInputAction;
  final bool isPassword;
  final bool isRequired;
  final String value;
  
  BillTextField({
    required this.label,
    required this.controllerName,
    required this.textInputAction,
    required this.hintText,
    this.isPassword = false, // Default to false if not provided
    this.isRequired = false,
    this.value = ''
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
          RichText(
            text: TextSpan(
              text: label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black, // Adjust this if you use a different text color
              ),
              children: isRequired ? [
                const TextSpan(
                  text: ' *',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Asterisk color
                  ),
                ),
              ] : [],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Pallette.billminder_bill_textfield,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              //initialValue: "Text",
              obscureText: isPassword, // Use isPassword to determine if text should be obscured
              textInputAction: textInputAction,
              //controller: controllerName,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: height * .02,
                  fontWeight: FontWeight.w300,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0), // Add padding here
              ),
              // validator: (value) {
              //       if (value == null || value.isEmpty) {
              //         return 'Please enter this value';
              //       }
              //       return null;
              //     },
            ),
          ),
        ],
      ),
    );
  }
}
