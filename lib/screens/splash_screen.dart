import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:visibly/screens/home_screen.dart';
import 'package:visibly/utils/common_functions.dart';
import 'package:visibly/utils/constants.dart';
import 'package:visibly/utils/navigation_utils.dart';
import 'package:visibly/widgets/common_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appDark,
        body: Column(
          children: [
            SizedBox(height: screenHeight(context) * 0.05,),
            Center(child: SvgPicture.asset(logoImage)),
             SizedBox(height: screenHeight(context) * 0.025,),
             Text('Visibly',style: TextStyle(
              fontFamily: clashDisplay,
              fontSize: screenWidth(context) * 0.1,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows:const [
                 Shadow(color: AppColors.appGreen, blurRadius: 23),
              ]
             ),),
               SizedBox(height: screenHeight(context) * 0.05,),
              const Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 20),
                 child: Text('Understand, meet & improve training & accreditation standards- no matter your industry',style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: clashDisplay,
                  fontSize: 25
                 ),),
               ),
                SizedBox(height: screenHeight(context) * 0.05,),
              const  Padding(padding:  EdgeInsets.symmetric(horizontal: 20),
                child: Text('The Visibly Skills Passport is the only centralized database for the UK\'s training and accreditation data',style: TextStyle(color: Colors.white),),
                ),
                 SizedBox(height: screenHeight(context) * 0.12,),
GestureDetector(
  onTap: (){
    openScreen(context,const HomeScreen());
  },
  child:const CommonButton(),
)
          ],
        ),
      ),
    );
  }
}

