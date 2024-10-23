import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
//Colors
class AppColors {
  static const appDark = Color(0xff292D32);
  static const appGreen = Color(0xFF64FF6A);
}
//images and icons
const String logoImage='assets/images/visibly-logo.svg';
const String searchIcon='assets/images/search-icon.svg';
const String scanIcon='assets/images/scan-icon.svg';
const String accreditCheckIcon='assets/images/accredit-check.svg';
const String certificateIcon='assets/images/certificate-icon.svg';
const String approvedIcon='assets/images/approved-icon.svg';
//fonts
const String clashDisplay='ClashDisplay';
//supabase
// It's handy to then extract the Supabase client in a variable for later uses
final supabase = Supabase.instance.client;
final supabaseStorage= supabase.storage.from('profiles');
//firebase auth error messages
const String weakPassword='weak-password';
const String emailAlreadyInUse='email-already-in-use';
const String userNotFound='user-not-found';
const String wrongPassword='wrong-password';
//general error message
const String somethingWentWrong='Something went wrong';
//initialize supabase
String initializeSupabaseUrl=dotenv.env['INITIALIZE_SUPABASE']!;
//Request headers
Map<String, String> get headers {

  return {
    "Content-Type": "application/json",
  };
}

//Errors
const noInternet = 100;
const apiError = 101;
const unknownError = 103;
const emptyFieldError = 104;
const unauthorizedError = 401;

//success and failure codes
const successCode = 200;
const successCreated = 201;
const successCodes = [200, 201, 202, 204];
const failureCodes = [400, 401, 402, 404, 500, 503];
