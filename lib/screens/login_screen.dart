import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../services/auth_service.dart';
import '../utils/common_functions.dart';
import '../utils/constants.dart';
import '../widgets/common_button.dart';
import '../widgets/common_text_field.dart';
import '../widgets/sign_up_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading=false;
  final _formKey = GlobalKey<FormState>();


  // You can store form field values here
  String? _email;
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
              _email = value;
                 },validator: (val)=>validateEmail(val),),
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
                  _isLoading? const CommonButton(label: 'Loading...',
                    
                                  ) :GestureDetector(
                        onTap: ()async{
              if (_formKey.currentState!.validate()) {
                setState(() {
                  _isLoading=true;
                });
                        // If the form is valid, proceed with the action
                        log('Form is valid. Email: $_email, Password: $_password');
                        // You can proceed to sign the user in or perform another action
                         await AuthService.signIn(password: _password!,email: _email!,context: context).then((value){
setState(() {
                  _isLoading=false;
                });
                      });
                      } else {
                        // If the form is not valid, do nothing or show an error
                        log('Form is not valid');
                      }
                  },
                    child:const CommonButton(label: 'Sign in',
                    
                                  ),
                  ),
                    SizedBox(
                    height: screenHeight(context) * .01,
                  ),
     
               
                 SizedBox(
                    height: screenHeight(context) * .11,
                  ),
                const  SignUpText()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

