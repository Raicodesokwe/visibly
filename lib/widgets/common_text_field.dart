import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChanged;
  final bool? obscureText;
  final String? Function(String?)? validator;
  const CommonTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.validator,
     this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText?? false,
      onChanged: onChanged,
      validator: validator,cursorColor: Colors.white70,
      style: const TextStyle(color: Colors.white70),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFD9D9D9).withOpacity(0.28), // greyish
            hintText: hintText, // Placeholder text
           
            hintStyle:const TextStyle(
              color: Colors.white70
            ),
            border: OutlineInputBorder(
              borderRadius:const BorderRadius.all(Radius.circular(8)), // Border radius of 8
              borderSide: BorderSide(color: Colors.black.withOpacity(0.1),width: 1), // No visible border
            ),
             enabledBorder: OutlineInputBorder(
              borderRadius:const BorderRadius.all(Radius.circular(8)), // Border radius of 8
              borderSide: BorderSide(color: Colors.black.withOpacity(0.1),width: 1), // No visible border
            ),
            focusedBorder:const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)), // Border radius of 8
              borderSide: BorderSide(color: AppColors.appDark,width: 1), // No visible border
            ),
            contentPadding:const EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Padding inside the search field
          ),
        );
  }
}