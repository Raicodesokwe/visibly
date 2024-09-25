import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/common_functions.dart';
import '../utils/constants.dart';

class CertCheck extends StatelessWidget {
  const CertCheck({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: screenHeight(context)*0.3,
          width: screenWidth(context) * 0.43,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.appDark
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.05),
            child: SvgPicture.asset(logoImage,
                                             
            colorFilter: ColorFilter.mode(
                AppColors.appGreen.withOpacity(0.12), 
                BlendMode.srcIn,
              ),),
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight(context) * 0.013,),
              Container(
                height: 78,
                width: 78,
                decoration:const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.appGreen
                ),
                child: SvgPicture.asset(scanIcon,fit: BoxFit.scaleDown,),
              ),
               SizedBox(height: screenHeight(context) * 0.1,),
               Text('CertCheck',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: screenWidth(context) * 0.05),),
             const  Text('Try it out now',style: TextStyle(color: Colors.white),),
            ],
          ),
        )
      ],
    );
  }
}

