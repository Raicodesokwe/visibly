import 'package:flutter/material.dart';

import '../utils/common_functions.dart';
import '../utils/constants.dart';

class CommonButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? fontSize;
  final String? label;
  final Color? color;
  final Color? fontColor;
  const CommonButton({
    super.key,
     this.height,
     this.width,
     this.fontSize,
     this.label,
     this.color,
     this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:height?? 50,
      width:width?? screenWidth(context) * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color??AppColors.appGreen
      ),
      child: Center(
        child: Text(label??'Get Started',style: TextStyle(
          color: fontColor??AppColors.appDark,
          fontWeight: FontWeight.w700,
          fontSize:fontSize?? 16
        ),),
      ),
    );
  }
}