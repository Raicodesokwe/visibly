import 'package:flutter/material.dart';
import 'package:visibly/widgets/common_button.dart';

import '../models/accreditation_model.dart';
import '../utils/common_functions.dart';
import '../utils/constants.dart';

class AccreditationList extends StatelessWidget {
  const AccreditationList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 15,
                        direction: Axis.vertical,
        children: List.generate(accreditationList.length, (index) => Container(
          width: screenWidth(context) * .85,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: index==0?AppColors.appGreen.withOpacity(0.2):AppColors.appDark.withOpacity(0.03),
            border: Border.all(color: index==0?Colors.black.withOpacity(.5):Colors.black.withOpacity(.06),
            
            ),
            borderRadius: BorderRadius.circular(25)
          ),
          child: Row(
            children: [
              Container(
    height: 68,
    width: 68,
    decoration:const BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.appDark
    ),
    child: Center(
      child: Text(accreditationList[index].number,style:const TextStyle(
        color: Colors.white,
        fontFamily: clashDisplay,
        fontWeight: FontWeight.w600,
        fontSize: 20
      ),),
    ),
              ),
              const Spacer(),
              Column(
    children: [
      SizedBox(
        width: screenWidth(context) * .45,
        child: Text(accreditationList[index].title,style:const TextStyle(fontWeight: FontWeight.w700,color: AppColors.appDark),)),
        SizedBox(height: screenHeight(context) * .02,),
          SizedBox(
        width: screenWidth(context) * .45,
        child: Text(accreditationList[index].description)),
        SizedBox(height: screenHeight(context) * .02,),
        CommonButton(
          color: AppColors.appDark,
          fontColor: Colors.white,
          label: 'View more',
       fontSize: 14,
       height: 30,
       width: screenWidth(context)*.3,
        )
    ],
              )
            ],
          ),
        )),
      ),
    );
  }
}