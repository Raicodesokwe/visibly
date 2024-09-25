import 'package:flutter/material.dart';
import 'package:visibly/utils/common_functions.dart';
import 'package:visibly/utils/constants.dart';
import 'package:visibly/utils/navigation_utils.dart';

import '../widgets/accreditation_list.dart';

class AccreditationsScreen extends StatefulWidget {
  const AccreditationsScreen({super.key});

  @override
  State<AccreditationsScreen> createState() => _AccreditationsScreenState();
}

class _AccreditationsScreenState extends State<AccreditationsScreen> with SingleTickerProviderStateMixin{
  late AnimationController _slideController;
late Animation<Offset> _offsetAnimation;
final Duration animDuration = const Duration(milliseconds: 250);
int touchedIndex = -1;

@override
void initState() {
  _slideController =
      AnimationController(duration: const Duration(seconds: 1), vsync: this)
        ..forward();

  // Configure the SlideTransition animation
  _offsetAnimation = Tween<Offset>(begin: const Offset(0.0, 0.5), end: Offset.zero)
      .animate(CurvedAnimation(
        parent: _slideController,
        curve: Curves.easeIn,
      ));
  super.initState();
  
  
}

@override
void dispose() {
  _slideController.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SlideTransition(
            position: _offsetAnimation,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                  SizedBox(height: screenHeight(context) * .04,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          navigationPop(context);
                        },
                        child:const Icon(Icons.keyboard_arrow_left,color: AppColors.appDark,)),
                        const Spacer(),
                        SizedBox(
                          width: screenWidth(context) * .7,
                          child: Text('Here is a sample of accreditation standards for various industries',style: TextStyle(fontFamily: clashDisplay,
                          fontSize: 20,
                          color: AppColors.appDark.withOpacity(0.8),
                          fontWeight: FontWeight.w600
                          ),),
                        ),
                        const Spacer(),
                    ],
                  ),
                    SizedBox(height: screenHeight(context) * .04,),
              const AccreditationList(),
                SizedBox(height: screenHeight(context) * .04,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

