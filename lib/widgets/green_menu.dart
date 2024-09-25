import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/common_functions.dart';
import '../utils/constants.dart';

class GreenMenu extends StatelessWidget {
  final String icon;
  final String label;
  const GreenMenu({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  screenWidth(context) * 0.43,
      height:  screenHeight(context) * 0.135,
      decoration: BoxDecoration(
        color: AppColors.appGreen,
        borderRadius: BorderRadius.circular(25)
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: screenWidth(context) * .04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight(context) * .013,
            ),
            Container(
              height: 53,
              width: 53,
              decoration:const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.appDark
              ),
              child: SvgPicture.asset(icon,fit: BoxFit.scaleDown,),
            ),
              SizedBox(
              height: screenHeight(context) * .01,
            ),
            Text(label,style: TextStyle(color: AppColors.appDark,fontWeight: FontWeight.w700,
            fontSize: screenWidth(context) * 0.036),)
    
          ],
        ),
      ),
    );
  }
}

