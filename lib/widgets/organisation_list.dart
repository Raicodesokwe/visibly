import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../models/organisation_model.dart';
import '../utils/common_functions.dart';
import '../utils/constants.dart';

class OrganisationList extends StatelessWidget {
  const OrganisationList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 15,
                              direction: Axis.vertical,
                                         children: List.generate(organisationList.length, (index) => AnimationConfiguration.staggeredList(
                                           position: index,
             duration: const Duration(seconds: 1),
                                           child: SlideAnimation(
                                             verticalOffset: 50.0,
                                             child: Container(
                                              height: 60,
                                              width: screenWidth(context) * .85,
                                              decoration: BoxDecoration(
                                                color: AppColors.appGreen.withOpacity(0.14),
                                                borderRadius: BorderRadius.circular(30)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                child: Row(children: [
                                                  Container(
                                                   height: 40,
                                                   width: 40,
                                                   decoration:const BoxDecoration(
                                                     shape: BoxShape.circle,
                                                     color: AppColors.appDark
                                                   ),
                                                   child: SvgPicture.asset(approvedIcon,fit: BoxFit.scaleDown,),
                                                  ),
                                                  const SizedBox(width: 20,),
                                                  Text(organisationList[index].label,style:const TextStyle(fontWeight: FontWeight.w500),),
                                                  const Spacer(),
                                                 const Icon(Icons.keyboard_arrow_right,color: AppColors.appDark,)
                                                ],),
                                              ),
                                             ),
                                           ),
                                         )),       ),
    );
  }
}

