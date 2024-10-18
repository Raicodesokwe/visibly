import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:visibly/screens/home_screen.dart';
import 'package:visibly/screens/login_screen.dart';
import 'package:visibly/utils/common_functions.dart';
import 'package:visibly/utils/constants.dart';
import 'package:visibly/utils/navigation_utils.dart';

import '../screens/splash_screen.dart';

class AuthService{
  static Future<void> signUp({
required String email,
required String password,
required BuildContext context,
  })async{
 
try{
  
await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) {
  showToast('User signed up successfully');
 
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
static Future<void> signOut({
required BuildContext context,
  })async{
 
try{
  
await FirebaseAuth.instance.signOut(
  
).then((value) {
   Future.delayed(const Duration(seconds: 1));
  openReplaceScreen(context,const LoginScreen());
});
}catch(e){
  log(e.toString());
showToast('$e');
}
  }
static  StreamBuilder<User?> checkAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting||!snapshot.hasData){
         return const SplashScreen();
        }
        return const HomeScreen();
      }
    );
  }
}