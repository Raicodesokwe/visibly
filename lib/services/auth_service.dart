import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:visibly/screens/home_screen.dart';
import 'package:visibly/utils/common_functions.dart';
import 'package:visibly/utils/constants.dart';
import 'package:visibly/utils/navigation_utils.dart';

class AuthService{
  static Future<void> signUp({
required String email,
required String password,
required BuildContext context,
  })async{
 
try{
  
await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) {
  showToast('User signed up successfully');
  Future.delayed(const Duration(seconds: 1));
  openReplaceScreen(context,const HomeScreen());
} 

);
} on FirebaseAuthException catch(e){
String message='';
if(e.code==weakPassword){
  message='Password provided is too weak';
}else if(e.code==emailAlreadyInUse){
  message='An account with that email already exists';
}
showToast(message);
}catch(e){
  log(e.toString());
showToast('$e');
}
  }
static Future<void> signIn({
required String email,
required String password,
required BuildContext context,
  })async{
 
try{
  
await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
   Future.delayed(const Duration(seconds: 1));
  openReplaceScreen(context,const HomeScreen());
});
} on FirebaseAuthException catch(e){
String message='';
if(e.code==wrongPassword){
  message='Password provided is wrong';
}else if(e.code==userNotFound){
  message='User not found for that email';
}
showToast(message);
}catch(e){
  log(e.toString());
showToast('$e');
}
  }
}