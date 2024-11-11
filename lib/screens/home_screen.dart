import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:visibly/screens/accreditations_screen.dart';
import 'package:chat_supabase/chat_supabase.dart';
import 'package:visibly/services/auth_service.dart';
import 'package:visibly/utils/common_functions.dart';
import 'package:visibly/utils/constants.dart';
import 'package:visibly/utils/navigation_utils.dart';

import '../widgets/banner_image.dart';
import '../widgets/cert_check.dart';
import '../widgets/green_menu.dart';
import '../widgets/organisation_list.dart';
import '../widgets/search_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
   late AnimationController controller;
  late Animation<double> fadeAnimation;
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
   controller =
        AnimationController(vsync: this, duration:const Duration(milliseconds: 200));
    fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(controller);
    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    scaleAnimation =
        CurvedAnimation(parent: scaleController, curve: Curves.elasticInOut);
    Future.delayed(const Duration(milliseconds: 600), () {
      controller.forward().then((value) => scaleController.forward());
    });
    super.initState();
   
  }

  @override
  void dispose() {
    controller.dispose();
    scaleController.dispose();
    super.dispose();
    
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.appDark,
          onPressed: (){
            openScreen(context, ChatScreen(channelName: 'mojito',userIdentifier: FirebaseAuth.instance.currentUser!.uid,));
          },
        child:const Icon(Icons.chat_rounded,color: AppColors.appGreen,),
        ),
        body: FadeTransition(
            opacity: fadeAnimation,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: screenWidth(context) * .045),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight(context) * 0.05,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Hi there,',style: TextStyle(
                        fontFamily: clashDisplay,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.appDark.withOpacity(0.87)
                      ),),
                     GestureDetector(
                      onTap: (){
                        AuthService.signOut( context: context);
                      },
                      child: const Icon(Icons.logout))
                    ],
                  ),
                  SizedBox(height: screenHeight(context) * 0.007,),
                const  Text('Search through our database of accredited institutions',style: TextStyle(
                    color: AppColors.appDark
                  ),),
                  SizedBox(height: screenHeight(context) * 0.012,),
                const   SearchBox(),
                               SizedBox(
                                 height: screenHeight(context)* 0.02,
                               ),
                               Row(
                                children: [
                                ScaleTransition(
                                  scale: scaleAnimation,
                                  child: const  CertCheck()),
                                  const Spacer(),
                                Column(
                                  children: [
                                    ScaleTransition(
                                      scale: scaleAnimation,
                                      child: GestureDetector(
                                        onTap: (){
                                          openScreen(context,const AccreditationsScreen());
                                        },
                                        child: const  GreenMenu(icon: accreditCheckIcon,label: 'Accreditations',))),
                                    SizedBox(
                                            height: screenHeight(context) * .012,
                                          ),
                                           ScaleTransition(
                                            scale: scaleAnimation,
                                            child: const  GreenMenu(icon: accreditCheckIcon,label: 'Training & Advisory',)),
                                  ],
                                ),
                                   
                                ],
                               ),
                               SizedBox(
                                            height: screenHeight(context) * .017,
                                          ),
                                       const   BannerImage(),
                                       SizedBox(
                                            height: screenHeight(context) * .017,
                                          ),
                                          Row(
                                            children: [
                                             const Text('Searched organizations',style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                                color: AppColors.appDark
                                              ),),
                                             const Spacer(),
                                              Text('See all',style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                                color: AppColors.appDark.withOpacity(0.77)
                                              ),),
                                            ],
                                          ),
                                           SizedBox(
                                            height: screenHeight(context) * .017,
                                          ),
                                        const  OrganisationList(),
                                             SizedBox(
                                            height: screenHeight(context) * .027,
                                          ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

