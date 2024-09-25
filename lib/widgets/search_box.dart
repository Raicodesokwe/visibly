import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFF1EDED), // White background
                    hintText: 'Search...', // Placeholder text
                    suffixIcon:SvgPicture.asset(searchIcon,fit: BoxFit.scaleDown), // Optional: Search icon
                    border: OutlineInputBorder(
                      borderRadius:const BorderRadius.all(Radius.circular(30)), // Border radius of 30
                      borderSide: BorderSide(color: AppColors.appDark.withOpacity(0.28)), // No visible border
                    ),
                    contentPadding:const EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Padding inside the search field
                  ),
                );
  }
}