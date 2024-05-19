import 'package:billminder/utils/color_pallette.dart';
import 'package:billminder/utils/size_utils.dart';
import 'package:flutter/material.dart';

class BillNotesTextField extends StatelessWidget {
  final String hintText;
  final String label;
  final TextEditingController controllerName;
  final TextInputAction textInputAction;
  final bool isPassword;
  final bool isRequired;
  final int? maxLines; // New property to specify the maximum number of lines

  BillNotesTextField({
    required this.label,
    required this.controllerName,
    required this.textInputAction,
    required this.hintText,
    this.isPassword = false, // Default to false if not provided
    this.isRequired = false,
    this.maxLines, // Initialize maxLines
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: ph(context, 45),
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
                    color: Colors.red, // Asterisk color
                  ),
                ),
              ] : [],
            ),
          ),
          Container(
            height: ph(context, 12),
            decoration: BoxDecoration(
              color: Pallette.billminder_bill_textfield,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              controller: controllerName,
              maxLines: maxLines, // Set maxLines property
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
