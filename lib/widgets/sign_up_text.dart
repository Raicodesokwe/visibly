import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:visibly/screens/sign_up_screen.dart';
import 'package:visibly/utils/navigation_utils.dart';

import '../utils/constants.dart';


class SignUpText extends StatefulWidget {
  const SignUpText({
    super.key,
  });

  @override
  State<SignUpText> createState() => _SignUpTextState();
}

class _SignUpTextState extends State<SignUpText> {
    late TapGestureRecognizer _tapRecognizer;
    @override
  void initState() {
    super.initState();
    _tapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        
        // You can navigate to the signup screen or perform any action
       openScreen(context,const SignupScreen());
      };
  }

  @override
  void dispose() {
    _tapRecognizer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            style:const TextStyle(
                fontSize: 15, color: Colors.white70),
            children: [
        									
        								const	TextSpan(text: 'Don\'t have an account? '),
        									TextSpan(text: 'Sign up',recognizer: _tapRecognizer,style:const  TextStyle(
                      color: AppColors.appGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
        									
        									]));
  }
}
