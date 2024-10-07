import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/common_functions.dart';
import '../utils/constants.dart';
import '../widgets/common_button.dart';
import '../widgets/common_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  
  final _formKey = GlobalKey<FormState>();


  // You can store form field values here
  String? _username;
  String? _password;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         backgroundColor: AppColors.appDark,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
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
                  CommonTextField(hintText: 'Email',onChanged: (value){
              _username = value;
                 },validator: (val)=>validateUserName(val),),
                  SizedBox(
                    height: screenHeight(context) * .05,
                  ),
                   CommonTextField(
                    validator: (val)=>validatePassword(val),
                    hintText: 'Password',obscureText: true,onChanged: (value){
              _password=value;
                 }),
                    SizedBox(
                    height: screenHeight(context) * .06,
                  ),
                  GestureDetector(
                        onTap: ()async{
              if (_formKey.currentState!.validate()) {
                        // If the form is valid, proceed with the action
                        log('Form is valid. Username: $_username, Password: $_password');
                        // You can proceed to sign the user in or perform another action
                      final authResponse= await supabase.auth.signUp(password: _password!,email: _username);
                      } else {
                        // If the form is not valid, do nothing or show an error
                        log('Form is not valid');
                      }
                  },
                    child:const CommonButton(label: 'Sign up',
                    
                                  ),
                  ),
                    SizedBox(
                    height: screenHeight(context) * .01,
                  ),
     
               
                 SizedBox(
                    height: screenHeight(context) * .11,
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

