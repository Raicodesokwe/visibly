import 'dart:developer';
import 'dart:io';
import 'package:chat_supabase/chat_supabase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:visibly/services/auth_service.dart';
import 'package:visibly/widgets/user_image_picker.dart';
import '../utils/common_functions.dart';
import '../utils/constants.dart';
import '../utils/navigation_utils.dart';
import '../widgets/common_button.dart';
import '../widgets/common_text_field.dart';
import 'home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isLoading=false;
  final _formKey = GlobalKey<FormState>();
  File? _selectedImage;
  // You can store form field values here
  String? _email;
  String? _password;
  String? _username;
  
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
            SizedBox(
              height: screenHeight(context) * 0.15,
              child: Center(child: SvgPicture.asset(logoImage))),
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
                   UserImagePicker(onPickImage: (pickedImage){
_selectedImage=pickedImage;
                  },),
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
                  CommonTextField(
                    validator: (val)=>validateUserName(val),
                    hintText: 'Username',onChanged: (value){
              _username=value;
                 }),
                    SizedBox(
                    height: screenHeight(context) * .06,
                  ),
                _isLoading? const CommonButton(label: 'Loading...',
                    
                                  ) :GestureDetector(
                        onTap: ()async{
                          if(_selectedImage==null){
                            showToast('Please pick an image');
                          }
             else if (_formKey.currentState!.validate()) {
                setState(() {
                  _isLoading=true;
                });
               
                        // If the form is valid, proceed with the action
                        log('Form is valid. Email: $_email, Password: $_password');
                        // You can proceed to sign the user in or perform another action
                       await AuthService.signUp(password: _password!,email: _email!,context: context);
                           final uid=FirebaseAuth.instance.currentUser!.uid;
                           await createChatUserProfile(userIdentifier: uid,username: _username!,selectedImage: _selectedImage!);  // Add condition to update where id matches the Firebase UID
      
setState(() {
                  _isLoading=false;
                });
                    Future.delayed(const Duration(seconds: 1));
  if(mounted){
    openReplaceScreen(context,const HomeScreen()); 
  }    

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