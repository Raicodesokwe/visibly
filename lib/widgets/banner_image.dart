import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/common_functions.dart';
import '../utils/constants.dart';
import 'common_button.dart';

class BannerImage extends StatelessWidget {
  const BannerImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.appDark,
      borderRadius: BorderRadius.circular(25)
    ),
    child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: screenWidth(context) * .035),
      child: Row(
        
        children: [
          SvgPicture.asset(certificateIcon,fit: BoxFit.scaleDown,),
          SizedBox(width: screenWidth(context) * .2,
            child: SvgPicture.asset(logoImage,fit: BoxFit.scaleDown,)),
           const Spacer(),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
             children: [
               Text('Skills passport',style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: screenWidth(context) * .045
               ),),
               SizedBox(height: screenHeight(context) * .009,),
               SizedBox(
                width: screenWidth(context) * .3,
                child:const Text('Check the UK\'s train and accreditation data',
                style: TextStyle(color: Colors.white),)),
                 SizedBox(height: screenHeight(context) * .009,),
                 CommonButton(
                  height: 30,
                  width: screenWidth(context) * .3,
                  label: 'Check now',
                  fontSize: screenWidth(context) *.035,
                 )
             ],
           )
        ],
      ),
    ),
    );
  }
}

